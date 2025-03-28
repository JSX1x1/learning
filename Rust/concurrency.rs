// Rust Guide: Concurrency
use std::thread;
use std::sync::{Arc, Mutex};
use tokio::task; // Importing Tokio task module

// 1. Threads & the std::thread module
fn threads_and_std_thread_module() {
    println!("--- THREADS ---");

    // Creating a new thread with `std::thread::spawn`
    let handle = thread::spawn(|| {
        for i in 1..5 {
            println!("Thread 1 - count: {}", i);
        }
    });

    // Main thread continues to execute while the spawned thread runs
    for i in 1..5 {
        println!("Main thread - count: {}", i);
    }

    // Wait for the spawned thread to finish using `join()`
    handle.join().unwrap();
    println!("Main thread finished executing");
}

// 2. Using Arc & Mutex for Shared State Between Threads
fn arc_and_mutex_for_shared_state() {
    println!("\n--- ARC & MUTEX ---");

    // Using Arc (atomic reference counting) to share ownership across threads
    let counter = Arc::new(Mutex::new(0));

    let mut handles = vec![];

    for _ in 0..10 {
        // Cloning the Arc to share ownership between threads
        let counter_clone = Arc::clone(&counter);

        let handle = thread::spawn(move || {
            let mut num = counter_clone.lock().unwrap(); // Locking the Mutex
            *num += 1; // Incrementing the shared counter
            println!("Counter value: {}", num);
        });

        handles.push(handle);
    }

    // Waiting for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    // Final counter value
    println!("Final counter value: {}", *counter.lock().unwrap());
}

// 3. Using async & Tokio
async fn async_task_1() {
    println!("--- ASYNC WITH TOKIO ---");

    // Simulating some async work (like an I/O operation)
    println!("Async task 1 starting...");
    tokio::time::sleep(tokio::time::Duration::from_secs(2)).await; // Simulating delay
    println!("Async task 1 finished!");
}

async fn async_task_2() {
    // Another async task
    println!("Async task 2 starting...");
    tokio::time::sleep(tokio::time::Duration::from_secs(1)).await; // Simulating delay
    println!("Async task 2 finished!");
}

// Running async tasks concurrently using Tokio
fn async_with_tokio() {
    // Start the Tokio runtime and spawn async tasks
    tokio::runtime::Runtime::new().unwrap().block_on(async {
        // Run tasks concurrently
        let task1 = tokio::spawn(async_task_1());
        let task2 = tokio::spawn(async_task_2());

        // Await both tasks
        let _ = tokio::try_join!(task1, task2);
    });
}

// Calling functions in `main`
fn main() {
    threads_and_std_thread_module();
    arc_and_mutex_for_shared_state();
    async_with_tokio();
}
