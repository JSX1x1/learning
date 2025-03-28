// object_orientation.rs - Understanding Object-Oriented Programming in Rust

// 1. Introduction to Structs (Encapsulation)
fn introduction_to_structs() {
    println!("--- INTRODUCTION TO STRUCTS (ENCAPSULATION) ---");

    // Structs are the closest thing Rust has to classes in OOP
    struct Person {
        name: String,
        age: u32,
    }

    // Creating an instance of the struct
    let person = Person {
        name: String::from("Alice"),
        age: 30,
    };

    // Accessing the fields of the struct
    println!("Name: {}, Age: {}", person.name, person.age);
}

// 2. Methods and Associated Functions
fn methods_and_associated_functions() {
    println!("\n--- METHODS AND ASSOCIATED FUNCTIONS ---");

    // Struct definition
    struct Rectangle {
        width: f64,
        height: f64,
    }

    // Defining methods within an impl block
    impl Rectangle {
        // Associated function: a function that's not tied to an instance but to the struct itself
        fn new(width: f64, height: f64) -> Rectangle {
            Rectangle { width, height }
        }

        // Method: operates on instances of the struct
        fn area(&self) -> f64 {
            self.width * self.height
        }

        // Method to calculate perimeter
        fn perimeter(&self) -> f64 {
            2.0 * (self.width + self.height)
        }
    }

    // Creating a new Rectangle instance using the associated function
    let rect = Rectangle::new(10.0, 5.0);

    // Accessing methods
    println!("Rectangle Area: {}", rect.area());
    println!("Rectangle Perimeter: {}", rect.perimeter());
}

// 3. Inheritance via Traits (Polymorphism)
fn inheritance_via_traits() {
    println!("\n--- INHERITANCE VIA TRAITS (POLYMORPHISM) ---");

    // Defining a trait (like an interface in other languages)
    trait Shape {
        fn area(&self) -> f64;
        fn perimeter(&self) -> f64;
    }

    // Implementing the Shape trait for Rectangle struct
    struct Circle {
        radius: f64,
    }

    struct Square {
        side: f64,
    }

    impl Shape for Rectangle {
        fn area(&self) -> f64 {
            self.width * self.height
        }

        fn perimeter(&self) -> f64 {
            2.0 * (self.width + self.height)
        }
    }

    impl Shape for Circle {
        fn area(&self) -> f64 {
            std::f64::consts::PI * self.radius * self.radius
        }

        fn perimeter(&self) -> f64 {
            2.0 * std::f64::consts::PI * self.radius
        }
    }

    impl Shape for Square {
        fn area(&self) -> f64 {
            self.side * self.side
        }

        fn perimeter(&self) -> f64 {
            4.0 * self.side
        }
    }

    // Using polymorphism: The Shape trait allows us to treat different shapes uniformly
    let shapes: Vec<Box<dyn Shape>> = vec![
        Box::new(Rectangle { width: 10.0, height: 5.0 }),
        Box::new(Circle { radius: 7.0 }),
        Box::new(Square { side: 4.0 }),
    ];

    for shape in shapes {
        println!("Shape Area: {}", shape.area());
        println!("Shape Perimeter: {}", shape.perimeter());
    }
}

// 4. Encapsulation (Private and Public fields)
fn encapsulation() {
    println!("\n--- ENCAPSULATION ---");

    // Struct with private fields
    struct Employee {
        name: String,
        salary: f64,
    }

    impl Employee {
        // Constructor for creating an Employee
        fn new(name: String, salary: f64) -> Employee {
            Employee { name, salary }
        }

        // Getter method (encapsulation)
        fn get_salary(&self) -> f64 {
            self.salary
        }

        // Setter method (encapsulation)
        fn set_salary(&mut self, new_salary: f64) {
            self.salary = new_salary;
        }
    }

    // Creating an Employee instance
    let mut employee = Employee::new(String::from("Bob"), 50000.0);

    // Accessing the private field through methods
    println!("Employee Salary: {}", employee.get_salary());

    // Changing salary using a setter
    employee.set_salary(55000.0);
    println!("Updated Salary: {}", employee.get_salary());
}

// 5. Polymorphism (Dynamic Dispatch & Traits)
fn polymorphism_dynamic_dispatch() {
    println!("\n--- POLYMORPHISM (DYNAMIC DISPATCH & TRAITS) ---");

    // Using dynamic dispatch with traits
    trait Greet {
        fn greet(&self);
    }

    struct Person {
        name: String,
    }

    struct Robot {
        model: String,
    }

    impl Greet for Person {
        fn greet(&self) {
            println!("Hello, my name is {}.", self.name);
        }
    }

    impl Greet for Robot {
        fn greet(&self) {
            println!("Beep boop, I am model {}.", self.model);
        }
    }

    let person = Person {
        name: String::from("Alice"),
    };
    let robot = Robot {
        model: String::from("R2D2"),
    };

    // Creating a vector of trait objects (polymorphic behavior)
    let greeters: Vec<Box<dyn Greet>> = vec![
        Box::new(person),
        Box::new(robot),
    ];

    for greeter in greeters {
        greeter.greet();
    }
}

// 6. Constructors and Destructors (Drop trait)
fn constructors_and_destructors() {
    println!("\n--- CONSTRUCTORS AND DESTRUCTORS (DROP TRAIT) ---");

    // Drop trait to customize the destructor behavior
    struct Resource {
        name: String,
    }

    impl Resource {
        fn new(name: &str) -> Resource {
            Resource {
                name: String::from(name),
            }
        }
    }

    impl Drop for Resource {
        fn drop(&mut self) {
            println!("Resource {} is being destroyed!", self.name);
        }
    }

    // Creating and using an instance of Resource
    {
        let res = Resource::new("Network Connection");
    } // res goes out of scope here and drop() is called automatically

    // Output will show when the object is dropped
}

// Main function to run all the sections
fn main() {
    introduction_to_structs();
    methods_and_associated_functions();
    inheritance_via_traits();
    encapsulation();
    polymorphism_dynamic_dispatch();
    constructors_and_destructors();
}
