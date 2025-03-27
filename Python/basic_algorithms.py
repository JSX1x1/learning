# 1. Linear Search Algorithm
def linear_search(arr, target):
    """
    Linear Search: Searches for an element in a list by checking each element one by one.
    Time Complexity: O(n)
    """
    for i in range(len(arr)):
        if arr[i] == target:
            return i  # Return the index of the found element
    return -1  # Return -1 if the element is not found


# 2. Binary Search Algorithm (Requires Sorted Array)
def binary_search(arr, target):
    """
    Binary Search: Efficiently searches for an element in a sorted array by repeatedly dividing the search interval in half.
    Time Complexity: O(log n)
    """
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid  # Return the index of the found element
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1  # Return -1 if the element is not found


# 3. Bubble Sort Algorithm
def bubble_sort(arr):
    """
    Bubble Sort: Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.
    Time Complexity: O(n^2) in the worst case
    """
    n = len(arr)
    for i in range(n):
        swapped = False
        for j in range(0, n - i - 1):  # The last i elements are already sorted
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]  # Swap elements
                swapped = True
        # If no two elements were swapped in this iteration, the list is already sorted
        if not swapped:
            break
    return arr


# 4. Selection Sort Algorithm
def selection_sort(arr):
    """
    Selection Sort: Finds the minimum element in the unsorted part of the array and swaps it with the first unsorted element.
    Time Complexity: O(n^2)
    """
    n = len(arr)
    for i in range(n):
        min_index = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_index]:
                min_index = j
        # Swap the found minimum element with the first unsorted element
        arr[i], arr[min_index] = arr[min_index], arr[i]
    return arr


# 5. Insertion Sort Algorithm
def insertion_sort(arr):
    """
    Insertion Sort: Builds the sorted array one element at a time by inserting elements into their correct position.
    Time Complexity: O(n^2)
    """
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        # Move elements of arr[0..i-1], that are greater than key, to one position ahead
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr


# Main function to demonstrate the algorithms
if __name__ == "__main__":
    # Test Data
    numbers = [64, 25, 12, 22, 11]
    target = 22

    # 1. Linear Search
    print("Linear Search:")
    result = linear_search(numbers, target)
    if result != -1:
        print(f"Element {target} found at index {result}.")
    else:
        print(f"Element {target} not found.")
    
    print("\n" + "-"*50)

    # 2. Binary Search (After sorting the array)
    numbers_sorted = sorted(numbers)  # Binary search requires a sorted array
    print("Binary Search:")
    result = binary_search(numbers_sorted, target)
    if result != -1:
        print(f"Element {target} found at index {result}.")
    else:
        print(f"Element {target} not found.")
    
    print("\n" + "-"*50)

    # 3. Bubble Sort
    print("Bubble Sort:")
    sorted_array_bubble = bubble_sort(numbers.copy())  # Sort a copy of the list
    print(f"Sorted Array: {sorted_array_bubble}")
    
    print("\n" + "-"*50)

    # 4. Selection Sort
    print("Selection Sort:")
    sorted_array_selection = selection_sort(numbers.copy())  # Sort a copy of the list
    print(f"Sorted Array: {sorted_array_selection}")
    
    print("\n" + "-"*50)

    # 5. Insertion Sort
    print("Insertion Sort:")
    sorted_array_insertion = insertion_sort(numbers.copy())  # Sort a copy of the list
    print(f"Sorted Array: {sorted_array_insertion}")
