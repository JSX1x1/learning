// macros.rs

// Rust macros allow you to define code that can generate other code at compile time.
// Macros are often used to reduce boilerplate code, enable metaprogramming, and create domain-specific languages (DSLs).

fn main() {
    println!("--- Rust Macros ---");
    simple_macro_example();
    macro_with_arguments();
    repeating_code_macro();
    macros_with_conditionals();
    match_example_macro();
    custom_macro_rules();
}

// -------------------------------
// 1. Simple Macro
// -------------------------------
// A simple macro using the `macro_rules!` keyword. This macro will expand to a print statement.
macro_rules! say_hello {
    () => {
        println!("Hello from the macro!");
    };
}

fn simple_macro_example() {
    // Calling the simple macro
    say_hello!(); // Expands to: println!("Hello from the macro!");
}

// -------------------------------
// 2. Macro with Arguments
// -------------------------------
// This macro takes arguments and expands based on them. It can be used to create a flexible pattern for repeated code.
macro_rules! create_point {
    ($x:expr, $y:expr) => {
        Point { x: $x, y: $y }
    };
}

// Struct to demonstrate macro usage
struct Point {
    x: i32,
    y: i32,
}

fn macro_with_arguments() {
    // Calling the macro with arguments
    let p = create_point!(10, 20); // Expands to: Point { x: 10, y: 20 }
    println!("Point: ({}, {})", p.x, p.y);
}

// -------------------------------
// 3. Repeating Code with Macros
// -------------------------------
// You can use macros to repeat code multiple times, reducing the need for manually duplicating code.
macro_rules! repeat_code {
    ($val:expr, $times:expr) => {
        for _ in 0..$times {
            println!("{}", $val);
        }
    };
}

fn repeating_code_macro() {
    // This will print "Rust!" 5 times
    repeat_code!("Rust!", 5); // Expands to a for loop printing the value 5 times
}

// -------------------------------
// 4. Macros with Conditionals
// -------------------------------
// Macros can also contain conditionals to customize their behavior.
macro_rules! check_positive {
    ($val:expr) => {
        if $val > 0 {
            println!("{} is positive!", $val);
        } else {
            println!("{} is not positive.", $val);
        }
    };
}

fn macros_with_conditionals() {
    // This will check if the value is positive or not
    check_positive!(10);  // Expands to a conditional block checking the value
    check_positive!(-5);  // Expands to a conditional block checking the value
}

// -------------------------------
// 5. Macros with Match Statements
// -------------------------------
// You can also use macros to implement `match` patterns, similar to `match` statements in Rust.
macro_rules! match_example {
    ( $x:expr ) => {
        match $x {
            1 => println!("One!"),
            2 => println!("Two!"),
            _ => println!("Something else!"),
        }
    };
}

fn match_example_macro() {
    // Using the macro to match against the number 2
    match_example!(2); // Expands to the match statement for 2
}

// -------------------------------
// 6. Custom Macro Rules
// -------------------------------
// Macros can be more complex, defining rules for multiple patterns of arguments and expanding to different code for each case.
macro_rules! create_vector {
    // Case for creating a vector of integers
    ( $( $x:expr ),* ) => {
        {
            let mut v = Vec::new();
            $(
                v.push($x); // Expands for each $x in the input expression
            )*
            v
        }
    };
}

fn custom_macro_rules() {
    // Using the macro to create a vector from multiple values
    let v = create_vector!(1, 2, 3, 4, 5);
    println!("Created vector: {:?}", v); // Prints the vector [1, 2, 3, 4, 5]
}
