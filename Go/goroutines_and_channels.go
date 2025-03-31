package main

import (
	"fmt"
	"time"
	"math/rand"
)

// Goroutines are lightweight concurrent units of execution managed by Go's runtime.
// They are created using the `go` keyword and can run concurrently with other goroutines.
// Channels are used to communicate between goroutines and synchronize their execution.

// Main function demonstrating Go's concurrency model with goroutines and channels
func main() {
	// Example 1: Simple Goroutines
	fmt.Println("Example 1: Simple Goroutines")

	// Launch two goroutines that run concurrently
	go sayHello("Goroutine 1")
	go sayHello("Goroutine 2")

	// Sleep to allow goroutines to finish execution
	// (In real-world programs, use synchronization mechanisms like WaitGroup)
	time.Sleep(1 * time.Second)

	// Example 2: Synchronizing Goroutines with Channels
	fmt.Println("\nExample 2: Synchronizing Goroutines with Channels")

	// Create a channel to synchronize goroutines
	ch := make(chan string)

	// Start a goroutine that sends a message through the channel
	go sendMessage("Message from goroutine", ch)

	// Receive the message from the channel
	msg := <-ch
	fmt.Println("Received:", msg)

	// Example 3: Buffered vs Unbuffered Channels
	fmt.Println("\nExample 3: Buffered vs Unbuffered Channels")

	// Unbuffered channel (blocks until data is received)
	unbufferedCh := make(chan string)
	go sendMessage("Unbuffered message", unbufferedCh)
	fmt.Println("Unbuffered message:", <-unbufferedCh)

	// Buffered channel (allows sending and receiving without blocking if buffer is not full)
	bufferedCh := make(chan string, 2) // Create a buffered channel with a buffer size of 2
	go sendMessage("Buffered message 1", bufferedCh)
	go sendMessage("Buffered message 2", bufferedCh)
	go sendMessage("Buffered message 3", bufferedCh) // This will block until there's space in the buffer

	// Receive messages from the buffered channel
	fmt.Println("Buffered message 1:", <-bufferedCh)
	fmt.Println("Buffered message 2:", <-bufferedCh)
	fmt.Println("Buffered message 3:", <-bufferedCh)

	// Example 4: Producer-Consumer Model using Channels
	fmt.Println("\nExample 4: Producer-Consumer Model")

	// Create channels for communication
	producerCh := make(chan int)
	consumerCh := make(chan string)

	// Start producer and consumer goroutines
	go producer(producerCh)
	go consumer(producerCh, consumerCh)

	// Allow time for producer-consumer interaction
	time.Sleep(2 * time.Second)

	// Close the consumer channel when done
	close(consumerCh)
}

// sayHello prints a message
func sayHello(goroutineName string) {
	fmt.Println(goroutineName, "says hello")
}

// sendMessage sends a message to a channel
func sendMessage(message string, ch chan string) {
	time.Sleep(time.Millisecond * 500) // Simulate work
	ch <- message
}

// Example of a Producer goroutine that generates data
func producer(producerCh chan int) {
	// Produce data (random numbers in this case) and send it to the channel
	for i := 0; i < 5; i++ {
		fmt.Println("Producer producing:", i)
		producerCh <- i
		time.Sleep(time.Millisecond * 500) // Simulate work
	}
}

// Example of a Consumer goroutine that processes data from the producer
func consumer(producerCh chan int, consumerCh chan string) {
	// Consume data from the producer and process it
	for item := range producerCh {
		fmt.Println("Consumer received:", item)

		// Process data and send it to the consumer channel
		processedMessage := fmt.Sprintf("Processed %d", item)
		consumerCh <- processedMessage
	}
}
