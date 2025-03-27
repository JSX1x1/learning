# Function to explain and demonstrate the basic data types in Python

def learn_data_types():
    # 1. Integer Type (int)
    print("1. Integer (int):")
    num = 10
    print(f"Example: num = {num}")
    print(f"Type of num: {type(num)}")
    print(f"Addition: {num + 5}")
    print(f"Multiplication: {num * 2}")
    print("-" * 40)

    # 2. Floating Point Type (float)
    print("2. Floating Point (float):")
    float_num = 3.14
    print(f"Example: float_num = {float_num}")
    print(f"Type of float_num: {type(float_num)}")
    print(f"Addition: {float_num + 2.5}")
    print(f"Division: {float_num / 2}")
    print("-" * 40)

    # 3. String Type (str)
    print("3. String (str):")
    text = "Hello, World!"
    print(f"Example: text = {text}")
    print(f"Type of text: {type(text)}")
    print(f"Concatenation: {text + ' How are you?'}")
    print(f"String Length: {len(text)}")
    print(f"Accessing a character: {text[0]}")  # First character
    print("-" * 40)

    # 4. List Type (list)
    print("4. List (list):")
    my_list = [1, 2, 3, 4, 5]
    print(f"Example: my_list = {my_list}")
    print(f"Type of my_list: {type(my_list)}")
    print(f"Adding an element: {my_list + [6, 7]}")
    print(f"Accessing an element: {my_list[2]}")  # Indexing (third element)
    print(f"Length of list: {len(my_list)}")
    my_list.append(6)  # Add an element to the list
    print(f"List after appending: {my_list}")
    print("-" * 40)

    # 5. Tuple Type (tuple)
    print("5. Tuple (tuple):")
    my_tuple = (1, 2, 3, 4, 5)
    print(f"Example: my_tuple = {my_tuple}")
    print(f"Type of my_tuple: {type(my_tuple)}")
    print(f"Accessing an element: {my_tuple[2]}")  # Indexing (third element)
    print(f"Length of tuple: {len(my_tuple)}")
    # Tuples are immutable, so you cannot modify them directly
    print("-" * 40)

    # 6. Dictionary Type (dict)
    print("6. Dictionary (dict):")
    my_dict = {"name": "Alice", "age": 25, "city": "New York"}
    print(f"Example: my_dict = {my_dict}")
    print(f"Type of my_dict: {type(my_dict)}")
    print(f"Accessing a value: {my_dict['name']}")
    print(f"Adding a new key-value pair: {my_dict.update({'profession': 'Engineer'})}")
    print(f"Dictionary after update: {my_dict}")
    print("-" * 40)

    # 7. Set Type (set)
    print("7. Set (set):")
    my_set = {1, 2, 3, 4, 5}
    print(f"Example: my_set = {my_set}")
    print(f"Type of my_set: {type(my_set)}")
    print(f"Adding an element: {my_set.add(6)}")
    print(f"Set after adding 6: {my_set}")
    print(f"Removing an element: {my_set.remove(2)}")
    print(f"Set after removing 2: {my_set}")
    print("-" * 40)

    # 8. Boolean Type (bool)
    print("8. Boolean (bool):")
    is_true = True
    is_false = False
    print(f"Example: is_true = {is_true}, is_false = {is_false}")
    print(f"Type of is_true: {type(is_true)}")
    print(f"Logical AND: {is_true and is_false}")
    print(f"Logical OR: {is_true or is_false}")
    print(f"Negation: {not is_true}")
    print("-" * 40)

    # Summary
    print("This script demonstrated the basic data types in Python with examples.")
    print("Python has built-in types like int, float, str, list, tuple, dict, set, and bool.")
    print("Each type has its own set of operations and methods that can be used.")

# Call the function to learn data types
if __name__ == "__main__":
    learn_data_types()
