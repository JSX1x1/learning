// ------------------------------
// 1. Introduction to Object-Oriented Programming (OOP)
// ------------------------------

console.log("----- Introduction to Object-Oriented Programming in JavaScript -----");

// Object-Oriented Programming (OOP) is a paradigm that uses objects and classes to organize code.
// JavaScript, although initially functional, fully supports OOP principles.

// Key OOP Concepts:
// 1. **Objects**: Instances of classes containing data and methods.
// 2. **Classes**: Blueprints for creating objects with specific properties and methods.
// 3. **Inheritance**: Mechanism where one class can inherit properties and methods from another.
// 4. **Encapsulation**: Bundling data and methods that work on that data within one unit (class).
// 5. **Polymorphism**: Ability for different objects to respond to the same method in different ways.
// 6. **Abstraction**: Hiding complex implementation details while exposing essential features.

// ------------------------------
// 2. Creating Objects and Classes
// ------------------------------

console.log("\n----- Creating Objects and Classes -----");

// A class is a template for creating objects with specific properties and methods.
// In JavaScript, we define classes using the `class` keyword.

class Car {
    // Constructor method to initialize object properties
    constructor(make, model, year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    // Method to describe the car
    describe() {
        return `${this.year} ${this.make} ${this.model}`;
    }
}

// Creating an object (instance) of the Car class
let myCar = new Car('Toyota', 'Corolla', 2020);
console.log("Car Description: " + myCar.describe());

// ------------------------------
// 3. Inheritance in JavaScript
// ------------------------------

console.log("\n----- Inheritance in JavaScript -----");

// Inheritance allows a class (child class) to inherit properties and methods from another class (parent class).
// This is a fundamental OOP concept that allows code reusability.

class ElectricCar extends Car {
    // Constructor method that inherits from the Car class
    constructor(make, model, year, batteryCapacity) {
        super(make, model, year); // Call the parent class constructor
        this.batteryCapacity = batteryCapacity;
    }

    // Method to describe the electric car
    describe() {
        return `${super.describe()} with a ${this.batteryCapacity} kWh battery`;
    }

    // Additional method for electric car
    charge() {
        console.log(`${this.make} ${this.model} is charging...`);
    }
}

// Creating an object (instance) of the ElectricCar class
let myElectricCar = new ElectricCar('Tesla', 'Model 3', 2021, 75);
console.log("Electric Car Description: " + myElectricCar.describe());
myElectricCar.charge();

// ------------------------------
// 4. Encapsulation in JavaScript
// ------------------------------

console.log("\n----- Encapsulation in JavaScript -----");

// Encapsulation is the bundling of data (properties) and methods that operate on that data within a single class.
// JavaScript allows us to use private and public members to control access to data.

// Using `#` to make properties private (ES2022+)
class Person {
    #name; // private property

    constructor(name, age) {
        this.#name = name;
        this.age = age;
    }

    // Public method to access private property
    getName() {
        return this.#name;
    }

    // Method to introduce the person
    introduce() {
        console.log(`Hi, I am ${this.#name} and I am ${this.age} years old.`);
    }
}

// Creating an object (instance) of the Person class
let person = new Person("Alice", 30);
person.introduce();
console.log("Person's Name: " + person.getName());

// Attempting to directly access private property (will throw error)
// console.log(person.#name); // Error: Private field '#name' must be declared in an enclosing class

// ------------------------------
// 5. Polymorphism in JavaScript
// ------------------------------

console.log("\n----- Polymorphism in JavaScript -----");

// Polymorphism is the ability for different classes to define methods with the same name but behave differently.
// This allows a method to have different behaviors based on the object it is being called on.

class Animal {
    speak() {
        console.log("The animal makes a sound.");
    }
}

class Dog extends Animal {
    speak() {
        console.log("The dog barks.");
    }
}

class Cat extends Animal {
    speak() {
        console.log("The cat meows.");
    }
}

// Polymorphism in action
let myDog = new Dog();
let myCat = new Cat();

myDog.speak(); // Output: The dog barks.
myCat.speak(); // Output: The cat meows.

// ------------------------------
// 6. Abstraction in JavaScript
// ------------------------------

console.log("\n----- Abstraction in JavaScript -----");

// Abstraction is the concept of hiding the complex implementation details and showing only the essential features.
// JavaScript uses **abstract methods** in base classes to enforce implementation in child classes.

class Shape {
    // Abstract method (not implemented in the base class)
    calculateArea() {
        throw "Abstract method not implemented!";
    }
}

class Circle extends Shape {
    constructor(radius) {
        super();
        this.radius = radius;
    }

    // Implementing the abstract method
    calculateArea() {
        return Math.PI * this.radius ** 2;
    }
}

class Rectangle extends Shape {
    constructor(length, width) {
        super();
        this.length = length;
        this.width = width;
    }

    // Implementing the abstract method
    calculateArea() {
        return this.length * this.width;
    }
}

// Using the abstract method to calculate areas
let circle = new Circle(5);
let rectangle = new Rectangle(4, 6);

console.log("Circle Area: " + circle.calculateArea());  // Output: 78.53981633974483
console.log("Rectangle Area: " + rectangle.calculateArea());  // Output: 24

// ------------------------------
// 7. Static Methods and Properties
// ------------------------------

console.log("\n----- Static Methods and Properties -----");

// Static methods and properties are called on the class itself, not on instances of the class.
// They are useful for utility functions that do not require access to instance-specific data.

class MathUtils {
    static add(a, b) {
        return a + b;
    }

    static subtract(a, b) {
        return a - b;
    }
}

console.log("Addition: " + MathUtils.add(5, 3)); // Output: 8
console.log("Subtraction: " + MathUtils.subtract(5, 3)); // Output: 2

// ------------------------------
// 8. Getters and Setters
// ------------------------------

console.log("\n----- Getters and Setters -----");

// Getters and setters allow you to control access to properties of an object in a more controlled manner.

class RectangleWithGettersSetters {
    constructor(length, width) {
        this._length = length;
        this._width = width;
    }

    // Getter for the area
    get area() {
        return this._length * this._width;
    }

    // Setter for length
    set length(value) {
        if (value > 0) {
            this._length = value;
        } else {
            console.log("Length must be positive!");
        }
    }

    // Setter for width
    set width(value) {
        if (value > 0) {
            this._width = value;
        } else {
            console.log("Width must be positive!");
        }
    }
}

let rectangleWithGettersSetters = new RectangleWithGettersSetters(5, 10);
console.log("Area of rectangle: " + rectangleWithGettersSetters.area);  // Output: 50
rectangleWithGettersSetters.length = 8; // Set new length
console.log("Updated area of rectangle: " + rectangleWithGettersSetters.area);  // Output: 80

// ------------------------------
// 9. Conclusion
// ------------------------------

console.log("\n----- Conclusion -----");

// JavaScript is a versatile object-oriented language that supports all the key principles of OOP.
// Through **Classes**, **Inheritance**, **Encapsulation**, **Polymorphism**, **Abstraction**, and other features, JavaScript allows for better organization and reuse of code.

// Mastering OOP in JavaScript will help you write more structured, maintainable, and scalable code.
// Practice implementing these concepts by building your own projects and solving real-world problems!