package main

import (
	"testing"
	"fmt"
)

// ----------------------------
// 1. Example Function to Test
// ----------------------------

// Simple function that adds two integers
func add(a, b int) int {
	return a + b
}

// Another example function that calculates factorial
func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n-1)
}

// ----------------------------
// 2. Unit Tests
// ----------------------------

// Test function for "add" function
func TestAdd(t *testing.T) {
	// Test cases as input-output pairs
	tests := []struct {
		a, b, expected int
	}{
		{1, 2, 3},
		{-1, 1, 0},
		{0, 0, 0},
		{100, 200, 300},
	}

	// Loop through test cases
	for _, test := range tests {
		t.Run(fmt.Sprintf("%d+%d", test.a, test.b), func(t *testing.T) {
			result := add(test.a, test.b)
			if result != test.expected {
				t.Errorf("Expected %d, but got %d", test.expected, result)
			}
		})
	}
}

// Test function for "factorial" function
func TestFactorial(t *testing.T) {
	tests := []struct {
		input, expected int
	}{
		{0, 1},    // 0! = 1
		{1, 1},    // 1! = 1
		{5, 120},  // 5! = 120
		{7, 5040}, // 7! = 5040
	}

	// Loop through test cases
	for _, test := range tests {
		t.Run(fmt.Sprintf("factorial(%d)", test.input), func(t *testing.T) {
			result := factorial(test.input)
			if result != test.expected {
				t.Errorf("Expected %d, but got %d", test.expected, result)
			}
		})
	}
}

// ----------------------------
// 3. Benchmarks
// ----------------------------

// Benchmarking the "add" function
func BenchmarkAdd(b *testing.B) {
	// Run the benchmark b.N times
	for i := 0; i < b.N; i++ {
		add(1, 2)
	}
}

// Benchmarking the "factorial" function
func BenchmarkFactorial(b *testing.B) {
	// Run the benchmark b.N times
	for i := 0; i < b.N; i++ {
		factorial(5)
	}
}

// ----------------------------
// 4. Example of Test-Driven Development (TDD) Approach
// ----------------------------

// Imagine we need to implement a function `multiply` to multiply two integers.
// Before we implement it, we write the test:

// Test for `multiply` function
func TestMultiply(t *testing.T) {
	tests := []struct {
		a, b, expected int
	}{
		{2, 3, 6},
		{-2, 3, -6},
		{0, 100, 0},
		{5, -5, -25},
	}

	// Loop through test cases
	for _, test := range tests {
		t.Run(fmt.Sprintf("%d*%d", test.a, test.b), func(t *testing.T) {
			result := multiply(test.a, test.b)
			if result != test.expected {
				t.Errorf("Expected %d, but got %d", test.expected, result)
			}
		})
	}
}

// Implementing the multiply function after writing the test
func multiply(a, b int) int {
	return a * b
}

// ----------------------------
// 5. Running Tests and Benchmarks
// ----------------------------

func main() {
	// To run tests and benchmarks:
	// Use `go test` to run the unit tests
	// Use `go test -bench .` to run benchmarks

	// This function is just for demonstration purposes.
	// Normally, you would run tests using the `go test` command from the command line.
}
