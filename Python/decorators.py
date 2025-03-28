# Step 1: Basic Decorator
def simple_decorator(func):
    """A simple decorator that prints before and after the function call."""
    def wrapper():
        print("Before function call")
        func()
        print("After function call")
    return wrapper

@simple_decorator
def say_hello():
    print("Hello!")

# Step 2: Decorators with Arguments
def repeat_decorator(times: int):
    """A decorator that repeats the decorated function a given number of times."""
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(times):
                print(f"Executing {func.__name__}...")
                func(*args, **kwargs)
        return wrapper
    return decorator

@repeat_decorator(times=3)
def greet(name: str):
    print(f"Hello, {name}!")

# Step 3: Class Method Decorators
class MyClass:
    def __init__(self, name):
        self.name = name

    @staticmethod
    @simple_decorator
    def static_method():
        print("This is a static method")

    @repeat_decorator(2)
    def instance_method(self):
        print(f"Hello from instance method! Name: {self.name}")


# Step 4: Chaining Decorators
def add_exclamation(func):
    """Decorator that adds an exclamation mark at the end of the function's output."""
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return f"{result}!"
    return wrapper

def add_greeting(func):
    """Decorator that adds a greeting message at the beginning of the function's output."""
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return f"Greetings! {result}"
    return wrapper

@add_exclamation
@add_greeting
def say_goodbye(name: str):
    return f"Goodbye, {name}"

# Main function
def main():
    # Calling basic decorator example
    say_hello()

    # Calling decorator with arguments
    greet("Alice")
    greet("Bob")

    # Calling class method decorators
    obj = MyClass("Charlie")
    obj.static_method()  # Static method decorated
    obj.instance_method()  # Instance method decorated

    # Calling function with chained decorators
    print(say_goodbye("Dave"))

# Run the main function
if __name__ == '__main__':
    main()
