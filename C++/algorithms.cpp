#include <iostream>
#include <vector>
#include <algorithm> // For sorting and other algorithms
#include <climits>   // For INT_MAX and INT_MIN
#include <cmath>     // For mathematical functions

using namespace std;

// Binary Search Algorithm (Iterative)
int binarySearch(const vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2;

        // Check if target is at mid
        if (arr[mid] == target) {
            return mid;  // Target found at index mid
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

// Linear Search Algorithm
int linearSearch(const vector<int>& arr, int target) {
    for (int i = 0; i < arr.size(); i++) {
        if (arr[i] == target) {
            return i;  // Target found at index i
        }
    }
    return -1; // Target not found
}

// Bubble Sort Algorithm (Simple Sorting)
void bubbleSort(vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            // Swap if the element is greater than the next element
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

// Selection Sort Algorithm
void selectionSort(vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }
        // Swap the found minimum element with the first element
        swap(arr[i], arr[minIndex]);
    }
}

// Insertion Sort Algorithm
void insertionSort(vector<int>& arr) {
    int n = arr.size();
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        // Move elements of arr[0..i-1], that are greater than key, to one position ahead
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

// Merge Sort Algorithm (Divide and Conquer)
void merge(vector<int>& arr, int left, int right) {
    if (left >= right) return;

    int mid = left + (right - left) / 2;
    
    merge(arr, left, mid);
    merge(arr, mid + 1, right);

    // Merge two sorted halves
    vector<int> leftArr(arr.begin() + left, arr.begin() + mid + 1);
    vector<int> rightArr(arr.begin() + mid + 1, arr.begin() + right + 1);

    int i = 0, j = 0, k = left;
    while (i < leftArr.size() && j < rightArr.size()) {
        if (leftArr[i] <= rightArr[j]) {
            arr[k++] = leftArr[i++];
        } else {
            arr[k++] = rightArr[j++];
        }
    }

    while (i < leftArr.size()) {
        arr[k++] = leftArr[i++];
    }

    while (j < rightArr.size()) {
        arr[k++] = rightArr[j++];
    }
}

void mergeSort(vector<int>& arr) {
    merge(arr, 0, arr.size() - 1);
}

// Quick Sort Algorithm (Divide and Conquer)
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high];  // Choose the rightmost element as pivot
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

void quickSort(vector<int>& arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);

        quickSort(arr, low, pi - 1); // Before partition
        quickSort(arr, pi + 1, high); // After partition
    }
}

// Finding the Greatest Common Divisor (GCD) using Euclidean Algorithm
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// Finding the Least Common Multiple (LCM)
int lcm(int a, int b) {
    return (a * b) / gcd(a, b);
}

// Fibonacci Sequence (Recursion)
int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// Finding Factorial of a Number (Using Recursion)
int factorial(int n) {
    if (n == 0) return 1;
    return n * factorial(n - 1);
}

int main() {
    // Binary Search
    vector<int> arr = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int target = 5;
    int index = binarySearch(arr, target);
    cout << "Binary Search - Target " << target << " is at index: " << index << endl;

    // Linear Search
    target = 7;
    index = linearSearch(arr, target);
    cout << "Linear Search - Target " << target << " is at index: " << index << endl;

    // Sorting Algorithms
    vector<int> arr2 = {64, 34, 25, 12, 22, 11, 90};
    
    cout << "\nOriginal Array: ";
    for (int num : arr2) cout << num << " ";
    
    bubbleSort(arr2);
    cout << "\nBubble Sort: ";
    for (int num : arr2) cout << num << " ";
    
    // Reset the array
    arr2 = {64, 34, 25, 12, 22, 11, 90};
    selectionSort(arr2);
    cout << "\nSelection Sort: ";
    for (int num : arr2) cout << num << " ";

    // Reset the array
    arr2 = {64, 34, 25, 12, 22, 11, 90};
    insertionSort(arr2);
    cout << "\nInsertion Sort: ";
    for (int num : arr2) cout << num << " ";

    // Reset the array
    arr2 = {64, 34, 25, 12, 22, 11, 90};
    mergeSort(arr2);
    cout << "\nMerge Sort: ";
    for (int num : arr2) cout << num << " ";

    // Reset the array
    arr2 = {64, 34, 25, 12, 22, 11, 90};
    quickSort(arr2, 0, arr2.size() - 1);
    cout << "\nQuick Sort: ";
    for (int num : arr2) cout << num << " ";

    // GCD and LCM
    int a = 36, b = 60;
    cout << "\nGCD of " << a << " and " << b << " is: " << gcd(a, b) << endl;
    cout << "LCM of " << a << " and " << b << " is: " << lcm(a, b) << endl;

    // Fibonacci
    int n = 5;
    cout << "\nFibonacci of " << n << " is: " << fibonacci(n) << endl;

    // Factorial
    cout << "\nFactorial of " << n << " is: " << factorial(n) << endl;

    return 0;
}