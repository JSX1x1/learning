#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>
#include <cmath>
#include <functional>
#include <unordered_map>

// Function to demonstrate the use of efficient data structures (unordered_map vs map)
void map_vs_unordered_map() {
    std::cout << "Performance Test: map vs unordered_map\n";

    // Using std::map (ordered)
    std::map<int, int> ordered_map;
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 1000000; ++i) {
        ordered_map[i] = i;
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> map_duration = end - start;
    std::cout << "std::map insertions took: " << map_duration.count() << " seconds\n";

    // Using std::unordered_map (hash table, faster for average cases)
    std::unordered_map<int, int> unordered_map;
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 1000000; ++i) {
        unordered_map[i] = i;
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> unordered_map_duration = end - start;
    std::cout << "std::unordered_map insertions took: " << unordered_map_duration.count() << " seconds\n";
}

// Function to demonstrate the impact of reserving space in vectors
void vector_reserving() {
    std::cout << "Performance Test: vector reserving\n";

    // Without reserving space
    std::vector<int> vec1;
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 1000000; ++i) {
        vec1.push_back(i);
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration1 = end - start;
    std::cout << "Without reserving space: " << duration1.count() << " seconds\n";

    // With reserving space
    std::vector<int> vec2;
    vec2.reserve(1000000);  // Reserve space to avoid reallocations
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 1000000; ++i) {
        vec2.push_back(i);
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration2 = end - start;
    std::cout << "With reserving space: " << duration2.count() << " seconds\n";
}

// Function to demonstrate the impact of loop unrolling
void loop_unrolling() {
    std::cout << "Performance Test: loop unrolling\n";
    const int SIZE = 1000000;
    int sum = 0;

    // Without loop unrolling
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; ++i) {
        sum += i;
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration1 = end - start;
    std::cout << "Without loop unrolling: " << duration1.count() << " seconds\n";

    // With loop unrolling (manual)
    sum = 0;
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; i += 4) {
        sum += i;
        sum += i + 1;
        sum += i + 2;
        sum += i + 3;
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration2 = end - start;
    std::cout << "With loop unrolling: " << duration2.count() << " seconds\n";
}

// Function to demonstrate memoization for improving recursive performance
int factorial_memo(int n, std::unordered_map<int, int>& memo) {
    if (n <= 1) return 1;
    if (memo.find(n) != memo.end()) return memo[n];  // Return cached result
    memo[n] = n * factorial_memo(n - 1, memo);
    return memo[n];
}

void memoization_example() {
    std::cout << "Performance Test: memoization\n";
    std::unordered_map<int, int> memo;

    auto start = std::chrono::high_resolution_clock::now();
    int result = factorial_memo(30, memo);  // Compute factorial of 30
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;
    std::cout << "Factorial result: " << result << ", Time: " << duration.count() << " seconds\n";
}

// Function to demonstrate pre-computing values to avoid redundant calculations
void precomputation_example() {
    std::cout << "Performance Test: pre-computation\n";

    // Pre-compute square values for a large range of numbers
    const int SIZE = 1000000;
    std::vector<int> squares(SIZE);
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; ++i) {
        squares[i] = i * i;  // Pre-compute squares
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;
    std::cout << "Pre-computation time: " << duration.count() << " seconds\n";
}

int main() {
    std::cout << "Demonstrating Performance Tuning Techniques in C++:\n";

    map_vs_unordered_map();
    vector_reserving();
    loop_unrolling();
    memoization_example();
    precomputation_example();

    return 0;
}
