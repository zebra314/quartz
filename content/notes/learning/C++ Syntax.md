---
title: C++ Syntax
enableToc: true
---
[[catalog/learning/programming|programming]]
# Input
## 優化

```c
int main()
{
	ios::sync_with_stdio(false);
	cin.tie(0);
	/*do something...*/
}
```
## 種類
```c
string str;
char cha;
cin>>str>>cha; 

getline(cin,str);
getline(cin,char);
cin.getline(cha,5);  //char

cin.get(ch);    
cin.get(str,20);
ch=cin.get();
cin.get() //可接受空格與換行 //與getchar()功能差不多
```

# set, multiset

1. STL容器
2. ```.insert()```插入元素
3. ```set```會自動消除重複元素, ```multiset```會保留
4. 元素插入後會自動排序
5. ```.clear()```初始化
6. ```.earse()```刪除指定元素
7. ```.count()```判斷元素是否存在,回傳 0 or 1
8. ```.find()```也是用來判斷元素是存在,但回傳的是指向其儲存位址的指標

# lower_bound(),  upper_bound()

1. ```lower_bound(``` _.begin()_ ```,``` _.end()_ ```,``` _value_ ```)```
2. 返回位置
3. Binary Search
4. ```*lower_bound()``` 指向該數值的儲存位置
5. 可用來取代數值
```c
 posi = lower_bound(vector.begin(),vector.end(),int); // <= , 最大 小於等於int 的數
 posi = upper_bound(vector.begin(),vector.end(),int); // > , 最小 大於int 的數
```

# find()

1. 檢查, 搜尋位置
2. 返回位址
3. Code:

```c
 auto it = find(v.begin(), v.end(), K);

// If element was found
if (it != v.end())
{
    // calculating the index
    // of K
    int index = it - v.begin();
    cout << index << endl;
}
else 
{
    // If the element is not
    // present in the vector
    cout << "-1" << endl;
}
```

# .end(), .back(), .front(), .begin() 差別

```c
v: [ 1 | 2 | 3 | 4 | ... | 999 ]
     🡑                      🡑     🡑
   front()                back() end()
     🡑
   begin()
```

# isalpha(), isdigit()

+ 用來判斷字元是字母或數字
+ 回傳bool

```c
isalpha('a') == 1
isalpha('1') == 0
isdigit('a') == 0
isdigit('1') == 1
```

# .length(),  .size()

+ 回傳int

```c
a.length()
a.size()
```

# Vector 更動元素 

##  刪除特定位置
- ```.erase()```
```c
b.erase(b.begin()+3); //刪除第三個元素(b[2])
b.erase(b.begin()+3,b.begin()+6); //刪除第三到第六個元素
```

##  新增至特定位置
- ```.insert()```
```c
b.insert(b.begin(),element); //在開頭加入element
```

# float, double 

- ```float``` 32位元 有效數字6~7
- ```double``` 64位元 有效數字15~16 (比較精確)  


# .sort()

- ```.sort( 起始位置 , 結束位置 , 排序依據 0 or 1)```
- 排序依據 預設為小到大

# 小數點輸出

- 輸出四位有效位數
```c
cout<<setprecision(4)<<....;
```

- 出到小數點後第四位 不足補零
 ```c
 cout<<setprecision(4)<<fixed<<....;
 ```

# sstream

- ```<sstream>```
- stringstream (ostringstream 和 istringstream的綜合)

- istringstream

- ostringstream 把各種資料輸入 合併成字串輸出
```c
ostringstream s;
int a;
string h;
char c;
s<<a<<c<<h;
cout<< s.str();
```

# string int 轉換

## 刪除空格, 萃取數字
```c
stringstream ss;
ss.clear();
ss.str("");

string num = "123 345 456 77 789";
int temp;
ss<<num; // string
while(ss>>temp) // 分次流出 // 匯出成string或int 都可以 
{
	cout<<temp<<" "; // int
}
```
## stoi
```
string a ="123"
```
## int to string
```c
stringstream b;
b.str("")
b.clear();
	
b<< (int);
b>>(string);
```

# 遍歷 簡潔寫法

## in side for()
- 想要拷貝元素：for(auto x:range)
- 想要修改元素 :  for(auto &&x:range)
- 想要只讀元素：for(const auto& x:range)
- 注意! 此時不能用```scanf()```,```printf()```

## example
```c
int x[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
for(const auto &y : x ) {cout<<y<<” ”;} //x要遍歷的容器 vector,map…
                                        //y的&可以省略
```

```c
int a[3][3]={{10,10,10},{2,3,1},{3,4,0}};
for( const auto &n :a)    //n的&省略會噴錯
{
	for(const auto &t :n)  //t的&可以省略
	{
		cout<<t<<" ";
	}
	cout<<"\n";
}
// Output:
// 10 10 10
// 2 3 1
// 3 4 0
```
# Custom sort rule
 ```c
 bool rule(type<...>i, type<...>j)
 {
	 if(...)
		 return...>...
	else 
		return ...<...
}
```
- example
```c
bool rule(pair<int,int> i, pair<int,int>j)
{
    if(i.second != j.second)
        return i.second < j.second;
    else
        return i.first > j.first;
}

sort
```

# 三元運算子
## how
- 判斷 ? 前面的條件式
- : 相當於or 
## example 1
```c
	if(x == true) 
		val = y;
	else 
		val = z;
```
```c
	val = x ? y : z ;
```

## example 2
```c
// 輾轉相除法 GCD
int GCD(int a, int b)
{
    if(a<b) swap(a,b); // make a to be the bigger one
    if(a%b == 0)
        return b;
    else
        return GCD(a%b,b);
}
```
```c
int GCD(int a, int b){ return b == 0 ? a : GCD(b, a % b); }
```
# Map
## unordered_map
- 沒有排序過的map
## iterator
```c
	unordered_map<int, int> ans;
	/*init...*/
	// find the target
	auto posi = ans.find(target);
    if( posi != ans.end()){ // 如果有找到
		/*....*/
    }
```