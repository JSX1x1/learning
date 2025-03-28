// generics_and_traits.rs

// ------------------------------------------------------------------
// Generics
// ------------------------------------------------------------------

/*
Generics in Rust allow you to write functions, structs, enums, and traits that can work with any data type.
Generics help reduce code duplication by writing more flexible and reusable code.
*/

fn print_value<T>(value: T) {
    // `T` is a generic type parameter that can be any type
    println!("{:?}", value);
}

// In this example, `T` can be any type, so we can pass any type of value
fn main() {
    print_value(42);          // Passing an integer
    print_value("Hello");     // Passing a string
    print_value(3.14);        // Passing a floating point number
}

// ------------------------------------------------------------------
// Generic Structs
// ------------------------------------------------------------------

/*
Structs in Rust can also be generic. This is useful when you want a struct to store values of different types.
*/

struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn new(x: T, y: T) -> Point<T> {
        Point { x, y }
    }

    fn get_x(&self) -> &T {
        &self.x
    }

    fn get_y(&self) -> &T {
        &self.y
    }
}

// Here `T` can be any type, such as `i32`, `f64`, etc.
fn main() {
    let integer_point = Point::new(1, 2);
    println!("Integer Point: ({}, {})", integer_point.get_x(), integer_point.get_y());

    let float_point = Point::new(1.1, 2.2);
    println!("Float Point: ({}, {})", float_point.get_x(), float_point.get_y());
}

// ------------------------------------------------------------------
// Generic Enums
// ------------------------------------------------------------------

/*
You can also use generics with enums to make them flexible.
For example, an enum could hold different types of values inside it.
*/

enum Result<T, E> {
    Ok(T),
    Err(E),
}

fn divide(dividend: i32, divisor: i32) -> Result<i32, String> {
    if divisor == 0 {
        Result::Err(String::from("Cannot divide by zero"))
    } else {
        Result::Ok(dividend / divisor)
    }
}

fn main() {
    let result = divide(10, 2);
    match result {
        Result::Ok(value) => println!("Result: {}", value),
        Result::Err(error) => println!("Error: {}", error),
    }
}

// ------------------------------------------------------------------
// Traits
// ------------------------------------------------------------------

/*
Traits are a way to define shared behavior across types. Traits allow you to specify that a type must implement certain methods.
In Rust, traits are similar to interfaces in other languages like Java or C#.
*/

// A basic trait definition
trait Speak {
    fn speak(&self);
}

// Structs that implement the `Speak` trait
struct Dog;
struct Cat;

impl Speak for Dog {
    fn speak(&self) {
        println!("Woof!");
    }
}

impl Speak for Cat {
    fn speak(&self) {
        println!("Meow!");
    }
}

// Functions that accept any type that implements the `Speak` trait
fn make_speak<T: Speak>(animal: T) {
    animal.speak();
}

fn main() {
    let dog = Dog;
    let cat = Cat;
    
    // Call the `speak` method on the dog and cat
    make_speak(dog);
    make_speak(cat);
}

// ------------------------------------------------------------------
// Trait Bounds
// ------------------------------------------------------------------

/*
In some cases, you want to restrict a generic type to only those types that implement a particular trait.
This is done using "trait bounds".
*/

fn largest<T: PartialOrd>(list: &[T]) -> T {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }

    largest.clone()  // Returning the largest item (cloned to return by value)
}

fn main() {
    let int_list = vec![34, 50, 25, 100, 65];
    let float_list = vec![34.5, 50.2, 25.1, 100.4, 65.3];

    let largest_int = largest(&int_list);
    let largest_float = largest(&float_list);

    println!("The largest integer is: {}", largest_int);
    println!("The largest float is: {}", largest_float);
}

// ------------------------------------------------------------------
// Default Type Parameters
// ------------------------------------------------------------------

/*
You can also specify a default type for a generic. This allows you to specify a type when it's not provided.
*/

struct Wrapper<T = i32> {
    value: T,
}

impl<T> Wrapper<T> {
    fn new(value: T) -> Wrapper<T> {
        Wrapper { value }
    }
}

fn main() {
    let default_wrapper = Wrapper::new(42);  // Uses i32 as default
    let custom_wrapper = Wrapper::new("Hello".to_string());  // Custom type (String)

    println!("Default wrapper value: {}", default_wrapper.value);
    println!("Custom wrapper value: {}", custom_wrapper.value);
}

// ------------------------------------------------------------------
// Associated Types and Default Implementations in Traits
// ------------------------------------------------------------------

/*
You can define associated types inside traits. These are types that are part of the trait definition itself and can be implemented by the trait’s implementers.
*/

trait Summary {
    // Associated type definition
    type Output;

    fn summarize(&self) -> Self::Output;
}

struct NewsArticle {
    headline: String,
    content: String,
}

impl Summary for NewsArticle {
    // Providing the associated type (String in this case)
    type Output = String;

    fn summarize(&self) -> Self::Output {
        format!("{} - {}", self.headline, self.content)
    }
}

fn main() {
    let article = NewsArticle {
        headline: String::from("Rust is awesome!"),
        content: String::from("Here's why you should learn Rust..."),
    };

    // Calling the `summarize` method
    println!("Summary: {}", article.summarize());
}

// ------------------------------------------------------------------
// Conclusion
// ------------------------------------------------------------------

/*
Generics and traits are key features in Rust that allow for flexibility, code reuse, and type safety.
Generics enable you to work with different types in a flexible manner, while traits allow you to define shared behavior that different types can implement.
These tools make Rust an incredibly powerful language for system-level programming.
*/
