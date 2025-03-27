# Function to demonstrate common exception triggers and their fixes

def demonstrate_exceptions():
    print("Demonstrating Common Exceptions and Fixes...\n")

    # 1. ZeroDivisionError - Triggered when dividing by zero
    print("1. ZeroDivisionError (Dividing by zero):")
    try:
        result = 10 / 0
    except ZeroDivisionError as e:
        print(f"Error: {e} - Fix: Ensure the denominator is not zero. Example fix: Use a conditional check before division.")
        print("Fix Example: Avoid division by zero:\n")
        numerator = 10
        denominator = 5
        if denominator != 0:
            result = numerator / denominator
            print(f"Fixed result: {result}")
        else:
            print("Denominator is zero, cannot divide.")
    print("-" * 40)

    # 2. ValueError - Triggered when the wrong type of value is passed
    print("2. ValueError (Wrong type of value passed to a function):")
    try:
        number = int("not_a_number")
    except ValueError as e:
        print(f"Error: {e} - Fix: Ensure input is of correct type. Example fix: Use try-except to handle incorrect input.")
        print("Fix Example: Check for valid input:\n")
        user_input = "not_a_number"
        try:
            valid_number = int(user_input)
        except ValueError:
            print("Fix: Input is not a valid integer. Please provide a valid number.")
    print("-" * 40)

    # 3. IndexError - Triggered when accessing an index that doesn't exist in a list
    print("3. IndexError (Accessing out-of-bound index in a list):")
    my_list = [1, 2, 3]
    try:
        element = my_list[5]
    except IndexError as e:
        print(f"Error: {e} - Fix: Ensure index is within range of the list. Example fix: Check if the index exists before accessing.")
        print("Fix Example: Check index before accessing the list element:\n")
        index = 5
        if index < len(my_list):
            print(f"Element at index {index}: {my_list[index]}")
        else:
            print(f"Index {index} is out of range.")
    print("-" * 40)

    # 4. FileNotFoundError - Triggered when trying to open a file that doesn't exist
    print("4. FileNotFoundError (Trying to open a non-existent file):")
    try:
        with open("non_existent_file.txt", "r") as file:
            content = file.read()
    except FileNotFoundError as e:
        print(f"Error: {e} - Fix: Ensure the file exists before opening. Example fix: Check if file exists or create it first.")
        print("Fix Example: Check if file exists before opening it:\n")
        import os
        filename = "non_existent_file.txt"
        if os.path.exists(filename):
            with open(filename, "r") as file:
                print(file.read())
        else:
            print(f"The file '{filename}' does not exist. Creating it now...")
            with open(filename, "w") as file:
                file.write("This is a new file created to demonstrate FileNotFoundError fix.")
            print("File created successfully.")
    print("-" * 40)

    # 5. KeyError - Triggered when trying to access a dictionary key that doesn't exist
    print("5. KeyError (Accessing a non-existent key in a dictionary):")
    my_dict = {"name": "Alice", "age": 25}
    try:
        value = my_dict["address"]
    except KeyError as e:
        print(f"Error: {e} - Fix: Ensure the key exists in the dictionary. Example fix: Use .get() or check if the key is present.")
        print("Fix Example: Use the .get() method to avoid KeyError:\n")
        value = my_dict.get("address", "Key not found")
        print(f"Address: {value}")
    print("-" * 40)

    # 6. TypeError - Triggered when an operation or function is applied to an object of inappropriate type
    print("6. TypeError (Applying operation on incompatible types):")
    try:
        result = "10" + 5  # Trying to add a string and integer
    except TypeError as e:
        print(f"Error: {e} - Fix: Ensure operands are of compatible types. Example fix: Convert types appropriately.")
        print("Fix Example: Convert string to an integer before performing arithmetic operation:\n")
        str_number = "10"
        int_number = 5
        result = int(str_number) + int_number
        print(f"Fixed result: {result}")
    print("-" * 40)

    # 7. AttributeError - Triggered when trying to access an attribute that doesn’t exist
    print("7. AttributeError (Trying to access a non-existent attribute in an object):")
    class Person:
        def __init__(self, name):
            self.name = name

    person = Person("Bob")
    try:
        print(person.age)  # 'age' attribute does not exist
    except AttributeError as e:
        print(f"Error: {e} - Fix: Ensure the attribute exists before accessing it. Example fix: Use hasattr() to check.")
        print("Fix Example: Check if attribute exists before accessing it:\n")
        if hasattr(person, "age"):
            print(person.age)
        else:
            print("The 'age' attribute does not exist.")
    print("-" * 40)

    # 8. ImportError - Triggered when trying to import a module that doesn't exist
    print("8. ImportError (Trying to import a non-existent module):")
    try:
        import non_existent_module  # This line will be flagged as error everywhere
    except ImportError as e:
        print(f"Error: {e} - Fix: Ensure the module is installed or available. Example fix: Use try-except to handle ImportError.")
        print("Fix Example: Handle ImportError gracefully:\n")
        try:
            import math
            print(f"Successfully imported 'math' module. Math module functions: {math.sqrt(16)}")
        except ImportError:
            print("Math module is not available.")
    print("-" * 40)

    # 9. AssertionError - Triggered when an assert statement fails
    print("9. AssertionError (Failing an assertion check):")
    try:
        assert 2 + 2 == 5, "2 + 2 should equal 4"
    except AssertionError as e:
        print(f"Error: {e} - Fix: Correct the condition being asserted. Example fix: Ensure the condition is true.")
        print("Fix Example: Correct the assertion:\n")
        assert 2 + 2 == 4, "2 + 2 should equal 4"  # Correct assertion
        print("Assertion passed!")
    print("-" * 40)

# Call the function to demonstrate exceptions
if __name__ == "__main__":
    demonstrate_exceptions()
