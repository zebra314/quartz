---
title: Itron 教學內容
enableToc: true
---
[[catalog/learning/programming/c++|c++]]

# 語法

## 講稿
- what is Function and Why Function ?
> 簡單來說 函式 就是把很多個程序 提前定義成一個動作
> 而每次我們想做很多個程序時 就請電腦做這一個動作

- Pros
> 減少重複編寫同樣的程式碼
> 讓程式讀起來 更好讀 更流暢 也更容易debug

- Example
> 以上次的LED燈閃爍為例
> 如果我們能把它能縮成一個小小的表達式 像這樣!
> 很酷 很方便 對吧?
> 但你可能會覺得說 欸 才從四行變成一行而已 差不多吧?

> 不過要知道 以後會用到的 比如說 讓馬達動 要轉幾度 要轉多久 
> 我們總不能每次要用到他時 都寫一大坨這種東西吧?
> 所以 函式之必要 希望大家了解

- How Function?
> 現在就來教大家如何宣告一個函式

- 格式
> type 可以是 int整數 bool布林值 string char ..或 void什麼都不回傳
    
> name 幫你的函數取一個名字 表達這個函是是幹甚麼用的 
> 增加程式碼的可讀性也方便陌生人理解

> 參數 parameters
> 在()裡的 就是你要從外部匯入, 函式裡會用到的參數
> 可以是 int整數 bool布林值 string char ..或 空著 甚麼都沒有也行

> 最後是return 他可以結束Function並回傳變數

- 一些格式的小地方
> 那 讓你們試試看之前 有一些小地方必須知道
    
> 參數
> 一般在傳參時，數值是被複製進去的
> 假設今天我們從外部匯入了兩個參數到這一個函數
> 可以把abcd想像成裝變數的容器
> 接著我們在函式裡交換這兩個函數的值
> a跟b交換了 
> 但c和d沒有參與到交換
> 也就是 我們不會動到這兩個參數在電腦記憶體中儲存的資料
>
> 那要如何用函式去更動c和d呢?
> 加上& &a表示a在記憶體儲存的地址
> 可以想像成讓原本的c和d直接進到函式裡進行交換
    
> 示範 
> 那這邊實際跑一次給大家看
```cpp
#include<bits/stdc++.h>
using namespace std;

void swap(int a, int b)
{
    int i = a;
    a = b;
    b = i;
}

int main()
{
    int a=1 ,b=2;
    swap(a,b);
    cout<<a<<" "<<b;
}
```
    
> return type
> void
> return

- 讓他們試試看
> 把led燈閃爍的指令包成一個函式
> 有問題也可以這時候問一下 

- struct
> 有時間可以示範
```cpp
#include<bits/stdc++.h>
using namespace std;

//輸入學號 return資訊 包含微積分是否pass 以及 室友的名字

//建立類別
struct freshman
{
    bool calculusPass;
    string roomateName;
};

//自訂函式
freshman ID_info(string name)
{
    if (name == "678")
    {
        return freshman{true,"gavin"};
    }else 
    {
        return freshman{false ,"unknown"};
    }
}

int main()
{
    freshman alfonso;
    alfonso = ID_info("678");
    cout<<alfonso.roomateName;
}
```
    
# 直流馬達

# 伺服馬達

# 步進馬達