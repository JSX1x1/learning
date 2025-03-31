package main

import (
	"fmt"
	"sync"
	"time"
)

// Go's concurrency model is based on goroutines and channels, which are lightweight and easy to use.
// Goroutines are functions that run concurrently with other functions in the same address space,
// while channels allow goroutines to communicate with each other and synchronize their execution.

func main() {
	// First, let's explore simple examples of Go's concurrency model.

	// Simple example of running two goroutines concurrently
	go printMessage("Hello from Goroutine 1")
	go printMessage("Hello from Goroutine 2")

	// Let the main function sleep for a while to let the goroutines finish
	// (In real applications, we would use sync.WaitGroup or channels to synchronize)
	time.Sleep(1 * time.Second)

	// Next, let's explore how to use channels to communicate between goroutines.

	// Create a channel to communicate between goroutines
	ch := make(chan string)

	// Start a goroutine that sends data to the channel
	go sendDataToChannel(ch)

	// Receive the data from the channel
	message := <-ch
	fmt.Println("Received from channel:", message)

	// Now, let's look at a more advanced example using sync primitives: sync.Mutex and sync.WaitGroup.

	// Create a WaitGroup to wait for all goroutines to finish
	var wg sync.WaitGroup

	// Mutex to prevent race conditions when accessing shared data
	var mu sync.Mutex

	// Shared counter variable
	counter := 0

	// Launch multiple goroutines to modify the shared counter
	for i := 0; i < 5; i++ {
		wg.Add(1) // Increment the WaitGroup counter
		go incrementCounter(&counter, &mu, &wg)
	}

	// Wait for all goroutines to finish before printing the final counter value
	wg.Wait()

	// Final counter value
	fmt.Println("Final counter value:", counter)
}

// A simple function that simulates a goroutine performing an action
func printMessage(msg string) {
	fmt.Println(msg)
}

// A function that sends data to a channel
func sendDataToChannel(ch chan string) {
	// Simulate some work with a sleep
	time.Sleep(500 * time.Millisecond)
	ch <- "Data sent from goroutine"
}

// A function that increments the counter, demonstrating the use of a Mutex
func incrementCounter(counter *int, mu *sync.Mutex, wg *sync.WaitGroup) {
	// Ensure the function call completes before notifying the WaitGroup
	defer wg.Done()

	// Lock the Mutex to prevent other goroutines from accessing the shared counter
	mu.Lock()

	// Simulate some work by sleeping
	time.Sleep(100 * time.Millisecond)

	// Modify the shared counter
	*counter++

	// Unlock the Mutex to allow other goroutines to access the counter
	mu.Unlock()
}
