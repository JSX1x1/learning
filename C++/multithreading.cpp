#include <iostream>
#include <thread>
#include <mutex>
#include <vector>
#include <atomic>
#include <condition_variable>
#include <chrono>

using namespace std;

// --- SECTION 1: Basic Thread Creation ---
void basicThreadFunction() {
    cout << "Hello from a basic thread!" << endl;
}

void basicThreadsDemo() {
    cout << "--- SECTION 1: Basic Thread Creation ---" << endl;
    
    // Creating a thread using std::thread and passing the function
    std::thread t1(basicThreadFunction);
    
    // Wait for the thread to finish
    t1.join();  // Join the thread to the main thread
    
    cout << "Main thread after joining basic thread!" << endl;
    cout << endl;
}

// --- SECTION 2: Threads with Arguments ---
void threadWithArgs(int id) {
    cout << "Thread ID: " << id << " is running!" << endl;
}

void threadsWithArgumentsDemo() {
    cout << "--- SECTION 2: Threads with Arguments ---" << endl;
    
    // Creating threads and passing arguments to the thread function
    std::thread t1(threadWithArgs, 1);
    std::thread t2(threadWithArgs, 2);
    
    // Wait for both threads to finish
    t1.join();
    t2.join();
    
    cout << "Main thread after joining threads with arguments!" << endl;
    cout << endl;
}

// --- SECTION 3: Mutexes and Locks (Thread Synchronization) ---
std::mutex mtx;  // Mutex to protect shared resource

void printWithMutex(int id) {
    mtx.lock();  // Lock mutex to access shared resource
    cout << "Thread ID: " << id << " is printing with a mutex lock!" << endl;
    mtx.unlock();  // Unlock mutex after accessing shared resource
}

void mutexDemo() {
    cout << "--- SECTION 3: Mutexes and Locks ---" << endl;
    
    // Creating multiple threads
    std::thread t1(printWithMutex, 1);
    std::thread t2(printWithMutex, 2);
    
    // Wait for both threads to finish
    t1.join();
    t2.join();
    
    cout << "Main thread after joining threads with mutexes!" << endl;
    cout << endl;
}

// --- SECTION 4: Mutexes with std::lock_guard (RAII) ---
void printWithLockGuard(int id) {
    std::lock_guard<std::mutex> lock(mtx);  // Lock is automatically acquired and released
    cout << "Thread ID: " << id << " is printing with std::lock_guard!" << endl;
}

void lockGuardDemo() {
    cout << "--- SECTION 4: Mutexes with std::lock_guard (RAII) ---" << endl;
    
    // Creating threads
    std::thread t1(printWithLockGuard, 1);
    std::thread t2(printWithLockGuard, 2);
    
    // Wait for threads to finish
    t1.join();
    t2.join();
    
    cout << "Main thread after joining threads with lock_guard!" << endl;
    cout << endl;
}

// --- SECTION 5: Condition Variables (Thread Synchronization) ---
std::mutex cv_mtx;
std::condition_variable cv;
bool ready = false;  // Flag to control condition variable

void waitForWork(int id) {
    std::unique_lock<std::mutex> lck(cv_mtx);
    while (!ready) {  // Wait until ready becomes true
        cv.wait(lck);  // Wait for condition variable signal
    }
    cout << "Thread ID: " << id << " is working!" << endl;
}

void notifyThreads() {
    std::this_thread::sleep_for(std::chrono::seconds(1));  // Simulate work
    ready = true;  // Set ready flag to true
    cv.notify_all();  // Notify all waiting threads
}

void conditionVariableDemo() {
    cout << "--- SECTION 5: Condition Variables ---" << endl;
    
    // Creating multiple threads that will wait for a signal to start working
    std::thread t1(waitForWork, 1);
    std::thread t2(waitForWork, 2);
    
    // Notify the threads after 1 second
    notifyThreads();
    
    // Wait for threads to finish
    t1.join();
    t2.join();
    
    cout << "Main thread after notifying threads!" << endl;
    cout << endl;
}

// --- SECTION 6: Atomic Variables (Thread-Safe Operations) ---
std::atomic<int> counter(0);  // Atomic variable for thread-safe operations

void incrementCounter() {
    for (int i = 0; i < 1000; ++i) {
        counter++;  // Atomic increment operation
    }
}

void atomicDemo() {
    cout << "--- SECTION 6: Atomic Variables ---" << endl;
    
    // Creating multiple threads to increment the counter
    std::thread t1(incrementCounter);
    std::thread t2(incrementCounter);
    
    // Wait for threads to finish
    t1.join();
    t2.join();
    
    cout << "Counter after both threads incrementing: " << counter.load() << endl;  // Thread-safe access to atomic variable
    cout << endl;
}

// --- SECTION 7: Parallel Algorithms (Concurrent Tasks) ---
void parallelDemo() {
    cout << "--- SECTION 7: Parallel Algorithms (Concurrent Tasks) ---" << endl;

    // Parallelizing the execution of a function using a vector of threads
    std::vector<std::thread> threads;

    // Creating 5 threads that execute the same task concurrently
    for (int i = 0; i < 5; ++i) {
        threads.push_back(std::thread([](int id) {
            cout << "Thread ID: " << id << " is performing work in parallel!" << endl;
        }, i));
    }

    // Waiting for all threads to finish
    for (auto& t : threads) {
        t.join();
    }

    cout << "Main thread after joining all parallel threads!" << endl;
    cout << endl;
}

// --- MAIN FUNCTION ---
int main() {
    // Basic thread creation demo
    basicThreadsDemo();
    
    // Threads with arguments demo
    threadsWithArgumentsDemo();
    
    // Mutexes and Locks demo
    mutexDemo();
    
    // Mutexes with std::lock_guard demo (RAII style)
    lockGuardDemo();
    
    // Condition Variables demo
    conditionVariableDemo();
    
    // Atomic Variables demo
    atomicDemo();
    
    // Parallel Algorithms demo
    parallelDemo();

    return 0;
}
