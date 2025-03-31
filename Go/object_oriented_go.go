package main

import "fmt"

// ----------------------------
// 1. Defining Structs
// ----------------------------

// Defining a struct to represent a basic "Person"
type Person struct {
	Name string
	Age  int
}

// ----------------------------
// 2. Methods on Structs
// ----------------------------

// Adding a method to the Person struct
// This method is bound to the Person type and can be called on instances of Person
func (p *Person) greet() {
	fmt.Printf("Hello, my name is %s and I am %d years old.\n", p.Name, p.Age)
}

// ----------------------------
// 3. Interfaces
// ----------------------------

// Defining an interface with a method signature
type Speaker interface {
	greet() // Any type that has this method is a Speaker
}

// This function accepts any type that implements the Speaker interface
func introduce(speaker Speaker) {
	speaker.greet() // Calling the greet method from the interface
}

// ----------------------------
// 4. Embedding and Composition
// ----------------------------

// Defining a struct for Employee which "embeds" a Person struct
type Employee struct {
	Person   // Embedding Person struct
	Position string
}

// Method specific to Employee
func (e *Employee) work() {
	fmt.Printf("%s is working as a %s.\n", e.Name, e.Position)
}

// ----------------------------
// 5. Polymorphism (Dynamic Dispatch) in Go via Interfaces
// ----------------------------

// Defining a struct for a "Dog" that will implement the Speaker interface
type Dog struct {
	Name string
}

func (d *Dog) greet() {
	fmt.Printf("Woof! I am %s the dog.\n", d.Name)
}

// ----------------------------
// 6. Reusable Component Example
// ----------------------------

func main() {
	// 1. Creating and using a Person
	person := &Person{Name: "Alice", Age: 30}
	person.greet() // Calling the greet method on a Person instance

	// 2. Using Interface with Person
	introduce(person) // Interface will call the greet method of Person

	// 3. Creating and using an Employee
	employee := &Employee{
		Person:   Person{Name: "Bob", Age: 35},
		Position: "Software Engineer",
	}
	employee.greet()  // Inherited greet method from Person
	employee.work()   // Specific to Employee
	introduce(employee) // Employee can also be introduced via the Speaker interface

	// 4. Polymorphism example: Using a Dog as a Speaker
	dog := &Dog{Name: "Rex"}
	introduce(dog) // Dog also implements the Speaker interface
}