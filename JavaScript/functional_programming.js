// functional_programming.js

// 1. **Pure Functions**: A function is pure if its output is determined only by its input, with no side effects.
function add(a, b) {
    return a + b; // no side effects, same input returns same output
}

console.log(add(2, 3)); // 5
console.log(add(2, 3)); // 5 (same result as it's a pure function)

// 2. **Higher-Order Functions**: A higher-order function is a function that takes one or more functions as arguments, or returns a function as a result.
function mapArray(arr, transformFunc) {
    let result = [];
    for (let i = 0; i < arr.length; i++) {
        result.push(transformFunc(arr[i])); // applying transform function to each item
    }
    return result;
}

const nums = [1, 2, 3, 4, 5];
const squaredNumbers = mapArray(nums, (num) => num * num);

console.log(squaredNumbers); // [1, 4, 9, 16, 25]

// 3. **Immutability**: Instead of changing data, functional programming prefers creating new data.
const user = {
    name: 'John',
    age: 30
};

// Using Object Spread Syntax to avoid mutation (create a new object)
const updatedUser = {...user, age: 31};

console.log(user); // { name: 'John', age: 30 } - original object remains unchanged
console.log(updatedUser); // { name: 'John', age: 31 } - new object created

// 4. **Closures**: A closure is a function that "remembers" its lexical scope, even when the function is executed outside that scope.
function outerFunction(outerVar) {
    return function innerFunction(innerVar) {
        return outerVar + innerVar;
    };
}

const addFive = outerFunction(5);
console.log(addFive(3)); // 8 (closure remembers the outerVar value)

// 5. **Function Composition**: Combining multiple functions to create a new function.
const compose = (f, g) => (x) => f(g(x));

const multiplyByTwo = (x) => x * 2;
const addThree = (x) => x + 3;

const composedFunction = compose(multiplyByTwo, addThree);

console.log(composedFunction(4)); // (4 + 3) * 2 = 14

// 6. **Currying**: Breaking down a function that takes multiple arguments into a series of functions that take one argument at a time.
function curriedAdd(a) {
    return function(b) {
        return a + b;
    };
}

const addTwo = curriedAdd(2);
console.log(addTwo(3)); // 5

// 7. **Recursion**: A function that calls itself in order to solve a problem.
function factorial(n) {
    if (n === 0 || n === 1) return 1;
    return n * factorial(n - 1);
}

console.log(factorial(5)); // 120

// 8. **Array Functions**: Methods such as `map()`, `reduce()`, and `filter()` allow for more functional approaches to working with arrays.

// `map()` example:
const numbers = [1, 2, 3, 4, 5];
const doubled = numbers.map((num) => num * 2);

console.log(doubled); // [2, 4, 6, 8, 10]

// `filter()` example:
const evenNumbers = numbers.filter((num) => num % 2 === 0);

console.log(evenNumbers); // [2, 4]

// `reduce()` example:
const sum = numbers.reduce((acc, num) => acc + num, 0);

console.log(sum); // 15

// 9. **Lazy Evaluation**: Delaying the evaluation of an expression until its value is needed. This can be done using generators.
function* infiniteGenerator() {
    let i = 0;
    while (true) {
        yield i++;
    }
}

const generator = infiniteGenerator();
console.log(generator.next().value); // 0
console.log(generator.next().value); // 1
console.log(generator.next().value); // 2

// 10. **Functors**: A functor is a container that holds a value and allows you to apply a function to that value.
const functor = {
    value: 2,
    map: function(fn) {
        this.value = fn(this.value);
        return this;
    }
};

const result = functor.map((x) => x + 3).map((x) => x * 2);

console.log(result.value); // 10

