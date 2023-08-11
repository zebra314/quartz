---
title: Quadruped robot
enableToc: true
---
[[catalog/learning/academic/mechanical engineering|mechanical engineering]] & [[catalog/learning/programming/c++|c++]]

## Forward kinematic
## Inverse kinematic
- Calculate $α_1$ and $β_1$
![[leg_coordinate_1.png]]
$$\begin{align*} 
x_1 &= \sqrt{T_x^2 + T_y^2} \hfill \\ 

\alpha_1 &= \arctan\left(\frac{-T_y}{T_x}\right)^{-1} \hfill \\ 

\beta_1 &= \arccos\left(\frac{x_1^2+L_1^2-(L_3+d)^2}{2 \cdot x_1 \cdot L_1}\right) \hfill \end{align*}
$$
- Calculate $P_x$ and $P_y$ (for calculating  $α_2$ and $β_2$)
![[led_coordinate_2.png]]
$$
\begin{align*} 
&\begin{cases} 
Q_x &= -L_1 \cdot \cos(180^\circ - \alpha_1 - \beta_1) \\ Q_y &= -L_1 \cdot \sin(180^\circ - \alpha_1 - \beta_1) \end{cases} 
\\ &\Rightarrow 
\begin{cases} 
Q_x &= L_1 \cdot \cos(\alpha_1 + \beta_1) \\ 
Q_y &= -L_1 \cdot \sin(\alpha_1 + \beta_1) \end{cases} 

\\
\\ &\begin{cases} 
P_x &= \frac{Q_x \cdot d + T_x \cdot L_3}{d + L_3} \\ 
P_y &= \frac{Q_y \cdot d + T_y \cdot L_3}{d + L_3} \end{cases} \end{align*}
$$
- Calculate $α_2$ and $β_2$
![[leg_coordinate_3.png]]
$$
\begin{align*}
x_2 &= \sqrt{ (D - P_x)^2 + P_y^2 } \hfill \\
\alpha_2 &= \arctan\left(\frac{-P_y}{D - P_x}\right) \hfill \\

\beta_2 &= \arccos\left(\frac{x_2^2 + L_1^2 - L_2^2}{2 \cdot x_2 \cdot L_1}\right) \hfill \\
\end{align*}
$$
>[!Summary]
> $$
> \begin{align*} \theta_1 &= \arctan\left(\sqrt{\frac{T_y^2}{T_x^2}}\right) + \arccos\left(\frac{1}{16}\left(\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}}\right)\right) \\ \theta_2 &= \arctan \left( \frac{\frac{-64}{18} \sin(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}}))) + 10 T_y}{8.16 - \frac{32}{9} \cos(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}}))) - \frac{5}{9} T_x} \right) \\ &+ \arccos \left( \frac{\frac{1}{16} (\left(8.16 - \frac{32}{9} \cos(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}}))) - \frac{5}{9} T_x\right)^2 + \frac{-64}{324} \sin(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}})) + 10 T_y)^2 - 105}{\sqrt{\left(8.16 - \frac{32}{9} \cos(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}}))) - \frac{5}{9} T_x\right)^2 + \frac{-64}{324} \sin(\arctan(\sqrt{T_y^2/T_x^2}) + \arccos(\frac{1}{16} (\frac{T_x^2 + T_y^2 - 260}{\sqrt{T_x^2 + T_y^2}})) + 10 T_y)^2}} \right)  \\ 
> \end{align*}
> $$
> kind of scary lol


## Trajectory control 
### Overview

### Position control
### Velocity control

### Reference
- [機器人的軌跡規劃與防撞處理](http://w3.uch.edu.tw/control/download/9%E5%99%A8%E4%BA%BA%E7%9A%84%E8%BB%8C%E8%B7%A1%E8%A6%8F%E5%8A%83%E8%88%87%E9%98%B2%E6%92%9E%E8%99%95%E7%90%86.pdf)
- [運動控制命令](https://ir.nctu.edu.tw/bitstream/11536/48246/5/459705.pdf)

### Programming
- 測試不同解析度，將貝茲曲線切成不同數量的點位
- 計算每個點的兩馬達的速度值

## Target
## Asset