---
title: Vim
enableToc: true
---
[[catalog/learning/software|software]]

## Brief
- Editing in the line
	- i I a A
	- [[notes/learning/Vim#Insert|Insert]]
- Navigating
	- h j k l
	- w b e
	- [[notes/learning/Vim#Navigate|Navigate]]
- making changes in command mode
	- x r
	- [[notes/learning/Vim#Making changes in command mode|Making changes in command mode]]

## Mode
1.  insert
	> i
2. command
	> :
3. visual
	> v
4. search
	> /

## Insert
1. before cursor
	> i
2. insert from the begin
	> I
3. after the cursor
	> a
4. insert from the end
	> A

## Navigate
1. 左 
	> h
2. 下
	> j
3. 上
	> k
4. 右
	> l
5. 向下五行
	> 5j
6. navigate between words
	1. word begin
		> w
	2. word begin in the opposite direction 
	  > b
	3. word end
	  > e
7. scroll by pages
	> crl + u
	> crl + d 
8. navigate with line number
	> : *number* + enter
	> *number* + G
9. navigate with blank lines
	> }
	> {
10. go to the end of the file
	> G
11. go to the begin of the line 
	> $
12. go to the end of the line
	> 0

## Delete
1. single char
	> x
2. delete words
	1. delete single word 
	  > dw
	2. delete two words
	  > d2w
	3. entire line
	  > dd

## Undo 
> u

## Show line number
> :set number

## Visual mode 
1. choose a certain range in the same line
 	> v
2. copy
	> y
3. copy the whole line
	> yy
1. paste (paste the last thing being deleted or copied)
	> p

## Visual line mode
1. choose a certain range in different lines
	> shift + v

## Before quit
1. save
	> :w
2. run the code

## Making changes in command mode
1. delete
	> x
2. replace
	> r

## Copy and paste
- Copy to browser
	> V, "+, y		
	> V is to choose the whole line 
	> "+ is the default register to the system
- Copy from browser
	> "+, p