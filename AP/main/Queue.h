#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

#include "esp_log.h"

typedef int QDateType;//队列存储数据类型

typedef struct QueueNode //队列元素节点
{
	QDateType val;
	struct QueueNode* next;
} QueueNode;

typedef	struct Queue //队列
{
	QueueNode* head;
	QueueNode* tail;
} Queue;

void QueueInit(Queue* pq);                // 队列初始化
void QueueDestory(Queue* pq);             // 队列的销毁
void QueuePush(Queue* pq, QDateType x);   // 入队
void QueuePop(Queue* pq);                 // 出队
QDateType QueueFront(Queue* pq);          // 取出队首元素
int QueueSize(Queue* pq);                 // 求队列的长度
bool QueueEmpty(Queue* pq);               // 判断队是否为空