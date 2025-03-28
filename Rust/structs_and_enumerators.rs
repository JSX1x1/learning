// Rust Guide: Structs & Enums

// 1. Defining and Using Structs
fn defining_and_using_structs() {
    // Struct: A custom data type that groups related fields
    #[derive(Debug)] // Allows printing the struct using `{:?}`
    struct Person {
        name: String,
        age: u32,
        email: String,
    }

    // Creating an instance of `Person`
    let user1 = Person {
        name: String::from("Alice"),
        age: 25,
        email: String::from("alice@example.com"),
    };

    println!("User Info: {:?}", user1);

    // Accessing struct fields
    println!("Name: {}", user1.name);
    println!("Age: {}", user1.age);

    // Using a function to create a struct instance
    fn create_person(name: &str, age: u32, email: &str) -> Person {
        Person {
            name: String::from(name),
            age,
            email: String::from(email),
        }
    }

    let user2 = create_person("Bob", 30, "bob@example.com");
    println!("Created User: {:?}", user2);
}

// 2. Tuple Structs & Unit-Like Structs
fn tuple_structs_and_unit_structs() {
    // Tuple struct: Similar to a tuple but with named types
    struct Point(i32, i32, i32);

    let p1 = Point(10, 20, 30);
    println!("Point Coordinates: ({}, {}, {})", p1.0, p1.1, p1.2);

    // Unit-like struct: Often used for marker traits
    struct Marker;
}

// 3. Pattern Matching with Enums
fn pattern_matching_with_enums() {
    // Defining an Enum
    #[derive(Debug)]
    enum Message {
        Quit,
        Move { x: i32, y: i32 }, // Struct-like variant
        Write(String),
        ChangeColor(i32, i32, i32), // Tuple-like variant
    }

    // Function using pattern matching on `Message` enum
    fn process_message(msg: Message) {
        match msg {
            Message::Quit => println!("Received Quit message"),
            Message::Move { x, y } => println!("Moving to coordinates ({}, {})", x, y),
            Message::Write(text) => println!("Writing message: {}", text),
            Message::ChangeColor(r, g, b) => println!("Changing color to RGB({}, {}, {})", r, g, b),
        }
    }

    // Creating enum instances
    let msg1 = Message::Quit;
    let msg2 = Message::Move { x: 10, y: 15 };
    let msg3 = Message::Write(String::from("Hello, Rust!"));
    let msg4 = Message::ChangeColor(255, 100, 50);

    // Processing messages
    process_message(msg1);
    process_message(msg2);
    process_message(msg3);
    process_message(msg4);
}

// Calling functions in `main`
fn main() {
    defining_and_using_structs();
    tuple_structs_and_unit_structs();
    pattern_matching_with_enums();
}
