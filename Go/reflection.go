package main

import (
	"fmt"
	"reflect"
)

// Example struct for reflection
type User struct {
	Name  string
	Age   int
	Email string
}

func main() {
	// Basic reflection with an integer
	var num int = 42
	inspectType(num)

	// Reflection on a struct
	user := User{Name: "Alice", Age: 25, Email: "alice@example.com"}
	inspectStruct(user)
}

// Function to inspect any type using reflection
func inspectType(i interface{}) {
	t := reflect.TypeOf(i)
	v := reflect.ValueOf(i)

	fmt.Println("Type:", t)
	fmt.Println("Kind:", t.Kind())
	fmt.Println("Value:", v)
}

// Function to inspect struct fields and types using reflection
func inspectStruct(i interface{}) {
	t := reflect.TypeOf(i)
	v := reflect.ValueOf(i)

	fmt.Println("Struct Name:", t.Name())

	for i := 0; i < t.NumField(); i++ {
		field := t.Field(i)
		value := v.Field(i)
		fmt.Printf("Field: %s, Type: %s, Value: %v\n", field.Name, field.Type, value)
	}
}
