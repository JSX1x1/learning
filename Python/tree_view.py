import os

def print_directory_tree(directory_path, indent=""):
    # Check if the provided path is a valid directory
    if not os.path.isdir(directory_path):
        print(f"The path {directory_path} is not a valid directory.")
        return

    # Print the name of the directory
    print(f"{indent}[{os.path.basename(directory_path)}/]")

    # List all files and directories in the given directory
    for item in os.listdir(directory_path):
        item_path = os.path.join(directory_path, item)
        
        # If the item is a directory, recursively print its tree
        if os.path.isdir(item_path):
            print_directory_tree(item_path, indent + "    ")
        else:
            # If it's a file, print its name with the current indentation
            print(f"{indent}    {item}")

# Main function to specify the root directory
if __name__ == "__main__":
    root_directory = input("Enter the path of the directory: ")
    print_directory_tree(root_directory)
