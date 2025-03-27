#include <iostream>
#include <cmath>    // For mathematical functions like sqrt
#include <algorithm> // For array manipulation like std::sort

using namespace std;

// Function to print an array
void printArray(int arr[], int size) {
    cout << "Array: ";
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

// Function to find the sum of elements in an array
int sumArray(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}

// Function to find the average of elements in an array
double averageArray(int arr[], int size) {
    int sum = sumArray(arr, size);
    return static_cast<double>(sum) / size;
}

// Function to find the maximum element in an array
int maxArray(int arr[], int size) {
    int maxVal = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > maxVal) {
            maxVal = arr[i];
        }
    }
    return maxVal;
}

// Function to find the minimum element in an array
int minArray(int arr[], int size) {
    int minVal = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] < minVal) {
            minVal = arr[i];
        }
    }
    return minVal;
}

// Function to reverse an array
void reverseArray(int arr[], int size) {
    int start = 0;
    int end = size - 1;
    while (start < end) {
        // Swap elements at start and end
        swap(arr[start], arr[end]);
        start++;
        end--;
    }
}

// Function to sort an array
void sortArray(int arr[], int size) {
    // Using C++ standard library function to sort the array
    sort(arr, arr + size);
}

// Function to check if an array contains a specific element
bool contains(int arr[], int size, int element) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == element) {
            return true;
        }
    }
    return false;
}

// Function to perform binary search (Array should be sorted)
int binarySearch(int arr[], int size, int target) {
    int left = 0;
    int right = size - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        // Check if target is at mid
        if (arr[mid] == target) {
            return mid; // Target found
        }
        
        // If target is greater, ignore left half
        if (arr[mid] < target) {
            left = mid + 1;
        }
        // If target is smaller, ignore right half
        else {
            right = mid - 1;
        }
    }
    return -1; // Target not found
}

// Function to demonstrate 2D array
void print2DArray(int arr[][3], int rows) {
    cout << "2D Array: " << endl;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < 3; j++) {
            cout << arr[i][j] << " ";
        }
        cout << endl;
    }
}

int main() {
    // 1. **Basic Array Operations**
    cout << "Basic Array Operations: " << endl;
    
    int arr[5] = {10, 20, 30, 40, 50};
    int size = 5;
    
    // Printing array
    printArray(arr, size);

    // Sum of array elements
    cout << "Sum of Array: " << sumArray(arr, size) << endl;

    // Average of array elements
    cout << "Average of Array: " << averageArray(arr, size) << endl;

    // Maximum element in array
    cout << "Maximum Element in Array: " << maxArray(arr, size) << endl;

    // Minimum element in array
    cout << "Minimum Element in Array: " << minArray(arr, size) << endl;

    // Reverse array
    reverseArray(arr, size);
    cout << "Reversed Array: ";
    printArray(arr, size);

    // Sort array
    sortArray(arr, size);
    cout << "Sorted Array: ";
    printArray(arr, size);

    // Check if element exists in array
    int searchElement = 30;
    if (contains(arr, size, searchElement)) {
        cout << "Element " << searchElement << " found in array!" << endl;
    } else {
        cout << "Element " << searchElement << " not found in array." << endl;
    }

    // Binary search in sorted array
    int target = 40;
    int index = binarySearch(arr, size, target);
    if (index != -1) {
        cout << "Element " << target << " found at index " << index << endl;
    } else {
        cout << "Element " << target << " not found." << endl;
    }

    // 2. **Working with 2D Arrays**
    cout << "\nWorking with 2D Arrays: " << endl;
    int arr2D[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    
    print2DArray(arr2D, 3);

    // 3. **Function Overloading**
    cout << "\nFunction Overloading Example: " << endl;
    
    cout << "Sum of two integers: " << sumArray(arr, 2) << endl;  // First two elements
    cout << "Sum of all elements in array: " << sumArray(arr, size) << endl;  // Full array

    // 4. **Passing Arrays to Functions**
    cout << "\nPassing Arrays to Functions Example: " << endl;
    
    // Calling a function to sort and print the array
    sortArray(arr, size);
    cout << "Sorted Array after passing to function: ";
    printArray(arr, size);

    // 5. **Multi-dimensional Arrays**
    cout << "\nDemonstrating Multi-dimensional Array:" << endl;
    int multiDimArr[2][2] = {{1, 2}, {3, 4}};
    print2DArray(multiDimArr, 2);

    // 6. **Use of `sizeof` to get the size of arrays**
    cout << "\nSize of Array: " << sizeof(arr) / sizeof(arr[0]) << endl;
    // Here, sizeof(arr) gives the total size of the array in bytes,
    // and sizeof(arr[0]) gives the size of one element in the array.
    // Dividing them gives the number of elements in the array.

    return 0;
