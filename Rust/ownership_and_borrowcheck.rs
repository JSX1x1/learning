// Rust Guide: Ownership, Borrowing, The Borrow Checker, and Lifetimes

// 1. Ownership & Borrowing
fn ownership_and_borrowing() {
    // Ownership rules:
    // 1. Each value in Rust has a single owner.
    // 2. When the owner goes out of scope, Rust automatically frees the memory.

    let s1 = String::from("Hello, Ownership!");
    let s2 = s1; // Ownership moves to `s2`, `s1` is no longer valid.

    // println!("{}", s1); // ERROR: `s1` is invalid after move.

    // To keep using `s1`, we need to clone the data
    let s3 = s2.clone();
    println!("Cloned string: {}", s3);

    // Borrowing instead of moving ownership
    let length = calculate_length(&s3); // Pass by reference
    println!("Length of '{}': {}", s3, length);
}

// Function borrowing a string reference (`&String`) instead of taking ownership
fn calculate_length(s: &String) -> usize {
    s.len() // Can access `s`, but does NOT own it
}

// 2. The Borrow Checker
fn borrow_checker() {
    let mut text = String::from("Hello");

    // Immutable reference (Can have multiple)
    let r1 = &text;
    let r2 = &text;
    println!("Immutable References: {}, {}", r1, r2);

    // Mutable reference (Only ONE at a time!)
    let r3 = &mut text;
    r3.push_str(", Rust!");
    println!("Mutable Reference: {}", r3);

    // println!("{}", r1); // ERROR: Cannot use `r1` after a mutable reference
}

// 3. References & Lifetimes
fn references_and_lifetimes() {
    let string1 = String::from("Long string");
    let string2 = String::from("Short");

    // Borrowing with explicit lifetime
    let result = longest(&string1, &string2);
    println!("The longest string is: {}", result);
}

// Function that returns a reference (with explicit lifetime `'a`)
fn longest<'a>(s1: &'a str, s2: &'a str) -> &'a str {
    if s1.len() > s2.len() {
        s1
    } else {
        s2
    }
}

// Calling functions in `main`
fn main() {
    ownership_and_borrowing();
    borrow_checker();
    references_and_lifetimes();
}
