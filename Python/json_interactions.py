import json

# Example data to write into the JSON file
data = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Path to the JSON file
json_file_path = 'data.json'

# 1. Writing data to a JSON file
def write_to_json(data):
    try:
        with open(json_file_path, 'w') as file:
            json.dump(data, file, indent=4)
            print(f"Data successfully written to {json_file_path}")
    except Exception as e:
        print(f"Error writing to JSON file: {e}")

# 2. Reading data from a JSON file
def read_from_json():
    try:
        with open(json_file_path, 'r') as file:
            data = json.load(file)
            print("Data successfully read from JSON file:")
            print(data)
            return data
    except Exception as e:
        print(f"Error reading from JSON file: {e}")
        return None

# 3. Updating data in the JSON file
def update_json_data(key, value):
    data = read_from_json()
    if data:
        data[key] = value
        write_to_json(data)
        print(f"Updated '{key}' with new value: {value}")

# 4. Deleting data from the JSON file
def delete_json_data(key):
    data = read_from_json()
    if data and key in data:
        del data[key]
        write_to_json(data)
        print(f"Deleted key: '{key}' from the data")
    elif key not in data:
        print(f"Key '{key}' not found in the data.")
    else:
        print("No data to delete.")

# 5. Checking if a key exists in the JSON data
def check_key_exists(key):
    data = read_from_json()
    if data and key in data:
        print(f"Key '{key}' exists with value: {data[key]}")
    else:
        print(f"Key '{key}' not found.")

# Main script to demonstrate the functions
if __name__ == "__main__":
    # Writing initial data to the JSON file
    write_to_json(data)

    # Reading data from the JSON file
    read_from_json()

    # Updating data in the JSON file
    update_json_data("age", 31)

    # Checking if a key exists
    check_key_exists("city")

    # Deleting a key
    delete_json_data("city")

    # Final read to show the current state of data
    read_from_json()
