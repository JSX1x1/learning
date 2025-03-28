// external_crates.rs

// ------------------------------------------------------------------
// Introduction to External Crates
// ------------------------------------------------------------------

/*
In Rust, an external crate is a library that is not part of the standard library but is included by using a package manager called `cargo`.
Cargo allows you to manage Rust packages and dependencies, which are specified in the `Cargo.toml` file of your project.

External crates are commonly used to add functionality such as web servers, JSON parsing, file I/O, and more.

In this file, we will demonstrate how to include and use external crates in a Rust project.

To include an external crate, you need to add it to your `Cargo.toml` file like so:

[dependencies]
serde = "1.0"  // An example crate for JSON serialization/deserialization
reqwest = "0.11"  // An example crate for making HTTP requests
*/

// ------------------------------------------------------------------
// Setting Up Cargo.toml
// ------------------------------------------------------------------

/*
To use external crates, you first need to specify them in your `Cargo.toml` file.
Here's an example `Cargo.toml` file for a project that uses the `serde` and `reqwest` crates:

```toml
[dependencies]
serde = { version = "1.0", features = ["derive"] }
serde_json = "1.0"
reqwest = "0.11"
tokio = { version = "1", features = ["full"] }
```

- `serde` is used for serializing and deserializing Rust data structures into various formats (like JSON).
- `reqwest` is a simple HTTP client that allows you to make requests to APIs.
- `tokio` is an asynchronous runtime required by `reqwest` to handle asynchronous I/O operations.

After adding these dependencies to your `Cargo.toml` file, you can run `cargo build` to fetch and compile the external crates.
*/

// ------------------------------------------------------------------
// Using Serde for JSON Serialization and Deserialization
// ------------------------------------------------------------------

/*
The `serde` crate is a powerful framework for serializing and deserializing Rust data structures into formats like JSON, BSON, etc.
In this example, we will use `serde` and `serde_json` to serialize a Rust struct into a JSON string and deserialize a JSON string into a Rust struct.
*/

// Add these dependencies to `Cargo.toml`:

// [dependencies]
// serde = { version = "1.0", features = ["derive"] }
// serde_json = "1.0"

use serde::{Serialize, Deserialize};
use serde_json;

#[derive(Serialize, Deserialize, Debug)]
struct Person {
    name: String,
    age: u32,
}

fn main() {
    // Creating a sample struct
    let person = Person {
        name: String::from("Alice"),
        age: 30,
    };

    // Serializing the struct to JSON
    let json_string = serde_json::to_string(&person).unwrap();
    println!("Serialized JSON: {}", json_string);

    // Deserializing the JSON back to a struct
    let deserialized_person: Person = serde_json::from_str(&json_string).unwrap();
    println!("Deserialized struct: {:?}", deserialized_person);
}

// ------------------------------------------------------------------
// Using Reqwest for HTTP Requests
// ------------------------------------------------------------------

/*
`reqwest` is a crate that simplifies sending HTTP requests in Rust. It supports both synchronous and asynchronous requests.
In this example, we will make an asynchronous GET request to an API using the `reqwest` crate.
*/

// Add these dependencies to `Cargo.toml`:

// [dependencies]
// reqwest = "0.11"
// tokio = { version = "1", features = ["full"] }

// Tokio is an asynchronous runtime and is required for handling asynchronous tasks

use reqwest::Error;

#[tokio::main]  // This macro sets up the Tokio runtime for async functions
async fn main() -> Result<(), Error> {
    let url = "https://api.github.com/repos/rust-lang/rust";

    // Send a GET request
    let response = reqwest::get(url).await?;

    // Check if the response was successful
    if response.status().is_success() {
        let body = response.text().await?;
        println!("Response body: {}", body);
    } else {
        println!("Failed to fetch the URL: {}", response.status());
    }

    Ok(())
}

// ------------------------------------------------------------------
// Using Chrono for Date and Time Manipulation
// ------------------------------------------------------------------

/*
The `chrono` crate is used for working with date and time in Rust. It allows you to manipulate and format dates, times, and durations easily.
*/

// Add this dependency to `Cargo.toml`:

// [dependencies]
// chrono = "0.4"

use chrono::{NaiveDate, Utc};

fn main() {
    // Creating a NaiveDate object
    let date = NaiveDate::from_ymd(2025, 03, 28);
    println!("Created date: {}", date);

    // Getting the current UTC time
    let current_time = Utc::now();
    println!("Current UTC time: {}", current_time);

    // Formatting the current time
    let formatted_time = current_time.format("%Y-%m-%d %H:%M:%S").to_string();
    println!("Formatted time: {}", formatted_time);
}

// ------------------------------------------------------------------
// Using Regex for Pattern Matching
// ------------------------------------------------------------------

/*
The `regex` crate allows you to use regular expressions in Rust. This crate provides a powerful way to search and match patterns in strings.
*/

// Add this dependency to `Cargo.toml`:

// [dependencies]
// regex = "1.5"

use regex::Regex;

fn main() {
    let text = "The quick brown fox jumps over the lazy dog";

    // Creating a Regex pattern
    let re = Regex::new(r"\b\w{5}\b").unwrap();  // Matches words with exactly 5 letters

    // Finding matches
    for word in re.find_iter(text) {
        println!("Found word: {}", word.as_str());
    }
}

// ------------------------------------------------------------------
// Using Diesel for Database Interaction
// ------------------------------------------------------------------

/*
The `diesel` crate is an ORM (Object Relational Mapper) that provides a high-level API for interacting with SQL databases.
It helps you manage your database schema, execute queries, and map SQL results to Rust structs.

For simplicity, we won't go into a detailed Diesel example here. If you need to use Diesel, it involves setting up a database connection and executing queries.
Refer to Diesel's documentation for more detailed examples.
*/

// Add these dependencies to `Cargo.toml`:

// [dependencies]
// diesel = { version = "1.4", features = ["postgres", "chrono"] }
// dotenv = "0.15" // for loading environment variables for the database connection

use diesel::prelude::*;
// Diesel example would typically go here...

// ------------------------------------------------------------------
// Conclusion
// ------------------------------------------------------------------

/*
Working with external crates is an essential part of Rust development. The `cargo` package manager makes it easy to add dependencies to your project and manage them.

In this file, we've demonstrated how to:
- Use `serde` and `serde_json` for JSON serialization and deserialization
- Make asynchronous HTTP requests using `reqwest` and `tokio`
- Handle date and time with the `chrono` crate
- Use regular expressions with the `regex` crate

These are just a few of the many crates available in the Rust ecosystem. You can explore crates.io to find more libraries that suit your project's needs.

Remember to always add your external dependencies to the `Cargo.toml` file and run `cargo build` to compile your project with the new crates.
*/