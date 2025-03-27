// ------------------------------
// node_js_basics.js
// ------------------------------

console.log("----- Node.js Basics -----");

// Node.js is a runtime environment that allows you to run JavaScript code outside of the browser.
// It's built on top of the V8 JavaScript engine (the same engine that powers Google Chrome).
// With Node.js, you can write server-side applications in JavaScript, such as HTTP servers, file systems operations, and more.


// ------------------------------
// 1. Introduction to Modules
// ------------------------------

console.log("\n----- 1. Introduction to Modules -----");

// In Node.js, the code is divided into modules, and each module is a separate file that contains related functionality.
// There are core modules built into Node.js (e.g., fs, http, path), and you can also create your own custom modules.

// Using a core module (fs module - File System) to interact with the file system.
const fs = require('fs');

// Reading a file asynchronously
fs.readFile('example.txt', 'utf8', (err, data) => {
    if (err) {
        console.error("Error reading file:", err);
    } else {
        console.log("File content:", data);
    }
});

// Writing to a file asynchronously
fs.writeFile('output.txt', 'Hello, Node.js!', (err) => {
    if (err) {
        console.error("Error writing to file:", err);
    } else {
        console.log("File written successfully!");
    }
});

// Custom Module Example:
console.log("\n----- Custom Module Example -----");

// Create a simple custom module called 'greet.js' (you can create this as a separate file)
const greet = require('./greet'); // Assuming greet.js exists in the same directory
greet.sayHello();

// ------------------------------
// 2. Events and EventEmitter
// ------------------------------

console.log("\n----- 2. Events and EventEmitter -----");

// Node.js is event-driven, and it uses events to trigger certain actions. The EventEmitter class is used to handle events.
// The EventEmitter class allows us to emit events and set up listeners to react to them.

const EventEmitter = require('events');

// Create an instance of EventEmitter
const eventEmitter = new EventEmitter();

// Set up a listener for an event called 'greet'
eventEmitter.on('greet', () => {
    console.log('Hello, welcome to Node.js!');
});

// Emit the 'greet' event
eventEmitter.emit('greet');

// ------------------------------
// 3. HTTP Module: Creating an HTTP Server
// ------------------------------

console.log("\n----- 3. HTTP Module: Creating an HTTP Server -----");

// The `http` module allows us to create an HTTP server that can listen for requests and send responses.
// This is the foundation for building web servers with Node.js.

const http = require('http');

// Create an HTTP server
const server = http.createServer((req, res) => {
    // Set the response headers
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    
    // Respond with a message
    res.end('Hello, this is a Node.js server!\n');
});

// Make the server listen on port 3000
server.listen(3000, () => {
    console.log('Server running at http://localhost:3000/');
});

// ------------------------------
// 4. Asynchronous Programming and Callbacks
// ------------------------------

console.log("\n----- 4. Asynchronous Programming and Callbacks -----");

// Node.js is built with non-blocking I/O, meaning operations like reading files, database queries, and HTTP requests happen asynchronously.
// The `callback` function is passed as an argument to another function and executed once the operation is completed.

function fetchData(callback) {
    setTimeout(() => {
        const data = 'Here is some data from an asynchronous operation';
        callback(null, data);  // First argument is error (null if no error), second is data
    }, 2000);
}

console.log("Fetching data...");

// Calling fetchData with a callback function
fetchData((err, data) => {
    if (err) {
        console.error("Error fetching data:", err);
    } else {
        console.log("Received data:", data);
    }
});

// ------------------------------
// 5. Promises and Async/Await
// ------------------------------

console.log("\n----- 5. Promises and Async/Await -----");

// Promises are used to handle asynchronous operations and represent a value that may not be available yet.
// Async/await is a syntactic sugar built on top of promises to make asynchronous code more readable.

function fetchDataPromise() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const data = 'Here is some data from a promise-based operation';
            resolve(data);  // Resolve with data
        }, 2000);
    });
}

// Using async/await to work with promises
async function getData() {
    console.log("Fetching data using async/await...");
    
    try {
        const data = await fetchDataPromise();
        console.log("Received data:", data);
    } catch (err) {
        console.error("Error:", err);
    }
}

// Call the async function
getData();

// ------------------------------
// 6. File System (fs) Module
// ------------------------------

console.log("\n----- 6. File System (fs) Module -----");

// Node.js allows us to interact with the file system using the `fs` module.
// You can read, write, update, and delete files asynchronously or synchronously.

const fsSync = require('fs');

// Synchronous example: Reading a file
try {
    const dataSync = fsSync.readFileSync('example.txt', 'utf8');
    console.log("Synchronous read:", dataSync);
} catch (err) {
    console.error("Error reading file synchronously:", err);
}

// ------------------------------
// 7. Path Module
// ------------------------------

console.log("\n----- 7. Path Module -----");

// The `path` module provides utilities for working with file and directory paths.
// It helps in handling file paths in a cross-platform way (works on Windows, Linux, and Mac).

const path = require('path');

// Resolve a relative path to an absolute path
const absolutePath = path.resolve('example.txt');
console.log("Absolute Path:", absolutePath);

// Join multiple segments into a single path
const newPath = path.join(__dirname, 'files', 'example.txt');
console.log("Joined Path:", newPath);

// ------------------------------
// 8. Express.js Framework
// ------------------------------

console.log("\n----- 8. Express.js Framework -----");

// Express.js is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications.
// Express simplifies routing, handling HTTP requests, and managing middleware.

const express = require('express');
const app = express();

// Define a route for the home page
app.get('/', (req, res) => {
    res.send('Hello from Express.js!');
});

// Start the server on port 3000
app.listen(3000, () => {
    console.log('Express server is running at http://localhost:3000/');
});

// ------------------------------
// 9. Working with Environment Variables
// ------------------------------

console.log("\n----- 9. Working with Environment Variables -----");

// Environment variables are used to store configuration values like API keys, database URLs, and other settings.
// In Node.js, you can access them through the `process.env` object.

console.log("Environment Variable Example (NODE_ENV):", process.env.NODE_ENV);

// Set an environment variable (this is usually done outside the Node.js script, like in a shell environment)
process.env.NODE_ENV = 'production';

// Access and log the environment variable
console.log("Updated NODE_ENV:", process.env.NODE_ENV);

// ------------------------------
// 10. Creating a Simple REST API with Express
// ------------------------------

console.log("\n----- 10. Creating a Simple REST API with Express -----");

const users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' },
];

// Define a route to get users
app.get('/api/users', (req, res) => {
    res.json(users);
});

// Define a route to get a specific user by ID
app.get('/api/users/:id', (req, res) => {
    const user = users.find(u => u.id === parseInt(req.params.id));
    if (!user) {
        return res.status(404).send('User not found');
    }
    res.json(user);
});

// Define a route to add a new user
app.post('/api/users', express.json(), (req, res) => {
    const newUser = req.body;
    users.push(newUser);
    res.status(201).json(newUser);
});

// ------------------------------
// 11. Conclusion
// ------------------------------

console.log("\n----- 11. Conclusion -----");

// Node.js is an incredibly powerful runtime that allows developers to build fast and scalable server-side applications using JavaScript.
// In this tutorial, we have covered some of the most important features of Node.js, including modules, events, file system handling, HTTP server creation, and more.
// To learn more about Node.js, explore the official documentation: https://nodejs.org/en/docs/

