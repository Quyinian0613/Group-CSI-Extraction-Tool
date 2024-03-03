
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <inttypes.h>
#include "esp_pthread.h"

#include <string.h>
#include <sys/param.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"

#include "dhcpserver/dhcpserver.h"
#include "lwip/dns.h"
#include "lwip/err.h"
#include "lwip/ip_addr.h"
#include "lwip/netdb.h"
#include "lwip/sys.h"
#include "structures.h"
#include "math.h"

#include "tcpip_adapter.h"
#include "protocol_examples_common.h"

#include "Queue.h"

#include "freertos/queue.h"
#include "driver/uart.h"

#define EXAMPLE_ESP_WIFI_SSID "SSID_QUYINIAN" // AP SSID name
#define EXAMPLE_ESP_WIFI_PASS ""				// AP password
#define LEN_MAC_ADDR 20
#define LEN_IP_ADDR 14 //
#define THIS_IP "192.168.4" //
#define CSI_DATA_LEN 384
#define MAX_STA_CONN 10
#define GET_IP_THRESHOLD 1 //
#define NODES_NUM 3                              // the number of STAs
#define SUM_NUM (NODES_NUM + 1)

#define EX_UART_NUM UART_NUM_0
#define PATTERN_CHR_NUM    (3)         /*!< Set the number of consecutive and identical characters received by receiver which defines a UART pattern*/
#define BUF_SIZE (1024)
#define RD_BUF_SIZE (BUF_SIZE)
#define BAUD_RATE	    		115200

static const int PORT = 3278;
static int sock_num = 0;

static int serial_num_sync_flag[NODES_NUM] = {0};

static const char *WIFI_EVENT_TAG = "WIFI_EVENT";//
static const char *IP_EVENT_TAG = "IP_EVENT";
static const char *AP_TAG = "wifi softAP";
static const char *RECV_CSI_CB_TAG = "recv csi cb";
static const char *SOCKET_TAG = "SOCKET";
static const char *EPOLL_TAG = "SEND";
static const char *WORK_TAG = "WORK THREAD";
static const char *CONTROL_TAG = "CONTROL THREAD";
static const char *TAG = "wifi softAP";

static QueueHandle_t uart0_queue;

esp_netif_sta_list_t sta_list_info; // sta mac and ip
wifi_sta_list_t sta_list_mac;		// sta mac

typedef struct {
    char mac_addr[LEN_MAC_ADDR];
    //char ip_addr[LEN_IP_ADDR];
    uint32_t ip_addr;
    uint8_t serial_num;
    struct sockaddr_in dest_addr;
    int sockfd;
    int sock_status;
    int online;
    int disconn;

} DeviceInfo;

DeviceInfo* stas_info[NODES_NUM] = {NULL};

Queue* working_que;
static int online_num = 0;

static pthread_mutex_t mtxs[SUM_NUM];
static pthread_mutex_t que_mtx;
static pthread_cond_t conds[SUM_NUM];
static int flags[SUM_NUM] = {0};


/**
* 
*/
static void wifi_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data)
{
	if (event_id == WIFI_EVENT_AP_STACONNECTED)
	{
		wifi_event_ap_staconnected_t *event = (wifi_event_ap_staconnected_t *)event_data;
        //ESP_LOGI(WIFI_EVENT_TAG, "Station " MACSTR " connected, AID=%d\n", MAC2STR(event->mac), event->aid);
		ESP_ERROR_CHECK(esp_wifi_ap_get_sta_list(&sta_list_mac));

        uint8_t idx = event->mac[5];
        if (idx > 0 && idx <= NODES_NUM) {
            stas_info[idx - 1]->online = 1;
            // pthread_mutex_lock(&que_mtx);
            // QueuePush(working_que, idx);
            // pthread_mutex_unlock(&que_mtx);
        }
        
	}
	else if (event_id == WIFI_EVENT_AP_STADISCONNECTED)
	{
		wifi_event_ap_stadisconnected_t *event = (wifi_event_ap_stadisconnected_t *)event_data;
		//ESP_LOGI(WIFI_EVENT_TAG, "Station " MACSTR " leave, AID=%d\n", MAC2STR(event->mac), event->aid);
		ESP_ERROR_CHECK(esp_wifi_ap_get_sta_list(&sta_list_mac));

        uint8_t idx = event->mac[5];
        stas_info[idx - 1]->online = 0;

        pthread_mutex_lock(&que_mtx);
        while (!QueueEmpty(working_que)) {
            QueuePop(working_que);
        }
        online_num = sta_list_mac.num;
        for (int i = 0; i < online_num; i++) {
            idx = sta_list_mac.sta[i].mac[5];
            QueuePush(working_que, idx);
        }
        pthread_mutex_unlock(&que_mtx);

		
        //stas_info[idx - 1]->disconn++;
	}
}

/**

*/
static void ip_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data)
{

	if (event_id == IP_EVENT_AP_STAIPASSIGNED)
	{
		for (int i = 0; i < GET_IP_THRESHOLD; ++i)
		{
			ESP_ERROR_CHECK(esp_netif_get_sta_list(&sta_list_mac, &sta_list_info));
			online_num = sta_list_mac.num;

            pthread_mutex_lock(&que_mtx);
            while (!QueueEmpty(working_que)) {
                QueuePop(working_que);
            }
			for (int j = 0; j < online_num; ++j)
			{
				uint8_t idx = sta_list_mac.sta[j].mac[5];
                QueuePush(working_que, idx);

                stas_info[idx - 1]->ip_addr = sta_list_info.sta[j].ip.addr;
                // if (stas_info[idx - 1]->sock_status != 1) {
                //     stas_info[idx - 1]->sock_status = 0;
                // }
                sprintf(stas_info[idx - 1]->mac_addr, "%02X:%02X:%02X:%02X:%02X:%02X", sta_list_mac.sta[j].mac[0], sta_list_mac.sta[j].mac[1], 
                        sta_list_mac.sta[j].mac[2], sta_list_mac.sta[j].mac[3], sta_list_mac.sta[j].mac[4], sta_list_mac.sta[j].mac[5]);

                //inet_ntoa_r(sta_list_info.sta[j].ip.addr, stas_info[sta_idx]->ip_addr, LEN_IP_ADDR - 1);
                //printf("STA %d, IP = %"PRIx32" --------------------------------\n", idx, stas_info[idx - 1]->ip_addr);

			}
            pthread_mutex_unlock(&que_mtx);
            //ESP_LOGI(IP_EVENT_TAG, "IP HANDLER...........");
		}
	}
}

void receive_csi_cb(void *ctx, wifi_csi_info_t *data)
{
	wifi_csi_info_t received = data[0];

	char senddMacChr[LEN_MAC_ADDR] = {0}; // Sender
	sprintf(senddMacChr, "%02X:%02X:%02X:%02X:%02X:%02X", received.mac[0], received.mac[1], received.mac[2], received.mac[3], received.mac[4], received.mac[5]);
	printf("Received mac: %s\n", senddMacChr);

    uint8_t idx = received.mac[5];
    if (idx > NODES_NUM || idx < 1) return;               // chech the last mac

    if(strcmp(senddMacChr, stas_info[idx - 1]->mac_addr) == 0)
	{
        if (serial_num_sync_flag[idx - 1] == 1) {
            int8_t* my_ptr = received.buf;

            printf("device%d,%d,%d,%d,%d,%d,", idx, (stas_info[idx - 1]->serial_num - 1 + 256) % 256, received.len, received.rx_ctrl.rssi, received.rx_ctrl.noise_floor, received.rx_ctrl.rx_state);
            for(int i = 0; i < received.len; i += 2)
            {
                int8_t imag = my_ptr[i];
                int8_t real = my_ptr[i+1];
                printf("%d,%d,", real, imag);
            }
            printf("\n\n");
            
        }
        else {
            serial_num_sync_flag[idx - 1] = 1;
        }
        stas_info[idx - 1]->serial_num++;

	} else {
        printf("receive_csi_cb:receiv00ed and dropped from %s\n", senddMacChr);
	}
}


void* control(void* arg) {
    int index = *(int*)arg;                // 0
    int sta_idx;
    //ESP_ERROR_CHECK(esp_wifi_set_csi_rx_cb(&receive_csi_cb, NULL));

    while (1) {
        pthread_mutex_lock(&mtxs[index]);
        while (flags[index] != index) {
            pthread_cond_wait(&conds[index], &mtxs[index]);
        }
        
        ESP_LOGI(CONTROL_TAG, "cond fill ------------------------------------------");

        pthread_mutex_lock(&que_mtx);
        if (QueueEmpty(working_que)) {
            pthread_mutex_unlock(&mtxs[index]);
            pthread_mutex_unlock(&que_mtx);
            printf("Control thread: working_que is empty ***************************\n");
            usleep(2 * 1e6);
            continue;
        }

        sta_idx = QueueFront(working_que);
        QueuePop(working_que);
        QueuePush(working_que, sta_idx);
        pthread_mutex_unlock(&que_mtx);

        printf("Queue size: %d     QueueFront: %d \n", QueueSize(working_que), sta_idx);
        
        flags[sta_idx] = sta_idx;
        flags[index] = -1;                  // waitting other thread to wakeup

        ESP_LOGI(CONTROL_TAG, "Work thread %d is wakeup ------------------------------------------", sta_idx);

        pthread_mutex_unlock(&mtxs[index]);
        pthread_cond_signal(&conds[sta_idx]);
    
    }
}

void* work_thread(void* arg) {
    int index = *(int*)arg;
    DeviceInfo* info = stas_info[index - 1];
    char addr_str[128];

    while (1) {
        pthread_mutex_lock(&mtxs[index]);
        while (flags[index] != index) {
            pthread_cond_wait(&conds[index], &mtxs[index]);
        }
        ESP_LOGI(WORK_TAG, "Work_thread %d: cond fill ------------------------------------------", index);

        if (info->online == 1) {
            info->dest_addr.sin_addr.s_addr = info->ip_addr;
            info->dest_addr.sin_family = AF_INET;
            info->dest_addr.sin_port = htons(PORT);
            inet_ntoa_r(info->dest_addr.sin_addr, addr_str, sizeof(addr_str) - 1);
            //printf("STA %d , IP is %s----------------------------------\n", index, addr_str);

            if (info->sock_status == 0) {
                info->sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
                if (info->sockfd < 0) {
                    fprintf(stderr,"Thread %d create socket: %s\n\n", index, strerror(errno));
                    // TODO: change to other thread
                    pthread_mutex_unlock(&mtxs[index]);
                    continue;
                }
                else {
                    printf("Work_thread %d create socket === %d === succ...****************************\n", index, ++sock_num);
                }
                info->sock_status = 1;
            }
            else {
                printf("Work_thread %d sendto sta %d, ip = %s data = %d *********************************\n", index, index, addr_str, info->serial_num);
                int ret = sendto(info->sockfd, &info->serial_num, sizeof(uint8_t), 0, (struct sockaddr*)&info->dest_addr, sizeof(info->dest_addr));
                if (ret < 0) {
                    printf("Work_thread %d send data error... ***********************************\n", index);
                }
                else {
                    //ESP_LOGI(EPOLL_TAG, "Work_thread send to sta_%d succ...", index);
                }
            }
        }
        else {
            printf("Sta %d is not online....\n", index);
        }
        
        flags[index] = -1;
        flags[0] = 0;

        vTaskDelay(150 / portTICK_PERIOD_MS);
        
        ESP_LOGI(WORK_TAG, "%d : control thread is wakeup ------------------------------------------", index);

        pthread_mutex_unlock(&mtxs[index]);
        pthread_cond_signal(&conds[0]);

    }
}

static void ap_task()
{
    int res;
    pthread_t tds[NODES_NUM + 1];
    for (int i = 0; i <= NODES_NUM; i++) {
        res = pthread_mutex_init(&mtxs[i], NULL);
        assert(res == 0);
        res = pthread_cond_init(&conds[i], NULL);
        assert(res == 0);
    }
    res = pthread_mutex_init(&que_mtx, NULL);
    assert(res == 0);

    for (int i = 0; i <= NODES_NUM; i++) {
        if (i == 0) {
            res = pthread_create(&tds[0], NULL, control, &i);
            assert(res == 0);
        }
        else {
            res = pthread_create(&tds[i], NULL, work_thread, &i);
            assert(res == 0);
        }
        printf("Create thread 0x%"PRIx32" ================================\n", tds[i]);
    }

	for (int i = 0; i <= NODES_NUM; i++) {
        res = pthread_join(tds[i], NULL);
        assert(res == 0);
    }
}



/*
 * Setting up a WiFi AP
 */
void wifi_init_softap(void)
{
	tcpip_adapter_init();

	ESP_ERROR_CHECK(esp_event_loop_create_default());

	wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
	cfg.csi_enable = 1;
	ESP_ERROR_CHECK(esp_wifi_init(&cfg));

	ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
	ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, ESP_EVENT_ANY_ID, &ip_event_handler, NULL));

	wifi_config_t wifi_config =
		{
			.ap =
				{
					.ssid = EXAMPLE_ESP_WIFI_SSID,
					.ssid_len = strlen(EXAMPLE_ESP_WIFI_SSID),
					.password = EXAMPLE_ESP_WIFI_PASS,
					.max_connection = MAX_STA_CONN,
					.authmode = WIFI_AUTH_OPEN
                },
		};

	ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));

	ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &wifi_config));

	// ESP_ERROR_CHECK(esp_wifi_set_protocol(ESP_IF_WIFI_AP, WIFI_PROTOCOL_11B | WIFI_PROTOCOL_11G | WIFI_PROTOCOL_11N));

	// Set a fixed MAC, Tx AMPDU has to be disabled
	uint8_t mac[6] = {0x24, 0x00, 0x00, 0x00, 0x00, 0x00};
	ESP_ERROR_CHECK(esp_wifi_set_mac(ESP_IF_WIFI_AP, mac));

	ESP_ERROR_CHECK(esp_wifi_start());

	ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
	ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, ESP_EVENT_ANY_ID, &ip_event_handler, NULL));

	// set wifi chanel
	uint8_t primary = 13;
	ESP_ERROR_CHECK(esp_wifi_set_channel(primary, WIFI_SECOND_CHAN_NONE));

	// Close wifi power saving mode
	esp_wifi_set_ps(WIFI_PS_NONE);

	// esp_wifi_set_inactive_time(WIFI_IF_AP, 12);

	wifi_promiscuous_filter_t filer_promi;
	wifi_promiscuous_filter_t filer_promi_ctrl;

	uint32_t filter_promi_field = (0xFFFFFF82);
	uint32_t filter_promi_ctrl_field = (0x22000000);

	uint32_t filter_event = WIFI_EVENT_MASK_ALL;

	filer_promi.filter_mask = filter_promi_field;
	filer_promi_ctrl.filter_mask = filter_promi_ctrl_field;

	esp_wifi_set_promiscuous_filter(&filer_promi);
	esp_wifi_set_event_mask(filter_event);
	esp_wifi_set_promiscuous_ctrl_filter(&filer_promi_ctrl);

	ESP_ERROR_CHECK(esp_wifi_set_promiscuous(true));

	ESP_ERROR_CHECK(esp_wifi_set_csi(1));

	// Set CSI configuration to whatever suits you best
	wifi_csi_config_t configuration_csi;
	configuration_csi.lltf_en = 1;
	configuration_csi.htltf_en = 1;
	configuration_csi.stbc_htltf2_en = 1;
	configuration_csi.ltf_merge_en = 1;
	configuration_csi.channel_filter_en = 0;
	configuration_csi.manu_scale = 0;
	// configuration_csi.shift = 0;

	ESP_ERROR_CHECK(esp_wifi_set_csi_config(&configuration_csi));

	ESP_ERROR_CHECK(esp_wifi_set_csi_rx_cb(&receive_csi_cb, NULL));

	uint8_t mac_AP[6];
	ESP_ERROR_CHECK(esp_wifi_get_mac(ESP_IF_WIFI_AP, mac_AP));
	char mac_AP_str[LEN_MAC_ADDR] = {0};
	sprintf(mac_AP_str, "%02X:%02X:%02X:%02X:%02X:%02X", mac_AP[0], mac_AP[1], mac_AP[2], mac_AP[3], mac_AP[4], mac_AP[5]);

	ap_task();
}

int value_check (uint8_t* dtmp)
{
	int len = sizeof(*dtmp);
	if(len <= 0) {
		return 0;
	} 

	for(int i = 0; i < len; i++) {
		if(!isdigit(dtmp[i])) {
			return 0;
		}
	}
	return 1;
}


void app_main() {

    esp_err_t ret = nvs_flash_init();
	if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
	{
		ESP_ERROR_CHECK(nvs_flash_erase());
		ret = nvs_flash_init();
	}
	ESP_ERROR_CHECK(ret);
    uart_init_c();

    working_que = (Queue*)malloc(sizeof(Queue));
    QueueInit(working_que);

    for (int i = 0; i < NODES_NUM; i++) {
        stas_info[i] = (DeviceInfo*)malloc(sizeof(DeviceInfo));
        stas_info[i]->serial_num = 0;
        stas_info[i]->sock_status = 0;
    }

	wifi_init_softap();

}
