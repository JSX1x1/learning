// unsafe_rust.rs

// In Rust, safety is the primary focus, but sometimes you need to break the rules for performance or low-level access.
// Unsafe Rust allows you to perform operations that the compiler cannot guarantee to be safe.
// It's up to the programmer to ensure safety in these situations.

fn main() {
    println!("--- Unsafe Rust ---");
    unsafe_example();
    raw_pointer_example();
    unsafe_fn_example();
    unsafe_struct_example();
    unsafe_trait_example();
}

// -------------------------------
// 1. Unsafe Code Block
// -------------------------------
// In Rust, code inside an `unsafe` block allows you to bypass some of the safety checks that the Rust compiler enforces.
// This can include dereferencing raw pointers or calling unsafe functions.

fn unsafe_example() {
    // Unsafe block allows access to operations that would normally be disallowed.
    let x: i32 = 42;
    let r: *const i32 = &x; // A raw pointer is created (doesn't have Rust's borrow checker guarantees).

    // Dereferencing raw pointers is unsafe
    unsafe {
        println!("Value of x through raw pointer: {}", *r); // Dereferencing raw pointer
    }
}

// -------------------------------
// 2. Raw Pointers
// -------------------------------
// Raw pointers are one of the most common features of `unsafe` Rust.
// They allow for direct memory manipulation, but they lack any safety guarantees.

fn raw_pointer_example() {
    // Creating raw pointers (unsafe code)
    let y = 10;
    let r: *const i32 = &y; // Raw pointer (immutable)
    let mut z = 20;
    let mut_r: *mut i32 = &mut z; // Mutable raw pointer

    // Dereferencing raw pointers is unsafe because they can point to invalid memory
    unsafe {
        println!("Raw pointer r points to: {}", *r); // Dereference immutable pointer
        *mut_r = 30; // Mutate the value through mutable pointer
        println!("New value of z: {}", z); // Should print 30
    }
}

// -------------------------------
// 3. Unsafe Functions
// -------------------------------
// You can declare functions as unsafe, which means they can only be called from within an `unsafe` block.

unsafe fn unsafe_fn() {
    println!("This is an unsafe function.");
}

fn unsafe_fn_example() {
    // Calling unsafe functions requires an unsafe block
    unsafe {
        unsafe_fn(); // Calling unsafe function
    }
}

// -------------------------------
// 4. Unsafe Structs
// -------------------------------
// Sometimes, you may need to create structs with raw pointers or other unsafe operations.
// In such cases, you must mark them with `unsafe`.

struct MyStruct {
    a: i32,
    b: i32,
}

impl MyStruct {
    fn new() -> Self {
        MyStruct { a: 1, b: 2 }
    }

    // This function is unsafe because we manually modify the struct
    unsafe fn unsafe_modify(&mut self) {
        self.a = 10; // Modifying the struct
        self.b = 20;
    }
}

fn unsafe_struct_example() {
    let mut s = MyStruct::new();

    unsafe {
        s.unsafe_modify(); // Call unsafe method
    }

    println!("Modified struct: a = {}, b = {}", s.a, s.b); // Should print 10, 20
}

// -------------------------------
// 5. Unsafe Traits and Implementations
// -------------------------------
// You can implement traits in an unsafe manner, but this also requires caution. 
// Unsafe implementations don't guarantee safety like regular Rust implementations.

unsafe trait UnsafeTrait {
    fn unsafe_trait_method(&self);
}

struct UnsafeStruct;

unsafe impl UnsafeTrait for UnsafeStruct {
    fn unsafe_trait_method(&self) {
        println!("Unsafe trait method called!");
    }
}

fn unsafe_trait_example() {
    let instance = UnsafeStruct;
    unsafe {
        instance.unsafe_trait_method(); // Call unsafe trait method
    }
}

// -------------------------------
// 6. Dereferencing Raw Pointers
// -------------------------------
// Dereferencing raw pointers is an unsafe operation. You must ensure that the pointer is valid before dereferencing it.

fn deref_raw_pointer_example() {
    let s = String::from("Hello, Unsafe!");
    let raw_ptr: *const String = &s;

    // Dereferencing a raw pointer is unsafe, so we need to use an unsafe block
    unsafe {
        println!("Dereferenced raw pointer: {}", *raw_ptr); // Dereference raw pointer to get the value
    }
}

// -------------------------------
// 7. Calling C Functions via FFI (Foreign Function Interface)
// -------------------------------
// Rust can interface with C libraries through FFI. This is considered unsafe because Rust's safety guarantees do not apply to C code.

extern "C" {
    fn printf(format: *const u8, ...) -> i32; // Example C function
}

fn ffi_example() {
    unsafe {
        let format = b"Hello from C! %d\n\0";
        printf(format.as_ptr(), 42); // Calling C function via FFI
    }
}

