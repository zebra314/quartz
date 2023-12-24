---
title: New python project
enableToc: true
---
[[catalog/learning/programming/python|python]]

## On starting

First, we create and activate the virtual environment before installing the required packages.

```python
python3 -m venv venv # Create
source venv/bin/activate # Activate
```

Once we have installed the required packages in the virtual environment for this project, we can generate the `requirements.txt`.

```python
pip freeze > requirements.txt
```

When we are done working in the virtual environment, we can deactivate it.

```python
deactivate
```

## On using

To install the required packages listed in `requirements.txt` into virtual environment, we need to create and activate a virtual environment first and then install the packages.

```python
python3 -m venv venv # Create
source venv/bin/activate # Activate
pip install -r requirements.txt # Install
```

## On committing

> [!WARNING] Warning:  
> Normally, we would not commit the virtual environment to the repository. We would add it to `.gitignore` instead.
