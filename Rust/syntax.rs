// Rust Guide: Basic Syntax, Variables, Ownership, and Functions

// 1. Basic Syntax
// Every Rust program starts with the `main` function
fn main() {
    println!("Hello, Rust!"); // Prints text to the console
}

// 2. Variables & Mutability
fn variables_and_mutability() {
    // Immutable variable (default)
    let x = 10;
    println!("Immutable x: {}", x);

    // Mutable variable
    let mut y = 20;
    println!("Mutable y before change: {}", y);
    y = 30;
    println!("Mutable y after change: {}", y);

    // Constants (MUST be typed and cannot be changed)
    const MAX_POINTS: u32 = 100_000;
    println!("Constant MAX_POINTS: {}", MAX_POINTS);

    // Shadowing (Re-declaring a variable with a new value and type)
    let z = "Shadowing";
    let z = z.len(); // Now `z` is a number
    println!("Shadowed z: {}", z);
}

// 3. Data Types & Ownership
fn data_types_and_ownership() {
    // Rust is statically typed, meaning each variable must have a type.
    let integer: i32 = -42; // Signed 32-bit integer
    let unsigned: u32 = 42; // Unsigned 32-bit integer
    let floating: f64 = 3.14; // 64-bit floating point number
    let boolean: bool = true; // Boolean
    let character: char = 'R'; // Character
    println!("Integer: {}, Unsigned: {}, Float: {}, Bool: {}, Char: {}", integer, unsigned, floating, boolean, character);

    // Ownership: The core concept of Rust memory safety
    let s1 = String::from("Hello"); // String allocated on the heap
    let s2 = s1; // `s1`'s ownership moves to `s2` (s1 is no longer valid)
    println!("String s2 after move: {}", s2);

    // Cloning: If you want to keep using `s1`
    let s3 = s2.clone();
    println!("Cloned string s3: {}", s3);

    // References & Borrowing (Avoids moving ownership)
    let len = calculate_length(&s3);
    println!("Length of s3: {}", len);
}

// Function taking a reference to avoid ownership move
fn calculate_length(s: &String) -> usize {
    s.len()
}

// 4. Functions & Control Flow
fn functions_and_control_flow() {
    // Function with parameters
    fn add(a: i32, b: i32) -> i32 {
        a + b // No semicolon means return this value
    }
    let sum = add(5, 7);
    println!("Sum: {}", sum);

    // If-Else Control Flow
    let number = 10;
    if number > 5 {
        println!("Number is greater than 5");
    } else {
        println!("Number is 5 or less");
    }

    // Match (Better than multiple if-else)
    let grade = "A";
    match grade {
        "A" => println!("Excellent!"),
        "B" => println!("Good job!"),
        _ => println!("Keep trying!"),
    }

    // Loops
    let mut count = 0;
    while count < 3 {
        println!("Count: {}", count);
        count += 1;
    }

    for i in 1..=3 {
        println!("For loop iteration: {}", i);
    }
}

// Calling functions
fn main() {
    variables_and_mutability();
    data_types_and_ownership();
    functions_and_control_flow();
}
