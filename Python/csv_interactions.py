import csv

# File path for the CSV file
csv_file_path = 'data.csv'

# Example data to write into the CSV file
header = ['Name', 'Age', 'City']
data = [
    ['John Doe', 30, 'New York'],
    ['Jane Smith', 25, 'Los Angeles'],
    ['Alice Johnson', 28, 'Chicago']
]

# 1. Writing data to a CSV file
def write_to_csv(header, data):
    try:
        with open(csv_file_path, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(header)  # Write the header
            writer.writerows(data)   # Write the data rows
            print(f"Data successfully written to {csv_file_path}")
    except Exception as e:
        print(f"Error writing to CSV file: {e}")

# 2. Reading data from a CSV file
def read_from_csv():
    try:
        with open(csv_file_path, 'r', newline='') as file:
            reader = csv.reader(file)
            rows = list(reader)
            print("Data successfully read from CSV file:")
            for row in rows:
                print(row)
            return rows
    except Exception as e:
        print(f"Error reading from CSV file: {e}")
        return None

# 3. Appending data to the CSV file
def append_to_csv(new_data):
    try:
        with open(csv_file_path, 'a', newline='') as file:
            writer = csv.writer(file)
            writer.writerows(new_data)  # Append new data rows
            print("New data successfully appended to the CSV file.")
    except Exception as e:
        print(f"Error appending to CSV file: {e}")

# 4. Updating data in the CSV file
def update_csv_data(name, new_age, new_city):
    rows = read_from_csv()
    if rows:
        for row in rows[1:]:  # Skip the header
            if row[0] == name:
                row[1] = new_age
                row[2] = new_city
                break
        write_to_csv(header, rows[1:])  # Re-write the updated data
        print(f"Updated data for {name} with new age {new_age} and city {new_city}")

# 5. Deleting data from the CSV file
def delete_csv_data(name):
    rows = read_from_csv()
    if rows:
        rows = [row for row in rows if row[0] != name]  # Filter out the row with the name
        write_to_csv(header, rows[1:])  # Re-write the remaining data (skip the header)
        print(f"Deleted data for {name}")

# Main script to demonstrate the functions
if __name__ == "__main__":
    # Writing initial data to the CSV file
    write_to_csv(header, data)

    # Reading data from the CSV file
    read_from_csv()

    # Appending new data to the CSV file
    new_data = [
        ['David Miller', 32, 'Miami'],
        ['Sara Lee', 24, 'San Francisco']
    ]
    append_to_csv(new_data)

    # Reading the updated data from the CSV file
    read_from_csv()

    # Updating data for "John Doe"
    update_csv_data('John Doe', 31, 'Boston')

    # Reading after update
    read_from_csv()

    # Deleting data for "Sara Lee"
    delete_csv_data('Sara Lee')

    # Final read to show the remaining data
    read_from_csv()
