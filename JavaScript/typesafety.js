// ------------------------------
// 1. Introduction to Type Safety
// ------------------------------

console.log("----- Introduction to Type Safety in JavaScript -----");

// JavaScript is dynamically typed, meaning variables can hold values of any type without explicit type declarations.
// Type safety helps prevent errors by ensuring that values are of the expected type, avoiding type-related issues.

console.log("Type Safety is important to avoid unexpected bugs in JavaScript!");

// ------------------------------
// 2. Dynamic Typing and Type Checking
// ------------------------------

console.log("\n----- Dynamic Typing and Type Checking -----");

// In JavaScript, variables do not have a fixed type. They can change type as the program runs.

let dynamicVariable = 42; // Initially a number
console.log("Initial type of dynamicVariable: ", typeof dynamicVariable);

dynamicVariable = "Hello, World!"; // Now a string
console.log("New type of dynamicVariable: ", typeof dynamicVariable);

// Use `typeof` to check the type of a variable
let name = "Alice";
let age = 30;
let isActive = true;

console.log("Type of name: ", typeof name); // string
console.log("Type of age: ", typeof age);   // number
console.log("Type of isActive: ", typeof isActive); // boolean

// Use `typeof` to check for more complex types
let person = {
    name: "John Doe",
    age: 30
};

console.log("Type of person: ", typeof person); // object (note that arrays, null, and functions are also "objects")
console.log("Type of person.name: ", typeof person.name); // string

// ------------------------------
// 3. Checking Specific Object Types
// ------------------------------

console.log("\n----- Checking Specific Object Types -----");

// Use `instanceof` to check if an object is an instance of a specific class or type.

let arr = [1, 2, 3];
let func = function() {};

console.log("Is arr an array? ", arr instanceof Array); // true
console.log("Is arr an object? ", arr instanceof Object); // true

console.log("Is func a function? ", func instanceof Function); // true
console.log("Is func an object? ", func instanceof Object); // true

// Note: `null` is a special case and will return 'object' when using `typeof` or `instanceof` because of legacy reasons in JavaScript.
let nullValue = null;
console.log("Is null an object? ", nullValue instanceof Object); // false (it's actually null)

// ------------------------------
// 4. Type Checking with Type Guards (Manual Type Checking)
// ------------------------------

console.log("\n----- Type Guards (Manual Type Checking) -----");

// Sometimes, JavaScript doesn't catch type errors before runtime.
// Type guards help in manually checking and narrowing types to avoid errors.

function printLength(value) {
    if (typeof value === "string") {
        console.log("Length of string: ", value.length);
    } else if (Array.isArray(value)) {
        console.log("Length of array: ", value.length);
    } else {
        console.log("Value is neither a string nor an array.");
    }
}

printLength("Hello!"); // Length of string: 6
printLength([1, 2, 3, 4]); // Length of array: 4
printLength(42); // Value is neither a string nor an array.

// Use `Array.isArray()` for arrays since `typeof` would return 'object' for arrays too.
console.log("Is [1,2,3] an array? ", Array.isArray([1, 2, 3])); // true
console.log("Is 'Hello' an array? ", Array.isArray("Hello")); // false

// ------------------------------
// 5. Avoiding Common Type Safety Pitfalls
// ------------------------------

console.log("\n----- Avoiding Common Type Safety Pitfalls -----");

// JavaScript’s loose typing can introduce bugs, especially when dealing with falsy values like `null`, `undefined`, `false`, `0`, `NaN`, and `""`.

// 5.1 Comparing Different Types
console.log("Strict equality (===) vs. Loose equality (==)");

// == checks for equality with type coercion
console.log("'42' == 42: ", '42' == 42); // true (type coercion)

// === checks for strict equality (no type coercion)
console.log("'42' === 42: ", '42' === 42); // false (no type coercion)

// It's always recommended to use `===` to avoid unintended type coercion.

let value = "false";
if (value === false) { // This will never be true because 'false' is a string.
    console.log("This will never be reached.");
} else {
    console.log("Check failed: 'value' is a string, not a boolean.");
}

// 5.2 Handling NaN (Not a Number)
let num = NaN;
console.log("Is NaN equal to NaN? ", num === NaN); // false, because NaN is not equal to itself
console.log("Is NaN equal to itself? ", Number.isNaN(num)); // true, use Number.isNaN to check for NaN

// 5.3 Null vs Undefined
let a = null;
let b;
console.log("Is null equal to undefined? ", a == b); // true (loose equality)
console.log("Is null strictly equal to undefined? ", a === b); // false (strict equality)

// 5.4 Using Type Coercion Safely
// Be careful with operations that involve type coercion (like + or -) because they might cause unexpected behavior.
let coercedSum = "10" - 5; // JavaScript coerces "10" to a number (works fine here)
console.log("'10' - 5: ", coercedSum); // 5

let coercedConcat = "10" + 5; // JavaScript coerces 5 to a string and performs concatenation
console.log("'10' + 5: ", coercedConcat); // '105'

// To avoid mistakes, always use `Number()` or `String()` to explicitly convert types.

console.log("Explicit conversion of string '42' to number: ", Number("42"));
console.log("Explicit conversion of number 42 to string: ", String(42));

// ------------------------------
// 6. TypeScript: Enforcing Type Safety
// ------------------------------

console.log("\n----- TypeScript: Enforcing Type Safety -----");

// JavaScript itself does not provide built-in support for strong type safety, but **TypeScript** is a superset of JavaScript that enforces type safety at compile time.

// Example of TypeScript with type annotations:

// let num: number = 42;
// let str: string = "Hello";

// TypeScript prevents this kind of type mismatch:
// num = "Hello";  // Error: Type 'string' is not assignable to type 'number'.

// TypeScript also provides static analysis, giving early feedback on type errors.

console.log("In TypeScript, you can enforce strong type checks using static types.");

// ------------------------------
// 7. Type Safety in Practice: Good Practices
// ------------------------------

console.log("\n----- Type Safety in Practice: Good Practices -----");

// 7.1 Use `===` for comparisons to avoid unintended type coercion.
console.log("'5' === 5: ", '5' === 5); // false, recommended way to compare values

// 7.2 Declare types explicitly (in TypeScript).
// TypeScript provides type annotations like:
// let num: number = 42;
// let userName: string = "Alice";

// 7.3 Avoid unnecessary type coercion.
let valueToNumber = "100";
console.log("Convert '100' to number safely: ", Number(valueToNumber)); // 100

// 7.4 Handle possible `null` and `undefined` cases properly.
let myValue = null;
if (myValue !== null && myValue !== undefined) {
    console.log("Valid value:", myValue);
} else {
    console.log("Invalid value (null or undefined).");
}

console.log("Type safety best practices help avoid runtime errors and make your code more predictable.");
