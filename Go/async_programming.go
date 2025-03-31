package main

import (
	"fmt"
	"net/http"
	"sync"
	"time"
)

// Simulated task function to download data
func downloadData(url string, wg *sync.WaitGroup, ch chan<- string) {
	defer wg.Done() // Decrements the counter when the goroutine completes
	fmt.Printf("Started downloading from %s\n", url)

	// Simulating a delay like downloading data
	time.Sleep(2 * time.Second)

	// Sending the result back through the channel
	ch <- fmt.Sprintf("Downloaded data from %s", url)
}

// Example function demonstrating asynchronous programming with goroutines
func main() {
	// List of URLs (simulated data)
	urls := []string{
		"http://example.com/file1",
		"http://example.com/file2",
		"http://example.com/file3",
		"http://example.com/file4",
	}

	// WaitGroup to wait for all goroutines to finish
	var wg sync.WaitGroup

	// Channel to receive results from goroutines
	ch := make(chan string, len(urls))

	// Starting goroutines for downloading data concurrently
	for _, url := range urls {
		wg.Add(1) // Increment the counter for each goroutine
		go downloadData(url, &wg, ch)
	}

	// Waiting for all goroutines to finish
	wg.Wait()

	// Close the channel after all goroutines are done
	close(ch)

	// Read and print the results from the channel
	for result := range ch {
		fmt.Println(result)
	}

	// Final message indicating the completion of all downloads
	fmt.Println("All downloads completed!")
}

// Another example using sync.WaitGroup to manage a series of concurrent tasks
func manageMultipleAsyncTasks() {
	// WaitGroup to manage concurrency
	var wg sync.WaitGroup

	// Defining tasks (simulated)
	tasks := []string{"Task 1", "Task 2", "Task 3"}

	// Launching multiple goroutines for concurrent tasks
	for _, task := range tasks {
		wg.Add(1) // Increment WaitGroup counter for each task
		go func(task string) {
			defer wg.Done() // Decrement counter once task is complete
			// Simulating task processing
			fmt.Printf("Started %s\n", task)
			time.Sleep(time.Second) // Simulating work with sleep
			fmt.Printf("%s completed\n", task)
		}(task)
	}

	// Waiting for all tasks to complete
	wg.Wait()

	// Indicating that all tasks are completed
	fmt.Println("All tasks completed!")
}