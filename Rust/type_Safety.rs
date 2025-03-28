// type_safety.rs - Understanding Type Safety in Rust

// 1. Basic Types and Type Safety
fn basic_types_and_type_safety() {
    println!("--- BASIC TYPES AND TYPE SAFETY ---");

    // Integer types (signed and unsigned)
    let signed_int: i32 = -100;   // signed integer
    let unsigned_int: u32 = 100;  // unsigned integer

    // Floating point types
    let float_num: f64 = 3.14;    // 64-bit floating point

    // Boolean type
    let is_active: bool = true;

    // Character type
    let char_example: char = 'A';

    // Printing values
    println!("Signed Integer: {}", signed_int);
    println!("Unsigned Integer: {}", unsigned_int);
    println!("Float Number: {}", float_num);
    println!("Boolean: {}", is_active);
    println!("Character: {}", char_example);

    // Rust is strongly typed, which means you cannot assign a mismatched type
    // let error_example: u32 = -100; // This will cause an error because u32 cannot store negative values.
}

// 2. Type Inference
fn type_inference() {
    println!("\n--- TYPE INFERENCE ---");

    // Rust can infer types based on context
    let inferred_int = 42;    // Rust infers this as an i32 by default
    let inferred_float = 3.14;  // Rust infers this as f64 by default

    println!("Inferred Integer: {}", inferred_int);
    println!("Inferred Float: {}", inferred_float);

    // The compiler infers types, but you can also explicitly specify them
    let explicit_float: f32 = 3.14;  // Explicitly specifying the type
    println!("Explicit Float: {}", explicit_float);
}

// 3. Immutable and Mutable Variables
fn immutable_and_mutable_variables() {
    println!("\n--- IMMUTABLE AND MUTABLE VARIABLES ---");

    // By default, variables are immutable in Rust
    let x = 5;
    println!("Immutable x: {}", x);

    // To make a variable mutable, use the `mut` keyword
    let mut y = 10;
    println!("Mutable y (before change): {}", y);

    // Changing the value of a mutable variable
    y = 15;
    println!("Mutable y (after change): {}", y);

    // Rust enforces the immutability rule for safety; you cannot change immutable variables.
    // let z = 20;
    // z = 25;  // This will cause an error because `z` is immutable.
}

// 4. Type Casting and Conversions
fn type_casting_and_conversions() {
    println!("\n--- TYPE CASTING AND CONVERSIONS ---");

    let int_num: i32 = 100;
    let float_num: f64 = int_num as f64;  // Casting i32 to f64
    println!("Converted i32 to f64: {}", float_num);

    // Converting between different numeric types
    let float_num2: f32 = 2.71828;
    let int_num2: i64 = float_num2 as i64;  // Casting f32 to i64
    println!("Converted f32 to i64: {}", int_num2);

    // Rust provides explicit casting, which ensures type safety by preventing implicit conversions that could lead to data loss.
    // let unsafe_cast: i32 = 1000_000_000; // This could cause overflow in smaller integer types.
    // let safe_cast: i16 = int_num2 as i16; // Safe casting, but will truncate if the value is too large.
}

// 5. Using Traits for Type Safety
fn using_traits_for_type_safety() {
    println!("\n--- USING TRAITS FOR TYPE SAFETY ---");

    // Traits define shared behavior across types, providing type safety
    trait Printable {
        fn print(&self);
    }

    // Struct implementing the Printable trait
    struct Person {
        name: String,
        age: u32,
    }

    impl Printable for Person {
        fn print(&self) {
            println!("Name: {}, Age: {}", self.name, self.age);
        }
    }

    // Creating an instance of Person and using the `print` method from the Printable trait
    let person = Person {
        name: String::from("Alice"),
        age: 30,
    };

    person.print();  // Calling the method defined in the trait

    // This shows how Rust enforces type safety through traits, ensuring only types that implement the trait can use its methods.
}

// 6. Type System Features (Generics and Type Constraints)
fn type_system_features() {
    println!("\n--- TYPE SYSTEM FEATURES ---");

    // Generics allow for creating type-safe code that works with multiple types
    fn print_number<T: std::fmt::Debug>(number: T) {
        println!("Number: {:?}", number);
    }

    print_number(10);  // Works with integer types
    print_number(3.14);  // Works with floating point types

    // Rust enforces constraints on generics to ensure type safety.
    // The `T: std::fmt::Debug` constraint ensures that the type `T` implements the Debug trait, which guarantees that it can be printed.
}

// 7. Enforcing Type Safety in Functions
fn enforcing_type_safety_in_functions() {
    println!("\n--- ENFORCING TYPE SAFETY IN FUNCTIONS ---");

    // Rust ensures that function signatures define the exact types that should be passed in
    fn add_two_numbers(a: i32, b: i32) -> i32 {
        a + b
    }

    // The types are enforced, so we cannot mix and match different types
    let sum = add_two_numbers(5, 10);  // Correct type
    println!("Sum of 5 and 10: {}", sum);

    // The following would cause an error as we are passing a string where an integer is expected:
    // let sum_invalid = add_two_numbers("5", 10); // Error: mismatched types

}

// 8. Type Safety and Option/Result Types
fn type_safety_with_option_and_result() {
    println!("\n--- TYPE SAFETY WITH OPTION AND RESULT TYPES ---");

    // Option type is used to represent a value that could be present or absent
    fn find_item_in_vector(v: Vec<i32>, index: usize) -> Option<i32> {
        if index < v.len() {
            Some(v[index])
        } else {
            None
        }
    }

    let vec = vec![1, 2, 3, 4, 5];
    match find_item_in_vector(vec, 2) {
        Some(value) => println!("Item found: {}", value),
        None => println!("Item not found."),
    }

    // Result type is used for functions that can either succeed or fail
    fn divide(a: i32, b: i32) -> Result<i32, String> {
        if b == 0 {
            Err(String::from("Cannot divide by zero"))
        } else {
            Ok(a / b)
        }
    }

    match divide(10, 2) {
        Ok(result) => println!("Division result: {}", result),
        Err(e) => println!("Error: {}", e),
    }
}

// Main function to run all the sections
fn main() {
    basic_types_and_type_safety();
    type_inference();
    immutable_and_mutable_variables();
    type_casting_and_conversions();
    using_traits_for_type_safety();
    type_system_features();
    enforcing_type_safety_in_functions();
    type_safety_with_option_and_result();
}
