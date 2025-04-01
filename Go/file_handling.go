package main

import (
	"bufio"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
)

// ========== SECTION 1: CHECK IF FILE EXISTS & PERMISSIONS ==========

// fileExists checks if a file exists and is accessible
func fileExists(filename string) bool {
	info, err := os.Stat(filename)
	if os.IsNotExist(err) {
		return false
	}
	return !info.IsDir()
}

// ========== SECTION 2: READING FILES ==========

// readFile reads a file and prints its content
func readFile(filename string) {
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal("Error opening file:", err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(scanner.Text()) // Print each line
	}

	if err := scanner.Err(); err != nil {
		log.Fatal("Error reading file:", err)
	}
}

// ========== SECTION 3: WRITING & APPENDING TO FILES ==========

// writeFile writes data to a file (creates or overwrites)
func writeFile(filename, content string) {
	file, err := os.Create(filename) // Creates or truncates
	if err != nil {
		log.Fatal("Error creating file:", err)
	}
	defer file.Close()

	_, err = file.WriteString(content)
	if err != nil {
		log.Fatal("Error writing to file:", err)
	}

	fmt.Println("Data written to file successfully!")
}

// appendToFile appends data to an existing file
func appendToFile(filename, content string) {
	file, err := os.OpenFile(filename, os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatal("Error opening file:", err)
	}
	defer file.Close()

	_, err = file.WriteString(content)
	if err != nil {
		log.Fatal("Error appending to file:", err)
	}

	fmt.Println("Data appended to file successfully!")
}

// ========== SECTION 4: COPYING & MOVING FILES ==========

// copyFile copies a file from src to dst
func copyFile(src, dst string) {
	sourceFile, err := os.Open(src)
	if err != nil {
		log.Fatal("Error opening source file:", err)
	}
	defer sourceFile.Close()

	destFile, err := os.Create(dst)
	if err != nil {
		log.Fatal("Error creating destination file:", err)
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, sourceFile)
	if err != nil {
		log.Fatal("Error copying file:", err)
	}

	fmt.Println("File copied successfully!")
}

// moveFile moves a file (rename works for moving in same filesystem)
func moveFile(src, dst string) {
	err := os.Rename(src, dst)
	if err != nil {
		log.Fatal("Error moving file:", err)
	}

	fmt.Println("File moved successfully!")
}

// ========== SECTION 5: DELETING FILES ==========

// deleteFile removes a file
func deleteFile(filename string) {
	err := os.Remove(filename)
	if err != nil {
		log.Fatal("Error deleting file:", err)
	}

	fmt.Println("File deleted successfully!")
}

// ========== SECTION 6: DIRECTORY OPERATIONS ==========

// createDirectory creates a new directory
func createDirectory(dirName string) {
	err := os.Mkdir(dirName, 0755)
	if err != nil {
		log.Fatal("Error creating directory:", err)
	}

	fmt.Println("Directory created successfully!")
}

// deleteDirectory removes an empty directory
func deleteDirectory(dirName string) {
	err := os.Remove(dirName)
	if err != nil {
		log.Fatal("Error deleting directory:", err)
	}

	fmt.Println("Directory deleted successfully!")
}

// listFilesInDirectory lists all files in a directory
func listFilesInDirectory(dirName string) {
	files, err := ioutil.ReadDir(dirName)
	if err != nil {
		log.Fatal("Error reading directory:", err)
	}

	fmt.Println("Files in directory:", dirName)
	for _, file := range files {
		fmt.Println(" -", file.Name())
	}
}

// ========== MAIN FUNCTION ==========

func main() {
	// Define file paths
	file1 := "example.txt"
	file2 := "copy_example.txt"
	file3 := "moved_example.txt"
	dir := "test_directory"

	// SECTION 1: Check File Existence
	if fileExists(file1) {
		fmt.Println(file1, "exists")
	} else {
		fmt.Println(file1, "does not exist, creating it...")
		writeFile(file1, "This is a test file.\n")
	}

	// SECTION 2: Read File
	readFile(file1)

	// SECTION 3: Write & Append to File
	appendToFile(file1, "Appending new data.\n")
	readFile(file1)

	// SECTION 4: Copy & Move File
	copyFile(file1, file2)
	moveFile(file2, file3)

	// SECTION 5: Delete File
	deleteFile(file3)

	// SECTION 6: Directory Operations
	createDirectory(dir)
	listFilesInDirectory(".") // List files in current directory
	deleteDirectory(dir)
}
