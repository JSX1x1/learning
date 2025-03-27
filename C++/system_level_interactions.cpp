#include <iostream>
#include <fstream>      // For file handling
#include <unistd.h>     // For system calls like fork, exec, and sleep
#include <sys/types.h>  // For system-related types (pid_t, etc.)
#include <sys/wait.h>   // For wait() to manage child processes
#include <cstring>      // For handling C-strings (e.g., strcpy, strerror)
#include <cstdlib>      // For exit(), getenv(), etc.
#include <signal.h>     // For signal handling
#include <ctime>        // For time-related functions
#include <thread>       // For threading (C++11)
#include <mutex>        // For synchronization

using namespace std;

// --- SECTION 1: File Handling in C++ ---

// File I/O is one of the fundamental system-level operations.
// The following code demonstrates how to read from and write to files in C++.

void fileHandling() {
    cout << "--- SECTION 1: File Handling ---" << endl;
    
    // Writing to a file
    ofstream outFile("example.txt");  // Open a file to write
    if (outFile.is_open()) {
        outFile << "Hello, System Programming in C++!" << endl;
        outFile << "This file demonstrates basic file operations." << endl;
        outFile.close();  // Don't forget to close the file!
        cout << "Written to file successfully!" << endl;
    } else {
        cerr << "Failed to open the file for writing!" << endl;
    }

    // Reading from a file
    ifstream inFile("example.txt");  // Open the file to read
    if (inFile.is_open()) {
        string line;
        while (getline(inFile, line)) {
            cout << line << endl;  // Output each line from the file
        }
        inFile.close();  // Close the file after reading
    } else {
        cerr << "Failed to open the file for reading!" << endl;
    }
    cout << endl;
}

// --- SECTION 2: Process Management ---
// System calls like `fork()`, `exec()`, and `wait()` are used for process management in C++.

void processManagement() {
    cout << "--- SECTION 2: Process Management ---" << endl;

    pid_t pid = fork();  // Creates a child process
    if (pid < 0) {
        cerr << "Fork failed!" << endl;
        exit(1);
    } else if (pid == 0) {
        // Child process
        cout << "This is the child process!" << endl;
        // Executing a command in the child process
        execlp("/bin/echo", "echo", "Hello from the child process!", NULL);
    } else {
        // Parent process
        cout << "This is the parent process, waiting for the child to finish..." << endl;
        wait(NULL);  // Wait for the child process to terminate
        cout << "Child process finished!" << endl;
    }
    cout << endl;
}

// --- SECTION 3: Memory Management ---
// In C++, we use pointers for dynamic memory allocation and system-level memory management.

void memoryManagement() {
    cout << "--- SECTION 3: Memory Management ---" << endl;

    int* ptr = new int;  // Dynamically allocate memory for an integer
    *ptr = 100;
    cout << "Dynamically allocated memory holds value: " << *ptr << endl;

    delete ptr;  // Free the allocated memory
    cout << "Memory has been deallocated!" << endl;
    cout << endl;
}

// --- SECTION 4: Sleep and Time Management ---
// `sleep()` and `time()` functions are system calls that manage sleep and retrieve system time.

void sleepAndTime() {
    cout << "--- SECTION 4: Sleep and Time Management ---" << endl;

    cout << "Sleeping for 3 seconds..." << endl;
    sleep(3);  // Sleep for 3 seconds
    cout << "Woke up!" << endl;

    // Get the current system time
    time_t now = time(0);
    char* dt = ctime(&now);
    cout << "Current date and time: " << dt << endl;
    cout << endl;
}

// --- SECTION 5: Environment Variables ---
// Access system environment variables using `getenv()`.

void environmentVariables() {
    cout << "--- SECTION 5: Environment Variables ---" << endl;

    const char* path = getenv("PATH");  // Get the PATH environment variable
    if (path) {
        cout << "System PATH: " << path << endl;
    } else {
        cerr << "Failed to retrieve PATH environment variable!" << endl;
    }
    cout << endl;
}

// --- SECTION 6: Signal Handling ---
// Signal handling is a way to catch and respond to system signals (like SIGINT).

void signalHandler(int signum) {
    cout << "Caught signal " << signum << ", terminating program!" << endl;
    exit(signum);  // Exit the program on receiving a signal
}

void signalHandling() {
    cout << "--- SECTION 6: Signal Handling ---" << endl;

    // Register signal handler for SIGINT (Ctrl+C)
    signal(SIGINT, signalHandler);

    // Infinite loop to demonstrate signal handling
    while (true) {
        cout << "Running... Press Ctrl+C to send SIGINT." << endl;
        sleep(1);  // Sleep for 1 second before printing again
    }
}

// --- SECTION 7: Multithreading ---
// C++11 and later provide a `<thread>` library for multithreading.

void printMessage(int threadId) {
    cout << "Hello from thread " << threadId << endl;
}

void multithreading() {
    cout << "--- SECTION 7: Multithreading ---" << endl;

    // Creating two threads
    thread t1(printMessage, 1);
    thread t2(printMessage, 2);

    // Wait for both threads to complete
    t1.join();
    t2.join();

    cout << "Both threads have finished!" << endl;
    cout << endl;
}

// --- MAIN FUNCTION ---

int main() {
    // Section 1: File Handling
    fileHandling();

    // Section 2: Process Management
    processManagement();

    // Section 3: Memory Management
    memoryManagement();

    // Section 4: Sleep and Time Management
    sleepAndTime();

    // Section 5: Environment Variables
    environmentVariables();

    // Section 6: Signal Handling
    // Note: Uncomment to run the signal handling demo
    // signalHandling();

    // Section 7: Multithreading
    multithreading();

    return 0;
}