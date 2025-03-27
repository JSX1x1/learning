// ------------------------------
// 1. Primitive Data Types
// ------------------------------

console.log("----- Primitive Data Types -----");

// 1.1 String
// A string is a sequence of characters enclosed in single or double quotes.
let str = "Hello, World!";
let singleQuoteStr = 'This is a string in single quotes.';
console.log("String Example: ", str);
console.log("Single Quote String Example: ", singleQuoteStr);

// 1.2 Number
// JavaScript has two types of numbers: integer and floating-point (decimal).
let integerNum = 42; // An integer
let floatNum = 3.14;  // A floating-point number
console.log("Integer Example: ", integerNum);
console.log("Float Example: ", floatNum);

// 1.3 Boolean
// A boolean represents a true or false value.
let isActive = true;
let isFinished = false;
console.log("Boolean Example (True): ", isActive);
console.log("Boolean Example (False): ", isFinished);

// 1.4 Undefined
// A variable declared without a value is automatically assigned `undefined`.
let undefinedVar;
console.log("Undefined Example: ", undefinedVar);

// 1.5 Null
// Null is an intentional absence of any value or object.
let nullVar = null;
console.log("Null Example: ", nullVar);

// 1.6 Symbol (ES6)
// A symbol is a unique and immutable primitive value, typically used for object property keys.
let uniqueSymbol = Symbol("unique");
console.log("Symbol Example: ", uniqueSymbol);

// 1.7 BigInt (ES11)
// BigInt is a special number type for handling integers beyond the range of the Number type.
let bigIntNum = 1234567890123456789012345678901234567890n;
console.log("BigInt Example: ", bigIntNum);

// ------------------------------
// 2. Reference Data Types (Objects)
// ------------------------------

console.log("\n----- Reference Data Types (Objects) -----");

// 2.1 Object
// An object is a collection of properties, each with a key (or property name) and value.
let person = {
    name: "John Doe",
    age: 30,
    isActive: true,
    greet: function() { return "Hello, " + this.name; }
};
console.log("Object Example: ", person);
console.log("Object Method Example: ", person.greet());

// 2.2 Array
// An array is an ordered collection of values (elements).
let colors = ["Red", "Green", "Blue", "Yellow"];
console.log("Array Example: ", colors);

// You can access elements by their index
console.log("First Color: ", colors[0]);

// 2.3 Function (also considered an object)
let add = function(a, b) {
    return a + b;
};
console.log("Function Example: ", add(2, 3));

// ------------------------------
// 3. Type Conversion and Type Coercion
// ------------------------------

console.log("\n----- Type Conversion and Type Coercion -----");

// 3.1 Type Conversion
// Explicit conversion (from one type to another).

// String to Number
let strToNum = Number("123");
console.log("String to Number: ", strToNum);

// Boolean to Number
let boolToNum = Number(true); // true becomes 1
console.log("Boolean to Number (true): ", boolToNum);
boolToNum = Number(false); // false becomes 0
console.log("Boolean to Number (false): ", boolToNum);

// 3.2 Type Coercion (Automatic Conversion by JavaScript)
let sum = "10" + 5; // JavaScript automatically converts 5 to a string
console.log("String + Number (type coercion): ", sum);  // Output: "105"

let coercedSum = "10" - 5; // JavaScript automatically converts the string "10" to a number
console.log("String - Number (type coercion): ", coercedSum);  // Output: 5

// 3.3 Boolean Conversion (Truthy and Falsy Values)
let falsyValue = "";
let truthyValue = "Hello";

console.log("Falsy value to Boolean: ", Boolean(falsyValue)); // false
console.log("Truthy value to Boolean: ", Boolean(truthyValue)); // true

// ------------------------------
// 4. Array Methods (for Reference Types)
// ------------------------------

console.log("\n----- Array Methods -----");

// 4.1 push(), pop(), shift(), unshift()
// These methods add/remove elements to/from an array

let arr = [1, 2, 3, 4];
arr.push(5);  // Adds 5 at the end
console.log("Array after push: ", arr);

arr.pop();  // Removes the last element
console.log("Array after pop: ", arr);

arr.unshift(0);  // Adds 0 at the beginning
console.log("Array after unshift: ", arr);

arr.shift();  // Removes the first element
console.log("Array after shift: ", arr);

// 4.2 slice() and splice()
// slice() creates a shallow copy of a portion of an array
let slicedArr = arr.slice(1, 3);
console.log("Array sliced (index 1 to 3): ", slicedArr);

// splice() changes the contents of an array by removing or replacing elements
arr.splice(1, 1, "New Item");
console.log("Array after splice (replace at index 1): ", arr);

// 4.3 map(), filter(), reduce()
// These methods help with processing array elements.

let nums = [1, 2, 3, 4, 5];

// map() - Create a new array by applying a function to each element
let squared = nums.map(num => num * num);
console.log("Mapped Array (squared): ", squared);

// filter() - Create a new array with elements that pass a condition
let evenNumbers = nums.filter(num => num % 2 === 0);
console.log("Filtered Array (even numbers): ", evenNumbers);

// reduce() - Apply a function to reduce the array to a single value
let sumOfNumbers = nums.reduce((total, num) => total + num, 0);
console.log("Reduced Array (sum): ", sumOfNumbers);

// ------------------------------
// 5. Object Methods and Manipulation
// ------------------------------

console.log("\n----- Object Methods and Manipulation -----");

// 5.1 Accessing Object Properties
let book = {
    title: "JavaScript Basics",
    author: "Jane Doe",
    pages: 200
};

console.log("Object property (title): ", book.title);

// 5.2 Object Destructuring
let { title, author } = book;
console.log("Object Destructuring - Title: ", title, ", Author: ", author);

// 5.3 Object Methods
let car = {
    make: "Toyota",
    model: "Corolla",
    displayInfo: function() {
        return `${this.make} ${this.model}`;
    }
};

console.log("Object Method Example: ", car.displayInfo());

// ------------------------------
// 6. Checking Types and Instanceof
// ------------------------------

console.log("\n----- Checking Types and Instanceof -----");

// 6.1 typeof Operator
console.log("Type of 'str': ", typeof str);  // string
console.log("Type of 42: ", typeof integerNum);  // number
console.log("Type of true: ", typeof isActive);  // boolean
console.log("Type of null: ", typeof null);  // object (special case in JS)


// 6.2 instanceof Operator
console.log("Is 'person' an object? ", person instanceof Object);  // true
console.log("Is 'colors' an array? ", colors instanceof Array);  // true
console.log("Is 'add' a function? ", add instanceof Function);  // true

// ------------------------------
// Conclusion and Best Practices
// ------------------------------

console.log("\n----- Conclusion and Best Practices -----");

// 1. **Always initialize variables** with meaningful names.
// 2. **Use `const` and `let`** for variable declaration. Avoid using `var` unless necessary.
// 3. **Type Coercion** can be useful, but it can also lead to unexpected results. Always try to use explicit type conversion when possible.
// 4. **Use Array and Object methods** to manipulate data, as they are optimized and reduce the need for manual loops.