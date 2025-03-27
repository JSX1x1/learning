# Function to demonstrate type safety in Python

def demonstrate_type_safety():
    # Example 1: Mixing different types in Python without explicit errors
    print("Example 1: Mixing types without errors")
    
    # Integer and string addition (implicit type conversion is allowed)
    num = 10
    text = "Hello"
    result = text + str(num)  # We convert the integer to string to concatenate
    print(f"Result of adding a string and an integer: {result}")  # No error here because we manually handled the type
    
    # Example 2: Python allows incompatible operations without type errors (dynamic typing)
    print("\nExample 2: Implicitly allowing type mismatches")
    
    try:
        # Adding a string and an integer without explicit conversion will raise an error
        result = text + num  # This will throw a TypeError
        print(f"Result: {result}")
    except TypeError as e:
        print(f"Error encountered: {e}")
    
    # Example 3: Function accepting various types (no type safety enforced)
    print("\nExample 3: Functions that accept different types without explicit type safety")
    
    def add(a, b):
        return a + b
    
    print(f"Result of adding an integer and float: {add(10, 2.5)}")  # Mixing int and float
    print(f"Result of adding a string and a list: {add('Hello', ['a', 'b'])}")  # Mixing string and list

    # Example 4: Type hints for better code clarity (no enforcement)
    print("\nExample 4: Type hints - Python doesn't enforce them, but they help with readability")
    
    def multiply(a: int, b: int) -> int:
        return a * b
    
    # This will not raise an error even though we're passing a string
    print(f"Result of passing a string instead of an integer: {multiply(5, 'Hello')}")
    
    # Example 5: Type checking using `isinstance` - More explicit type checking
    print("\nExample 5: Using isinstance for type checking (not enforced by default)")
    
    a = 5
    if isinstance(a, int):
        print(f"{a} is an integer!")
    else:
        print(f"{a} is not an integer!")

    # Example 6: Type errors in collections
    print("\nExample 6: Mixing types in collections (Python allows this without any error)")
    
    my_list = [1, 'Hello', 3.14, True]  # Mixing different types in a list
    print(f"Mixed list: {my_list}")
    
    my_dict = {'key1': 10, 'key2': 'value', 'key3': 3.14}  # Mixed types in dictionary
    print(f"Mixed dictionary: {my_dict}")

# Call the function to demonstrate type safety
if __name__ == "__main__":
    demonstrate_type_safety()
