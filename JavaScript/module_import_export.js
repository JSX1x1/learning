// 1. **Default Export**: Allows you to export a single value, function, or object from a module.
export default function greet(name) {
    console.log(`Hello, ${name}!`);
}

// 2. **Named Exports**: Allows you to export multiple values, functions, or objects by name.
export const add = (a, b) => a + b;
export const subtract = (a, b) => a - b;
export const multiply = (a, b) => a * b;
export const divide = (a, b) => a / b;

// 3. **Re-exporting**: You can re-export imports in a new module.
export { add, subtract, multiply, divide };

// 4. **Importing default exports**: Import a default exported function.
import greet from './greet.js';

// 5. **Importing named exports**: Import named functions from a module.
import { add, subtract } from './mathOperations.js';

// 6. **Importing everything as an object**: You can import all named exports and access them through an object.
import * as mathOperations from './mathOperations.js';

// Usage examples:

// Using the default import
greet('John'); // Hello, John!

// Using named imports
console.log(add(5, 3)); // 8
console.log(subtract(10, 4)); // 6

// Using all imported functions as an object
console.log(mathOperations.multiply(3, 5)); // 15
console.log(mathOperations.divide(20, 4)); // 5

// 7. **Dynamic Imports**: You can use dynamic imports to load modules on demand (lazy loading).
async function loadModule() {
    const module = await import('./mathOperations.js');
    console.log(module.multiply(2, 4)); // 8
}

loadModule();

// 8. **Circular Dependencies Handling**: JavaScript ES6 modules are hoisted, so circular imports won't cause infinite loops.
import { calculate } from './circular.js';

console.log(calculate(10, 5)); // Result of circular dependencies handled properly

