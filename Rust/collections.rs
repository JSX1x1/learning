// Rust Guide: Working with Collections
use std::collections::HashMap;

// 1. VECTORS (Dynamic Arrays)
fn working_with_vectors() {
    println!("--- VECTORS ---");

    // Creating a new empty vector
    let mut numbers: Vec<i32> = Vec::new();
    numbers.push(10);
    numbers.push(20);
    numbers.push(30);

    println!("Vector: {:?}", numbers);

    // Accessing elements
    let first = numbers.get(0); // Using `get()` (safe)
    match first {
        Some(value) => println!("First element: {}", value),
        None => println!("No value found"),
    }

    // Iterating over a vector
    for num in &numbers {
        println!("Number: {}", num);
    }

    // Removing an element
    numbers.pop();
    println!("Vector after pop: {:?}", numbers);

    // Initializing a vector with values
    let mut other_numbers = vec![1, 2, 3, 4, 5];
    println!("Initialized vector: {:?}", other_numbers);

    // Modifying elements
    for num in &mut other_numbers {
        *num *= 2; // Multiply each element by 2
    }
    println!("Modified vector: {:?}", other_numbers);
}

// 2. STRINGS (Text Storage)
fn working_with_strings() {
    println!("\n--- STRINGS ---");

    // Creating a new string
    let mut text = String::from("Hello");

    // Pushing characters & another string
    text.push(' ');
    text.push_str("Rust!");
    println!("String: {}", text);

    // Concatenation using `+`
    let string1 = String::from("Hello, ");
    let string2 = String::from("world!");
    let combined = string1 + &string2;
    println!("Concatenated string: {}", combined);

    // Iterating over a string (chars)
    for ch in text.chars() {
        println!("Character: {}", ch);
    }

    // Checking substring
    if text.contains("Rust") {
        println!("The string contains 'Rust'");
    }

    // Splitting a string
    let sentence = "This is a Rust string.";
    for word in sentence.split_whitespace() {
        println!("Word: {}", word);
    }
}

// 3. HASHMAPS (Key-Value Pairs)
fn working_with_hashmaps() {
    println!("\n--- HASHMAPS ---");

    // Creating a new HashMap
    let mut scores = HashMap::new();

    // Inserting values
    scores.insert(String::from("Alice"), 85);
    scores.insert(String::from("Bob"), 90);
    scores.insert(String::from("Charlie"), 78);

    println!("Scores: {:?}", scores);

    // Accessing values
    let name = String::from("Bob");
    match scores.get(&name) {
        Some(score) => println!("Bob's score: {}", score),
        None => println!("No score found for Bob"),
    }

    // Iterating over HashMap
    for (key, value) in &scores {
        println!("{}: {}", key, value);
    }

    // Updating values
    scores.insert(String::from("Alice"), 95); // Overwrites previous value
    println!("Updated scores: {:?}", scores);

    // Using `entry()` to update only if key is missing
    scores.entry(String::from("David")).or_insert(88);
    println!("Scores after inserting David: {:?}", scores);

    // Removing a key
    scores.remove("Charlie");
    println!("Scores after removing Charlie: {:?}", scores);
}

// Calling functions in `main`
fn main() {
    working_with_vectors();
    working_with_strings();
    working_with_hashmaps();
}
