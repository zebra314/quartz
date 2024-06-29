---
title: HAL IO
---
[[stm32]]

## Blocking Mode

CPU is block and waits the task to finish.
Straight forward to use but less performance.

若沒有在timeout內發送完成，則不再發送，return HAL_TIMEOUT。

```c
HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_UART_Receive(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
```

## Interrupt Mode

CPU is free to do other tasks while waiting for the task to finish.
Interrupts will raise when the task is done.

皆收到資料時，會觸發串口中斷函數，直到接收指定長度的資料後，才會停止中斷，接著進入callback函數（回調函數）。

```c
HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, const uint8_t *pData, uint16_t Size);
HAL_UART_Receive_IT(UART_HandleTypeDef *huart, const uint8_t *pData, uint16_t Size);
```

## DMA Mode

Direct memory access, the data is transferred between memory without pass the CPU.
The best performance and the most complicated setup.

```c
HAL_UART_Transmit_DMA();
HAL_UART_Receive_DMA();
```

[STM32F4 DMA request mapping](https://civilpedia.org/p/?t=STM32-DMA-Cheat-Sheet&pid=315)

## Reference

[Github - STM32 tutorials](https://github.com/dekuNukem/STM32_tutorials/blob/master/lesson1_serial_helloworld/hal_io_modes.md)