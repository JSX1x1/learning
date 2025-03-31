package main

import (
	"errors"
	"fmt"
	"os"
)

// In Go, error handling is an explicit and important part of writing robust programs.
// Go does not have exceptions like some other languages. Instead, it uses a built-in `error` type to represent errors.
// Functions that can fail return an `error` type as their last return value.
// We check the error explicitly after calling such functions.

func main() {
	// Example 1: Basic Error Handling

	// Simulate a function that can return an error
	result, err := divide(10, 2)
	if err != nil {
		// Handle the error
		fmt.Println("Error:", err)
	} else {
		// No error, print the result
		fmt.Println("Result:", result)
	}

	// Try dividing by zero to demonstrate an error
	result, err = divide(10, 0)
	if err != nil {
		// Handle the error
		fmt.Println("Error:", err)
	} else {
		// No error, print the result
		fmt.Println("Result:", result)
	}

	// Example 2: Using custom error types

	// Simulate a file opening error
	err = openFile("nonexistent_file.txt")
	if err != nil {
		// Handle the custom error
		fmt.Println("Custom Error:", err)
	} else {
		fmt.Println("File opened successfully")
	}

	// Example 3: Wrapping errors

	// Simulate a chain of errors
	err = operationThatFails()
	if err != nil {
		// Wrapping errors with more context
		fmt.Println("Wrapped Error:", err)
	}
}

// Example 1: Basic Error Handling - Division function
func divide(a, b int) (int, error) {
	// Check for division by zero
	if b == 0 {
		// Return an error using the errors package
		return 0, errors.New("cannot divide by zero")
	}
	// No error, return the result
	return a / b, nil
}

// Example 2: Custom Error Types
// Define a custom error type
type FileError struct {
	FileName string
}

func (e *FileError) Error() string {
	// Implement the Error() method for our custom error type
	return fmt.Sprintf("file %s could not be opened", e.FileName)
}

// Function that simulates a file open operation and returns a custom error
func openFile(fileName string) error {
	// Simulate a case where the file does not exist
	if fileName == "nonexistent_file.txt" {
		return &FileError{FileName: fileName}
	}
	// File opened successfully (just a simulation)
	return nil
}

// Example 3: Wrapping errors

// Simulate an operation that fails and wraps another error
func operationThatFails() error {
	// Simulate an underlying error
	err := errors.New("network timeout")
	// Wrap the error with additional context
	return fmt.Errorf("operation failed due to: %w", err)
}
