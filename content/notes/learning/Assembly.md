---
title: Assembly
enableToc: true
---
[[index/learning/programming|programming]]
# 參考資料
[1](http://godleon.blogspot.com/2008/01/machine-language-cpu-machine-language.html)  
[2](https://blog.csdn.net/horizontalview/article/details/50773740)  

# 名詞
1. 暫存器 寄存器 register
2. 記憶體 內存 memory
3. `r0` 是 ARM 架構中的一個通用暫存器, 用來儲存一個32位的值

# 語法
## 架構
- .data 初始化常數
- .text 初始化變量
- .main 主程式
- 可以自訂函式並在外部引用, 要在.text中用.global宣告, 函式部份仿造.main, 下方程式碼為定義一個ledRun的函式
```assembly
.syntax unified
.cpu cortex-m4
.thumb

.data
	Leds: .byte 0

.text
	.global ledRun
	.equ GPIOA_MODER,	0x48000000
	.equ GPIOA_OTYPER,	0x48000004
	.equ GPIOA_OSPEEDR, 0x48000008
	.equ GPIOA_PUPDR, 	0x4800000C
	.equ GPIOA_ODR, 	0x48000014
	.equ RCC_AHB2SMENR, 0x4002106C

ledRun:
	// Enable AHB2 clock
	movs r0, #0x1
	ldr r1, =RCC_AHB2SMENR
	str r0, [r1]

	// Set PA5 as output mode
	movs r0, #0x400
	ldr r1, =GPIOA_MODER
	ldr r2, [r1]
	and r2, #0xFFFFF3FF
	orrs r2, r2, r0
	str r2, [r1]

	// Default PA5 is Pull-up output, no need to set

	// Set PA5 as high speed mode
	movs r0, #0x800
	ldr r1, =GPIOA_OSPEEDR
	strh r0, [r1]
	ldr r1, =GPIOA_ODR
L:
	movs r0, #(1<<5)
	strh r0, [r1]
	B L
```
##  常用指令
- mov
	- 暫存器到暫存器
	- 新增資料到暫存器
```
mov destination, source
mov r1, r2 // r1=r2, write the value in r2 to r1 
mov r3, #23 // write value 23 to r3
```

- ldr
	- 記憶體到暫存器
```
ldr destination, source

ldr r1, =0xE0000000 // r1=0xE0000000, 將這個地址存到 暫存器r1 
ldr r1, 0xE0000000 // 將記憶體中地址為0xE0000000的內容載入到 暫存器r1
ldr r1, [r0] // 將 暫存器r0 中的數所指定的記憶體地址的內容傳送到 暫存器r1
```

- str
	- 暫存器到記憶體
```
str source, destination
str r1, [r0] // 將 暫存器r1 的內容傳輸到 暫存器r0 中的數所指定的記憶體中
```

- 通常先用 ldr 將某個記憶體地址存到暫存器中, 再用str將某一個存在暫存器中的值存到記憶體中
```
movs r0, #0x800 // store a number(2048) to register r0
ldr r1, =GPIOA_OSPEEDR // store an address to r1

strh r0, [r1] // store the number in r0 to the address in r1
```
