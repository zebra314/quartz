[[academic]]
## The CBF value

- The value
$$ h(x, t) = \| x - c_{obs}(t) \|_2 - r_{obs}(t) $$
- x represents the state of the system (position, angle, velocity...)
- $c_{obs}(t)$ is the center of the obstacles
- $r_{obs}(t)$ is the radius of the obstacles
- $\| . \|_2$ is the euclidean distance
- CBF ensures the distance between the system and obstacles always bigger than the radius of the obstacles to avoid collision


## Gradient of CBF with Respect to $x$

- Using the chain rule: $$ \frac{\partial h}{\partial x} = \frac{x - c_{obs}(t)}{\| x - c_{obs}(t) \|} $$

## Explicit Time Derivative of CBF

- Using the chain rule: $$ \frac{\partial h}{\partial t} = \frac{\partial \| x - c_{obs}(t) \|_2}{\partial t} - \frac{\partial r_{obs}(t)}{\partial t} $$
- The first term is the time derivative of the distance: $$ \frac{\partial \| x - c_{obs}(t) \|_2}{\partial t} = \frac{\| x - c_{obs}(t+\partial t) \|_2 - \| x - c_{obs}(t) \|_2}{\partial t} $$
- The second term is the time derivative of the obstacle radius: $$ \frac{\partial r_{obs}(t)}{\partial t} $$

## Approximating Time Derivatives Using Finite Differences

- Using the forward difference method: $$ \frac{\partial f}{\partial t}(t) \approx \frac{f(t + \delta t) - f(t)}{\delta t} $$
- For the obstacle center: $$ \frac{\partial c_{obs}(t)}{\partial t} \approx \frac{c_{obs}(t + \delta t) - c_{obs}(t)}{\delta t} $$
- For the obstacle radius: $$ \frac{\partial r_{obs}(t)}{\partial t} \approx \frac{r_{obs}(t + \delta t) - r_{obs}(t)}{\delta t} $$
