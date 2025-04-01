// 1. **Let and Const**: Block-scoped variable declaration (replaces var).
let name = 'John';   // can be reassigned
const age = 25;      // cannot be reassigned
name = 'Doe';        // Works fine
// age = 30;          // Error: Assignment to constant variable.

// 2. **Arrow Functions**: A shorter syntax for writing functions.
const greet = (name) => `Hello, ${name}`;
console.log(greet('John'));  // 'Hello, John'

const sum = (a, b) => a + b;
console.log(sum(3, 4));  // 7

// 3. **Template Literals**: Easier way to handle string concatenation and multi-line strings.
const firstName = 'John';
const lastName = 'Doe';
console.log(`Full name: ${firstName} ${lastName}`);  // Full name: John Doe

// Multi-line string:
const multiLineString = `This is
a multi-line
string.`;
console.log(multiLineString);

// 4. **Destructuring Assignment**: Unpack values from arrays or properties from objects into variables.
const person = { name: 'John', age: 25 };
const { name, age } = person;
console.log(name);  // 'John'
console.log(age);   // 25

// Array destructuring:
const numbers = [1, 2, 3];
const [a, b, c] = numbers;
console.log(a, b, c);  // 1 2 3

// 5. **Default Parameters**: Function parameters can have default values.
const greetPerson = (name = 'Guest') => `Hello, ${name}`;
console.log(greetPerson());  // 'Hello, Guest'
console.log(greetPerson('John'));  // 'Hello, John'

// 6. **Rest and Spread Operators**: Allows working with an indefinite number of arguments (rest) or copying arrays/objects (spread).

// Rest parameter:
const sumNumbers = (...numbers) => numbers.reduce((a, b) => a + b, 0);
console.log(sumNumbers(1, 2, 3, 4));  // 10

// Spread operator (in arrays and objects):
const array1 = [1, 2, 3];
const array2 = [...array1, 4, 5];
console.log(array2);  // [1, 2, 3, 4, 5]

// 7. **Classes**: A more intuitive syntax for creating objects and dealing with inheritance.
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  introduce() {
    console.log(`Hi, I'm ${this.name} and I'm ${this.age} years old.`);
  }
}

const john = new Person('John', 25);
john.introduce();  // 'Hi, I'm John and I'm 25 years old.'

// 8. **Modules**: ES6 introduces the `import` and `export` syntax for handling modules.
export const greetModule = (name) => `Hello, ${name}`;
import { greetModule } from './es6_features.js'; // This would be in a separate file

console.log(greetModule('John'));  // 'Hello, John'

// 9. **Promises**: A cleaner way to work with asynchronous code, replacing callbacks.
const fetchData = new Promise((resolve, reject) => {
  let success = true;
  
  if (success) {
    resolve('Data fetched successfully');
  } else {
    reject('Error in fetching data');
  }
});

fetchData
  .then((message) => console.log(message))  // 'Data fetched successfully'
  .catch((error) => console.log(error));   // 'Error in fetching data'

// 10. **Map and Set**: New data structures with more functionalities.

// Map: A collection of key-value pairs.
const map = new Map();
map.set('name', 'John');
map.set('age', 25);
console.log(map.get('name'));  // 'John'

// Set: A collection of unique values.
const set = new Set([1, 2, 2, 3, 3, 3]);
console.log(set);  // Set {1, 2, 3}

// 11. **Object.assign()**: Copy properties from one object to another.
const obj1 = { name: 'John' };
const obj2 = { age: 25 };
const mergedObj = Object.assign({}, obj1, obj2);
console.log(mergedObj);  // { name: 'John', age: 25 }

// 12. **Symbol**: A unique and immutable primitive value used to create unique object properties.
const sym = Symbol('description');
console.log(sym);  // Symbol(description)

const personWithSymbol = {
  [sym]: 'secret',
  name: 'John'
};
console.log(personWithSymbol[sym]);  // 'secret'

// 13. **Iterator and Generator Functions**: A new way to work with sequences and collections.

function* numbersGenerator() {
  yield 1;
  yield 2;
  yield 3;
}

const gen = numbersGenerator();
console.log(gen.next().value);  // 1
console.log(gen.next().value);  // 2
console.log(gen.next().value);  // 3

// 14. **Set and WeakSet**: More efficient memory handling for large sets of objects.

// Set:
const uniqueValues = new Set([1, 2, 3, 4, 4, 5]);
console.log(uniqueValues);  // Set {1, 2, 3, 4, 5}

// WeakSet (for objects only, does not prevent garbage collection):
const weakSet = new WeakSet();
const obj1 = { name: 'John' };
const obj2 = { name: 'Jane' };
weakSet.add(obj1);
weakSet.add(obj2);

// 15. **WeakMap**: Similar to a `Map`, but the keys are weakly held (i.e., they can be garbage collected).

const weakMap = new WeakMap();
const object1 = {};
weakMap.set(object1, 'Some Value');
console.log(weakMap.get(object1));  // 'Some Value'

// 16. **Array.prototype.find() and Array.prototype.findIndex()**: Find an element or its index in an array.
const numbersArr = [1, 2, 3, 4, 5];
const foundNumber = numbersArr.find(num => num > 3);
console.log(foundNumber);  // 4

const foundIndex = numbersArr.findIndex(num => num > 3);
console.log(foundIndex);  // 3

// 17. **Array.prototype.includes()**: Check if an array contains a certain element.
const hasValue = numbersArr.includes(3);
console.log(hasValue);  // true
