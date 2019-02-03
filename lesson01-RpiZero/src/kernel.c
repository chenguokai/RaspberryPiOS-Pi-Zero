#include "mini_uart.h"

char str[] = "Hello, Raspberry Pi Zero!";

void kernel_main(void)
{
	uart_init();
	uart_send(90); // “Z”
	uart_send_string(str);
	uart_send_string("123");

	while (1) {
		uart_send(uart_recv()+1);
	}
}
