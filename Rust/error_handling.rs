// Rust Guide: Error Handling, Result & Option, Unwrapping & Propagation

use std::fs::File;
use std::io::{self, Read};

// 1. Result and Option Types
fn result_and_option_types() {
    // Option<T>: Used when a value might be `Some(value)` or `None`
    let some_number: Option<i32> = Some(42);
    let no_number: Option<i32> = None;

    // Using `match` to handle Option<T>
    match some_number {
        Some(value) => println!("Some number: {}", value),
        None => println!("No number found"),
    }

    match no_number {
        Some(value) => println!("Some number: {}", value),
        None => println!("No number found"),
    }

    // Result<T, E>: Used when an operation might fail
    let file_result = File::open("non_existent_file.txt");

    match file_result {
        Ok(file) => println!("File opened successfully: {:?}", file),
        Err(e) => println!("Failed to open file: {}", e),
    }
}

// 2. Unwrapping & Error Propagation
fn unwrapping_and_error_propagation() {
    // `unwrap()` - Gets the value or panics if it's an error
    let file = File::open("non_existent_file.txt").unwrap_or_else(|error| {
        println!("Handled Error: {}", error);
        File::create("new_file.txt").expect("Failed to create new file")
    });

    println!("File created or opened: {:?}", file);

    // Propagating errors using `?`
    fn read_file_contents(filename: &str) -> Result<String, io::Error> {
        let mut file = File::open(filename)?; // Propagates error if `open` fails
        let mut contents = String::new();
        file.read_to_string(&mut contents)?; // Propagates error if `read` fails
        Ok(contents)
    }

    match read_file_contents("non_existent_file.txt") {
        Ok(contents) => println!("File contents: {}", contents),
        Err(e) => println!("Failed to read file: {}", e),
    }
}

// 3. Exception Handling, Detection, and Prevention
fn exception_handling() {
    // Using `panic!()` for unrecoverable errors
    fn divide_numbers(a: i32, b: i32) -> i32 {
        if b == 0 {
            panic!("Attempted division by zero!");
        }
        a / b
    }

    // Handling panic with `std::panic::catch_unwind`
    let result = std::panic::catch_unwind(|| {
        println!("Result of division: {}", divide_numbers(10, 0));
    });

    match result {
        Ok(_) => println!("Division succeeded"),
        Err(_) => println!("Panic detected and handled gracefully"),
    }
}

// Calling functions in `main`
fn main() {
    result_and_option_types();
    unwrapping_and_error_propagation();
    exception_handling();
}
