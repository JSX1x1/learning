def create_custom_file():
    # Get filename and content from the user
    filename = input("Enter the name of the file you want to create (e.g., 'myfile.txt'): ")
    content = input("Enter the content you want to add to the file: ")

    try:
        # Open the file in write mode (creates the file if it doesn't exist)
        with open(filename, 'w') as file:
            # Write the content to the file
            file.write(content)
        print(f"File '{filename}' has been created successfully with the provided content.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Call the function to create a custom file
if __name__ == "__main__":
    create_custom_file()
