/* Sniffing WiFi Station / UDP client who prints out CSI values which describe the channel
   between both ESP32 boards (client and server)

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <string.h>
#include <sys/param.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "tcpip_adapter.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include <lwip/netdb.h>
#include "structures.h"
#include "math.h"

#include "scan.h"

#define EXAMPLE_ESP_WIFI_SSID "SSID_QUYINIAN" // connect to specified AP
#define EXAMPLE_ESP_WIFI_PASS ""				// with specified password
#define HOST_IP_ADDR "192.168.4.1"				
#define PORT 3278								// or any other unused port, but same as the one used by the UDP server
#define EXAMPLE_ESP_MAXIMUM_RETRY 20
#define LEN_MAC_ADDR 20

#define CSI_DATA_LEN 128

/* FreeRTOS event group to signal when we are connected*/
static EventGroupHandle_t s_wifi_event_group;

/* The event group allows multiple bits for each event, but we only care about one event
 * - are we connected to the AP with an IP? */
const int WIFI_CONNECTED_BIT = BIT0;

static uint8_t serial_num = 0;	   // serial number of csi_recv
static uint8_t serial_num_pre = 0; // serial number of csi_recv
static int s_retry_num = 0;

static int rssi_pre = 0;
static int socket_ok = 0;
static int get_ip = 0;


int8_t csi_buf_pre[CSI_DATA_LEN];
static int first_csi = 1;

static void event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data)
{
	if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START)
	{
		esp_wifi_connect();
	}
	else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED)
	{
		get_ip = 0;
		socket_ok = 0;
		if (s_retry_num < EXAMPLE_ESP_MAXIMUM_RETRY)
		{
			xEventGroupClearBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
			s_retry_num++;
		}
		esp_wifi_connect();
	}
	else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP)
	{
		ip_event_got_ip_t *event = (ip_event_got_ip_t *)event_data;
		s_retry_num = 0;
		xEventGroupSetBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
		get_ip = 1;
		socket_ok = 1;
	}
}

/*
 *
 */
void print_csi(wifi_csi_info_t received, int diff)
{
	for (int i = 0; i < diff; i++)
	{
		

		// data delay one frame......
		printf("device%d,%d,%d,%d,%d,%d,", sta_mac[5], serial_num_pre + i, received.len, rssi_pre, received.rx_ctrl.noise_floor, received.rx_ctrl.rx_state);

		for (int i = 0; i < CSI_DATA_LEN; i += 2)
		{
			int imag = csi_buf_pre[i];
			int real = csi_buf_pre[i + 1];
			printf("%d,%d,", real, imag);
			csi_buf_pre[i] = *(received.buf + i);
			csi_buf_pre[i + 1] = *(received.buf + i + 1);
			rssi_pre = received.rx_ctrl.rssi;
		}
		printf("\n\n");
	}
	serial_num_pre = serial_num;
}

void receive_csi_cb(void *ctx, wifi_csi_info_t *data)
{
	wifi_csi_info_t received = data[0];

	char senddMacChr[LEN_MAC_ADDR] = {0}; // Sender
	sprintf(senddMacChr, "%02X:%02X:%02X:%02X:%02X:%02X", received.mac[0], received.mac[1], received.mac[2], received.mac[3], received.mac[4], received.mac[5]);
	printf("Received mac: %s\n", senddMacChr);
	if (strcmp(senddMacChr, AP_MAC) != 0) {
		printf("Received mac : %s, error mac......\n", senddMacChr);
		return;
	}
	
	int diff = serial_num + (~serial_num_pre + 1);
	printf("diff = %d\n", diff);
	if (diff == 0)
	{
		for (int i = 0; i < CSI_DATA_LEN; i += 2)
		{
			csi_buf_pre[i] = *(received.buf + i);
			csi_buf_pre[i + 1] = *(received.buf + i + 1);
		}
		rssi_pre = received.rx_ctrl.rssi;
		if (first_csi == 1) {
			first_csi = 0;
		}
		printf("Serial_num_pre: %d, serial_num: %d ********  Update csi_buf_pre\n", serial_num_pre, serial_num);
	}
	else if (diff >= 1)
	{
		if (serial_num_pre == 0 && first_csi == 1) {
			for (int i = 0; i < CSI_DATA_LEN; i += 2)
			{
				csi_buf_pre[i] = *(received.buf + i);
				csi_buf_pre[i + 1] = *(received.buf + i + 1);
			}
			rssi_pre = received.rx_ctrl.rssi;
			serial_num_pre = serial_num;
			first_csi = 0;
			printf("Serial_num_pre: %d, serial_num: %d ********  Update csi_buf_pre\n", serial_num_pre, serial_num);
		}
		else {
			print_csi(received, diff);
		}
	}
	else
	{
		//*******
		print_csi(received, 1);
	}
	
	
}

/*
 * Connects to the UDP server on the other ESP32 and repeatedly sends UDP packets,
 * so that the server responds with packets containing CSI preambles
 */
static void udp_client_task(void)
{
	uint8_t rx_num;
	char addr_str[128];
	int ret;

	while (1) {
		while (get_ip == 0){}

		struct sockaddr_in dest_addr;
		dest_addr.sin_addr.s_addr = htonl(INADDR_ANY);
		dest_addr.sin_family = AF_INET;
		dest_addr.sin_port = htons(PORT);
		inet_ntoa_r(dest_addr.sin_addr, addr_str, sizeof(addr_str) - 1);
		printf("IP: %s,  Port: %d *********************************\n", addr_str, PORT);

		int sockfd = socket(AF_INET, SOCK_DGRAM, 0);

		if (sockfd < 0 || get_ip == 0) {
			fprintf(stderr,"sockfd < 0 : %s\n", strerror(errno));
			socket_ok = 0;
			continue;
		}

		ret = bind(sockfd, (struct sockaddr *)&dest_addr, sizeof(dest_addr));
		if (ret != 0 || get_ip == 0) {
			fprintf(stderr,"bind socket error : %s\n", strerror(errno));
			socket_ok = 0;
			close(sockfd);
			continue;
		}
		
		socket_ok = 1;

		struct sockaddr_in source_addr;
		socklen_t socklen = sizeof(source_addr);


		while (socket_ok == 1 && get_ip == 1) {
			while (1) {
				int len = recvfrom(sockfd, &rx_num, sizeof(uint8_t), 0, (struct sockaddr *)&source_addr, &socklen);

				if (len < 0)
				{
					printf("Recv data, len = %d \n", len);
					break;
				}
				else
				{
					printf("Received serial_num: %d\n", rx_num);
					serial_num = rx_num;
				}
			}

			if (sockfd < 0 || socket_ok == 0 || get_ip == 0)
			{
				printf("sock < 0 || socket_ok == 0 || get_ip == 0 -----------------\n");
				shutdown(sockfd, 0);
				close(sockfd);
				socket_ok = 0;
				break;
			}
			vTaskDelay(1 / portTICK_PERIOD_MS);
		}
		vTaskDelay(1 / portTICK_PERIOD_MS);
	}

	
}

/*
 * Connects to the WiFi AP on the other ESP32
 */
void wifi_init_sta(void)
{
	s_wifi_event_group = xEventGroupCreate();

	tcpip_adapter_init();

	ESP_ERROR_CHECK(esp_event_loop_create_default());

	wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
	cfg.csi_enable = 1;
	ESP_ERROR_CHECK(esp_wifi_init(&cfg));
	ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));

	ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &event_handler, NULL));
	ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &event_handler, NULL));

	wifi_config_t wifi_config =
		{
			.sta = {
				.ssid = EXAMPLE_ESP_WIFI_SSID,
				.password = EXAMPLE_ESP_WIFI_PASS},
		};

	ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
	ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config));
	
	ESP_ERROR_CHECK(esp_wifi_set_mac(ESP_IF_WIFI_STA, sta_mac));

	ESP_ERROR_CHECK(esp_wifi_start());

	// set wifi chanel
	uint8_t primary = 13;
	ESP_ERROR_CHECK(esp_wifi_set_channel(primary, WIFI_SECOND_CHAN_NONE));

	// Close wifi power saving mode
	esp_wifi_set_ps(WIFI_PS_NONE);

	wifi_promiscuous_filter_t filer_promi;
	wifi_promiscuous_filter_t filer_promi_ctrl;

	uint32_t filter_promi_field = (0xFFFFFF84);
	uint32_t filter_promi_ctrl_field = (0x00000000);

	uint32_t filter_event = WIFI_EVENT_MASK_ALL;

	filer_promi.filter_mask = filter_promi_field;
	filer_promi_ctrl.filter_mask = filter_promi_ctrl_field;

	esp_wifi_set_promiscuous_filter(&filer_promi);
	esp_wifi_set_event_mask(filter_event);
	esp_wifi_set_promiscuous_ctrl_filter(&filer_promi_ctrl);

	ESP_ERROR_CHECK(esp_wifi_set_promiscuous(true));
	// esp_wifi_set_promiscuous_rx_cb(promi_cb);

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

	udp_client_task();
}

void app_main(void)
{
	esp_err_t ret = nvs_flash_init();
	if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
	{
		ESP_ERROR_CHECK(nvs_flash_erase());
		ret = nvs_flash_init();
	}
	ESP_ERROR_CHECK(ret);

	wifi_init_sta();
}
