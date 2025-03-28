// system_interactions.rs - Interacting with the System using Rust

use std::env;
use std::fs::{File, OpenOptions};
use std::io::{self, Read, Write};
use std::process::{Command, exit};
use std::path::Path;
use std::thread;
use std::time::Duration;

// 1. Working with Files (Reading and Writing)
fn working_with_files() {
    println!("--- WORKING WITH FILES ---");

    // Creating or opening a file for writing
    let mut file = match File::create("example.txt") {
        Ok(f) => f,
        Err(e) => {
            println!("Error creating file: {}", e);
            return;
        }
    };

    // Writing data to the file
    match file.write_all(b"Hello, this is a Rust file handling example!") {
        Ok(_) => println!("Data written to file successfully!"),
        Err(e) => println!("Error writing to file: {}", e),
    }

    // Reading from the file
    let mut file = match File::open("example.txt") {
        Ok(f) => f,
        Err(e) => {
            println!("Error opening file: {}", e);
            return;
        }
    };

    let mut content = String::new();
    match file.read_to_string(&mut content) {
        Ok(_) => println!("Content read from file: \n{}", content),
        Err(e) => println!("Error reading from file: {}", e),
    }
}

// 2. Working with Environment Variables
fn working_with_environment_variables() {
    println!("\n--- WORKING WITH ENVIRONMENT VARIABLES ---");

    // Retrieving the value of an environment variable
    match env::var("HOME") {
        Ok(home) => println!("HOME environment variable: {}", home),
        Err(e) => println!("Error retrieving HOME variable: {}", e),
    }

    // Setting an environment variable (this affects only the current process)
    env::set_var("MY_VAR", "Rust System Interactions");
    match env::var("MY_VAR") {
        Ok(var) => println!("MY_VAR: {}", var),
        Err(e) => println!("Error retrieving MY_VAR: {}", e),
    }

    // Removing an environment variable
    env::remove_var("MY_VAR");
    match env::var("MY_VAR") {
        Ok(var) => println!("MY_VAR still exists: {}", var),
        Err(_) => println!("MY_VAR removed from environment variables."),
    }
}

// 3. Running System Commands
fn running_system_commands() {
    println!("\n--- RUNNING SYSTEM COMMANDS ---");

    // Running a simple command (e.g., `ls` or `dir`)
    let output = Command::new("ls")
        .arg("-l")
        .output()
        .expect("Failed to execute command");

    // Printing the output of the command
    if !output.stdout.is_empty() {
        println!("Command Output:\n{}", String::from_utf8_lossy(&output.stdout));
    }
    if !output.stderr.is_empty() {
        eprintln!("Error Output:\n{}", String::from_utf8_lossy(&output.stderr));
    }
}

// 4. Working with Directories and Paths
fn working_with_directories_and_paths() {
    println!("\n--- WORKING WITH DIRECTORIES AND PATHS ---");

    // Checking if a path exists
    let path = Path::new("example.txt");
    if path.exists() {
        println!("'example.txt' exists.");
    } else {
        println!("'example.txt' does not exist.");
    }

    // Checking if a path is a file or directory
    if path.is_file() {
        println!("'example.txt' is a file.");
    } else if path.is_dir() {
        println!("'example.txt' is a directory.");
    } else {
        println!("'example.txt' is neither a file nor a directory.");
    }

    // Creating a new directory
    let dir_path = Path::new("new_directory");
    if !dir_path.exists() {
        match std::fs::create_dir(dir_path) {
            Ok(_) => println!("New directory created: {:?}", dir_path),
            Err(e) => println!("Error creating directory: {}", e),
        }
    }

    // Removing a directory
    match std::fs::remove_dir(dir_path) {
        Ok(_) => println!("Directory removed: {:?}", dir_path),
        Err(e) => println!("Error removing directory: {}", e),
    }
}

// 5. Working with Threads (Concurrent Tasks)
fn working_with_threads() {
    println!("\n--- WORKING WITH THREADS ---");

    // Spawning a thread to perform a task concurrently
    let handle = thread::spawn(|| {
        for i in 1..5 {
            println!("Thread 1 - count: {}", i);
            thread::sleep(Duration::from_secs(1));
        }
    });

    // Main thread continues to execute while the spawned thread runs
    for i in 1..5 {
        println!("Main thread - count: {}", i);
        thread::sleep(Duration::from_secs(1));
    }

    // Waiting for the spawned thread to finish
    handle.join().unwrap();
    println!("Both threads have finished executing.");
}

// 6. Exiting the Program (Returning an Exit Code)
fn exiting_program() {
    println!("\n--- EXITING THE PROGRAM ---");

    // Program exits with a status code (0 for success, non-zero for failure)
    exit(0); // You can change this value to a non-zero exit code to indicate failure
}

// Main Function to Execute All Tasks
fn main() {
    working_with_files();
    working_with_environment_variables();
    running_system_commands();
    working_with_directories_and_paths();
    working_with_threads();
    exiting_program(); // Uncomment this line to test exiting the program
}
