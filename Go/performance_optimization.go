package main

import (
	"fmt"
	"math"
	"math/rand"
	"os"
	"runtime"
	"time"
	"golang.org/x/tools/patterns/pprof"
)

// Main function demonstrating performance optimization techniques
func main() {
	// Example 1: Memory Management and Garbage Collection Tuning
	fmt.Println("Example 1: Memory Management and Garbage Collection Tuning")
	
	// Simulate memory allocation and observe GC
	allocateMemory(1000000)

	// Example 2: Profiling Go programs using pprof
	fmt.Println("\nExample 2: Profiling Go programs using pprof")

	// Simulate a CPU-heavy operation that we'll profile
	heavyComputation()

	// Example 3: Identifying Bottlenecks and Optimizing Algorithms
	fmt.Println("\nExample 3: Identifying Bottlenecks and Optimizing Algorithms")

	// Run an inefficient algorithm to identify bottleneck
	inefficientAlgorithm()

	// Run an optimized algorithm
	optimizedAlgorithm()

	// Example 4: Tuning the Garbage Collector
	fmt.Println("\nExample 4: Tuning Garbage Collection")
	// Reduce the number of garbage collections by adjusting the GOMAXPROCS setting
	runtime.GOMAXPROCS(2) // Set the maximum number of CPU cores used by the Go runtime

	// Run some work to see the effect of GOMAXPROCS tuning
	performSomeWork()

	// Keep the program running for observation (in real use cases, proper exit handling is needed)
	time.Sleep(5 * time.Second)
}

// Example 1: Memory Management and Garbage Collection Tuning
// Function that allocates a large array to observe garbage collection behavior
func allocateMemory(size int) {
	// Simulate memory allocation by creating a large slice
	data := make([]int, size)
	for i := range data {
		data[i] = rand.Intn(100)
	}

	// Allow time for GC to run
	fmt.Println("Allocated memory for large array. Now forcing garbage collection.")
	runtime.GC() // Manually trigger garbage collection
	fmt.Printf("Memory allocated for %d elements\n", size)

	// Simulate more memory-intensive work
	time.Sleep(1 * time.Second)
}

// Example 2: Profiling Go programs using pprof
// Function simulating a CPU-heavy task that will be profiled
func heavyComputation() {
	// Start CPU profiling with pprof (output to file)
	f, err := os.Create("cpu_profile.pprof")
	if err != nil {
		fmt.Println("Could not create file for CPU profiling:", err)
		return
	}
	defer f.Close()

	// Start CPU profiling
	pprof.StartCPUProfile(f)
	defer pprof.StopCPUProfile()

	// Simulate a CPU-heavy task
	fmt.Println("Starting heavy computation...")
	for i := 0; i < 1000000; i++ {
		_ = math.Sqrt(float64(rand.Intn(100000))) // Random number calculations to simulate work
	}
	fmt.Println("Heavy computation finished.")
}

// Example 3: Identifying Bottlenecks and Optimizing Algorithms
// Simulating an inefficient algorithm (fibonacci recursive)
func inefficientAlgorithm() {
	start := time.Now()
	// Inefficient recursive Fibonacci function
	n := 40 // Fibonacci number (large n for inefficiency)
	fmt.Printf("Calculating Fibonacci of %d inefficiently...\n", n)
	result := fibonacciRecursive(n)
	fmt.Printf("Fibonacci(%d) = %d\n", n, result)
	duration := time.Since(start)
	fmt.Printf("Inefficient algorithm took %s\n", duration)
}

// Optimized Fibonacci algorithm using memoization
func optimizedAlgorithm() {
	start := time.Now()
	// Optimized Fibonacci using memoization
	n := 40
	fmt.Printf("Calculating Fibonacci of %d efficiently...\n", n)
	result := fibonacciOptimized(n)
	fmt.Printf("Fibonacci(%d) = %d\n", n, result)
	duration := time.Since(start)
	fmt.Printf("Optimized algorithm took %s\n", duration)
}

// Inefficient recursive Fibonacci function
func fibonacciRecursive(n int) int {
	if n <= 1 {
		return n
	}
	return fibonacciRecursive(n-1) + fibonacciRecursive(n-2)
}

// Optimized Fibonacci using memoization
var memo = make(map[int]int)

func fibonacciOptimized(n int) int {
	if n <= 1 {
		return n
	}
	if result, found := memo[n]; found {
		return result
	}
	memo[n] = fibonacciOptimized(n-1) + fibonacciOptimized(n-2)
	return memo[n]
}

// Example 4: Tuning Garbage Collection
// Function simulating some work and observing GC effect
func performSomeWork() {
	// Simulate some work that can benefit from garbage collection tuning
	for i := 0; i < 100000; i++ {
		_ = rand.Intn(100)
	}

	// Forcing garbage collection to observe its effect
	runtime.GC()
	fmt.Println("Performed work with adjusted garbage collection tuning.")
}
