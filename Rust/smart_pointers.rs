// smart_pointers.rs

// Smart pointers in Rust are used to manage memory in a safe and controlled manner.
// In Rust, all memory management is automatic and safe without a garbage collector,
// but smart pointers help manage data in a more flexible way.

use std::rc::Rc;
use std::cell::RefCell;
use std::sync::{Arc, Mutex};

// -------------------------------
// 1. Box - Heap Allocation
// -------------------------------
// Box is a simple smart pointer that allows for heap allocation. It gives ownership of the heap data.

fn box_example() {
    // Box is used to allocate data on the heap. The data will be deallocated when the Box goes out of scope.
    let x = Box::new(5); // Allocate an integer on the heap
    println!("Value of x: {}", x); // Access the value inside the Box

    // Box automatically frees the memory when it goes out of scope.
}

// -------------------------------
// 2. Rc - Reference Counted Pointer
// -------------------------------
// Rc is a smart pointer that enables multiple ownership of data. The data is freed when the last Rc pointer goes out of scope.

fn rc_example() {
    // Rc allows for multiple references to the same data.
    let data = Rc::new(RefCell::new(5)); // Create Rc to hold data

    // Clone Rc to allow multiple owners
    let data_clone = Rc::clone(&data); // This clones the pointer, not the data

    // Both Rc pointers share ownership of the same RefCell (and the value 5).
    // If we mutate the value inside, it will be shared.
    *data.borrow_mut() = 10; // Mutate the value inside the RefCell

    println!("Data value (via original Rc): {}", data.borrow()); // 10
    println!("Data value (via cloned Rc): {}", data_clone.borrow()); // 10
}

// -------------------------------
// 3. Arc - Atomic Reference Counted Pointer
// -------------------------------
// Arc is like Rc, but it can be shared across threads. It uses atomic operations for thread safety.

fn arc_example() {
    // Arc is used when we need to share data across threads safely.
    let data = Arc::new(Mutex::new(5)); // Arc to share data, wrapped in Mutex for thread safety.

    let handles: Vec<_> = (0..10).map(|_| {
        let data = Arc::clone(&data);
        std::thread::spawn(move || {
            let mut data = data.lock().unwrap(); // Lock the Mutex to safely mutate the data
            *data += 1;
        })
    }).collect();

    for handle in handles {
        handle.join().unwrap();
    }

    // Now the value is 15 because it was incremented 10 times (one in each thread).
    println!("Data value (via Arc and Mutex): {}", *data.lock().unwrap());
}

// -------------------------------
// 4. RefCell - Interior Mutability
// -------------------------------
// RefCell allows for mutable borrowing at runtime, even if the RefCell itself is immutable.

fn refcell_example() {
    // RefCell allows us to mutate data inside even when the RefCell itself is not mutable.
    let data = RefCell::new(5); // RefCell holding data

    {
        let mut data_ref = data.borrow_mut(); // Borrow mutable reference to data
        *data_ref = 10; // Modify the value inside the RefCell
    }

    println!("Data value (via RefCell): {}", data.borrow()); // Access the value inside the RefCell
}

// -------------------------------
// Combining Smart Pointers
// -------------------------------
// Often you will combine multiple smart pointers to create complex, flexible data structures.

fn combined_example() {
    // Create an Rc to share ownership of a RefCell, which holds an integer
    let data = Rc::new(RefCell::new(0));

    // Clone Rc to allow multiple owners
    let data_clone = Rc::clone(&data);

    // Mutate the value inside the RefCell through the first Rc
    *data.borrow_mut() += 1;

    // Access the mutated value through the second Rc
    println!("Data value (combined example): {}", data_clone.borrow()); // 1
}

// -------------------------------
// Conclusion
// -------------------------------
// - Box is used for heap allocation with single ownership.
// - Rc allows multiple ownership and is useful in single-threaded contexts.
// - Arc is like Rc but can be safely shared between threads.
// - RefCell enables mutable borrowing even in immutable structures.

fn main() {
    // Running examples
    println!("--- Box Example ---");
    box_example();

    println!("\n--- Rc Example ---");
    rc_example();

    println!("\n--- Arc Example ---");
    arc_example();

    println!("\n--- RefCell Example ---");
    refcell_example();

    println!("\n--- Combined Example ---");
    combined_example();
}
