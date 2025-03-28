#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <future>
#include <chrono>
#include <functional>

// Mutex for thread synchronization
std::mutex mtx;

// Shared resource for thread manipulation
int shared_resource = 0;

// Function to increment the shared resource in a thread-safe way
void thread_safe_increment(int thread_id) {
    std::lock_guard<std::mutex> guard(mtx);  // Lock the mutex to ensure safe access
    shared_resource++;
    std::cout << "Thread " << thread_id << " incremented shared_resource to " << shared_resource << "\n";
}

// Example of using thread pool (simple implementation)
void worker_task(int id) {
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
    std::cout << "Worker thread " << id << " finished work\n";
}

// Function to demonstrate a simple thread pool
void thread_pool_example(int num_threads) {
    std::cout << "Starting thread pool example with " << num_threads << " threads\n";
    std::vector<std::thread> thread_pool;
    for (int i = 0; i < num_threads; ++i) {
        thread_pool.push_back(std::thread(worker_task, i));
    }

    // Wait for all threads to finish
    for (auto& t : thread_pool) {
        t.join();
    }
    std::cout << "Thread pool example finished\n";
}

// Function to demonstrate atomic operations
void atomic_operations() {
    std::atomic<int> counter(0);

    // Launching multiple threads to increment the atomic counter
    std::vector<std::thread> threads;
    for (int i = 0; i < 10; ++i) {
        threads.push_back(std::thread([&counter]() {
            for (int j = 0; j < 1000; ++j) {
                counter++;
            }
        }));
    }

    // Wait for all threads to finish
    for (auto& t : threads) {
        t.join();
    }

    std::cout << "Final atomic counter value: " << counter.load() << "\n";
}

// Function to demonstrate condition variables for thread synchronization
void producer(std::vector<int>& buffer, std::mutex& mtx, std::condition_variable& cv) {
    for (int i = 0; i < 5; ++i) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        {
            std::lock_guard<std::mutex> lock(mtx);
            buffer.push_back(i);
            std::cout << "Produced " << i << "\n";
        }
        cv.notify_all();  // Notify the consumer that data is available
    }
}

void consumer(std::vector<int>& buffer, std::mutex& mtx, std::condition_variable& cv) {
    for (int i = 0; i < 5; ++i) {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&buffer]() { return !buffer.empty(); });

        int data = buffer.back();
        buffer.pop_back();
        std::cout << "Consumed " << data << "\n";
    }
}

// Function to demonstrate async tasks with future and promise
void async_example() {
    std::cout << "Starting async example\n";

    // Create a promise and future
    std::promise<int> promise;
    std::future<int> result = promise.get_future();

    // Start a new thread that will set the promise value
    std::thread t([&promise]() {
        std::this_thread::sleep_for(std::chrono::seconds(2));
        promise.set_value(42);  // Set the value of the promise
    });

    // Do some other work (simulate work in the main thread)
    std::cout << "Main thread doing some work...\n";
    std::this_thread::sleep_for(std::chrono::seconds(1));

    // Wait for the result from the future
    int value = result.get();
    std::cout << "Async result: " << value << "\n";

    t.join();
    std::cout << "Async example finished\n";
}

int main() {
    // Demonstrate thread-safe shared resource increment
    std::cout << "Demonstrating thread-safe increment\n";
    std::vector<std::thread> threads;
    for (int i = 0; i < 5; ++i) {
        threads.push_back(std::thread(thread_safe_increment, i));
    }

    for (auto& t : threads) {
        t.join();
    }

    // Demonstrate a thread pool
    thread_pool_example(4);

    // Demonstrate atomic operations
    atomic_operations();

    // Demonstrate thread synchronization using condition variables
    std::vector<int> buffer;
    std::mutex mtx;
    std::condition_variable cv;
    std::thread producer_thread(producer, std::ref(buffer), std::ref(mtx), std::ref(cv));
    std::thread consumer_thread(consumer, std::ref(buffer), std::ref(mtx), std::ref(cv));

    producer_thread.join();
    consumer_thread.join();

    // Demonstrate async tasks with future and promise
    async_example();

    return 0;
}
