---
tags: programming, python
---
# Class variables and Instance variables

```python
class Myclass:
	element1 = 'Hello' # class variable
	def __init__(self):
		self.element2 = "World" # instance variable

c1 = Myclass()
		
```
- class variable 
	- changes for all class when assigned to via the class (Myclass.element1 = X)

# __init__ , __call__

```python
class Foo:
    def __init__(self, a, b, c):
        # ...

x = Foo(1, 2, 3) # __init__
```
```python
class Foo:
    def __call__(self, a, b, c):
        # ...

x = Foo()
x(1, 2, 3) # __call__
```

