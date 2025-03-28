#include <iostream>
#include <vector>
#include <map>
#include <algorithm>
#include <string>
#include <fstream>
#include <iterator>
#include <functional>
#include <numeric>

// Function to demonstrate vector usage
void vectorExample() {
    std::vector<int> vec = {10, 20, 30, 40, 50};

    // Adding elements
    vec.push_back(60);

    // Iterating using a range-based for loop
    std::cout << "Vector elements: ";
    for (int val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // Finding max element
    auto maxElem = *std::max_element(vec.begin(), vec.end());
    std::cout << "Max element in vector: " << maxElem << std::endl;
}

// Function to demonstrate map usage
void mapExample() {
    std::map<std::string, int> wordCount;
    wordCount["apple"] = 3;
    wordCount["banana"] = 5;
    wordCount["cherry"] = 2;

    // Iterating through map
    std::cout << "Map elements: ";
    for (const auto& pair : wordCount) {
        std::cout << pair.first << ": " << pair.second << " ";
    }
    std::cout << std::endl;

    // Finding an element
    auto search = wordCount.find("banana");
    if (search != wordCount.end()) {
        std::cout << "Found 'banana' with count: " << search->second << std::endl;
    }
}

// Function to demonstrate string manipulation
void stringExample() {
    std::string str = "Hello, World!";
    
    // String length
    std::cout << "String length: " << str.length() << std::endl;
    
    // Substring
    std::string subStr = str.substr(7, 5);  // Get "World"
    std::cout << "Substring: " << subStr << std::endl;

    // Find a substring
    size_t found = str.find("World");
    if (found != std::string::npos) {
        std::cout << "'World' found at position: " << found << std::endl;
    }
}

// Function to demonstrate file I/O
void fileExample() {
    std::ofstream outFile("example.txt");
    
    // Writing to file
    if (outFile.is_open()) {
        outFile << "Hello, file IO!" << std::endl;
        outFile << "Writing to a file in C++ is easy." << std::endl;
        outFile.close();
    }

    // Reading from file
    std::ifstream inFile("example.txt");
    std::string line;
    if (inFile.is_open()) {
        std::cout << "Contents of example.txt:" << std::endl;
        while (std::getline(inFile, line)) {
            std::cout << line << std::endl;
        }
        inFile.close();
    }
}

// Function to demonstrate algorithm usage (e.g., accumulate, sort)
void algorithmExample() {
    std::vector<int> vec = {5, 1, 9, 3, 7, 2};

    // Sorting the vector
    std::sort(vec.begin(), vec.end());
    std::cout << "Sorted vector: ";
    for (int val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // Calculating the sum of the elements using accumulate
    int sum = std::accumulate(vec.begin(), vec.end(), 0);
    std::cout << "Sum of vector elements: " << sum << std::endl;
}

// Function to demonstrate function objects (e.g., std::greater, std::function)
void functionObjectExample() {
    std::vector<int> vec = {10, 20, 30, 40, 50};

    // Using a function object to sort in descending order
    std::sort(vec.begin(), vec.end(), std::greater<int>());
    std::cout << "Sorted in descending order: ";
    for (int val : vec) {
        std::cout << val << " ";
    }
    std::cout << std::endl;

    // Using std::function to store and invoke a lambda function
    std::function<int(int, int)> add = [](int a, int b) { return a + b; };
    std::cout << "Result of add(5, 10): " << add(5, 10) << std::endl;
}

int main() {
    std::cout << "Demonstrating C++ Standard Library Usage:" << std::endl;

    vectorExample();
    mapExample();
    stringExample();
    fileExample();
    algorithmExample();
    functionObjectExample();

    return 0;
}