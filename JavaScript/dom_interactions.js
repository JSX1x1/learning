// ------------------------------
// 1. Introduction to DOM Manipulation
// ------------------------------

console.log("----- Introduction to DOM Manipulation -----");

// The DOM (Document Object Model) is a programming interface for HTML and XML documents.
// It represents the structure of a web page as a tree of objects, where each node is an HTML element.

// JavaScript provides methods to interact with the DOM to get, modify, add, and remove elements on the page.

console.log("In this script, we will explore common methods like getElementById(), getElementsByClassName(), and querySelector()");

// ------------------------------
// 2. Selecting Elements Using getElementById()
// ------------------------------

console.log("\n----- Selecting Elements Using getElementById() -----");

// getElementById() is used to select a single element by its unique `id` attribute.
// It returns a reference to the first element with the given id.

let header = document.getElementById('header');
console.log("Element selected using getElementById:", header);

// Modify the content of the selected element
header.innerHTML = "New Header Content!";
console.log("Modified innerHTML of the header:", header.innerHTML);

// ------------------------------
// 3. Selecting Elements Using getElementsByClassName()
// ------------------------------

console.log("\n----- Selecting Elements Using getElementsByClassName() -----");

// getElementsByClassName() is used to select all elements that share the same class name.
// It returns a live HTMLCollection (an array-like object) of all matching elements.

let paragraphs = document.getElementsByClassName('paragraph');
console.log("Elements selected using getElementsByClassName:", paragraphs);

// We can loop through the returned HTMLCollection and modify the content of each element
for (let i = 0; i < paragraphs.length; i++) {
    paragraphs[i].style.color = 'blue';  // Change text color of each paragraph to blue
    paragraphs[i].innerHTML = "Modified paragraph " + (i + 1);
}

// ------------------------------
// 4. Selecting Elements Using getElementsByTagName()
// ------------------------------

console.log("\n----- Selecting Elements Using getElementsByTagName() -----");

// getElementsByTagName() is used to select all elements with a given tag name.
// It returns a live HTMLCollection of all elements with the specified tag.

let divs = document.getElementsByTagName('div');
console.log("Elements selected using getElementsByTagName:", divs);

// Loop through the divs and change their background color
for (let i = 0; i < divs.length; i++) {
    divs[i].style.backgroundColor = 'lightgrey';
    divs[i].style.padding = '10px';
}

// ------------------------------
// 5. Selecting the First Matching Element Using querySelector()
// ------------------------------

console.log("\n----- Selecting the First Matching Element Using querySelector() -----");

// querySelector() is a more powerful method that allows you to use CSS selectors to select elements.
// It returns the first element that matches the provided selector.

let firstParagraph = document.querySelector('.paragraph');
console.log("First element selected using querySelector:", firstParagraph);

// Modify the content of the selected element
firstParagraph.innerHTML = "First paragraph has been selected and modified.";

// ------------------------------
// 6. Selecting All Matching Elements Using querySelectorAll()
// ------------------------------

console.log("\n----- Selecting All Matching Elements Using querySelectorAll() -----");

// querySelectorAll() returns a **NodeList**, which is a static list of all elements that match the CSS selector.
// Unlike getElementsByClassName or getElementsByTagName, querySelectorAll does not return a live collection.

let allParagraphs = document.querySelectorAll('.paragraph');
console.log("Elements selected using querySelectorAll:", allParagraphs);

// You can loop through the NodeList and modify the elements
allParagraphs.forEach((p, index) => {
    p.style.fontSize = '18px';
    p.style.color = index % 2 === 0 ? 'green' : 'red'; // Alternate text colors
});

// ------------------------------
// 7. Selecting Elements with Various CSS Selectors
// ------------------------------

console.log("\n----- Selecting Elements with Various CSS Selectors -----");

// querySelector() and querySelectorAll() support all types of CSS selectors, including IDs, classes, attributes, and pseudo-classes.

let specialDiv = document.querySelector('#special');
console.log("Element with id 'special' selected:", specialDiv);

// Select all div elements with the class 'highlight'
let highlightedDivs = document.querySelectorAll('div.highlight');
console.log("Div elements with class 'highlight':", highlightedDivs);

// Select all input elements that are of type text
let textInputs = document.querySelectorAll('input[type="text"]');
console.log("Text input fields selected:", textInputs);

// ------------------------------
// 8. Accessing and Modifying Attributes
// ------------------------------

console.log("\n----- Accessing and Modifying Attributes -----");

// You can use `getAttribute()` and `setAttribute()` to get and set HTML attributes.

let link = document.querySelector('a');  // Select the first <a> element on the page
console.log("Href attribute of the link:", link.getAttribute('href'));

// Modify the 'href' attribute of the link
link.setAttribute('href', 'https://www.example.com');
console.log("Modified href attribute of the link:", link.getAttribute('href'));

// ------------------------------
// 9. Accessing and Modifying Styles
// ------------------------------

console.log("\n----- Accessing and Modifying Styles -----");

// You can directly modify the `style` property of elements to change their inline styles.
let box = document.querySelector('.box');

// Change the width, height, background color, and border of the box
box.style.width = '200px';
box.style.height = '200px';
box.style.backgroundColor = 'tomato';
box.style.border = '2px solid black';

console.log("Modified box styles:", box.style);

// ------------------------------
// 10. Event Handling - Adding Event Listeners
// ------------------------------

console.log("\n----- Event Handling - Adding Event Listeners -----");

// Adding an event listener to an element allows you to respond to user actions such as clicks, keypresses, and mouse movements.

// Add a click event to a button
let button = document.querySelector('button');

// Adding a click event listener
button.addEventListener('click', function() {
    alert('Button was clicked!');
});

// You can also define events like mouseover, keyup, etc.
let mouseoverElement = document.querySelector('.mouseover');

mouseoverElement.addEventListener('mouseover', function() {
    mouseoverElement.style.backgroundColor = 'yellow';
});

mouseoverElement.addEventListener('mouseout', function() {
    mouseoverElement.style.backgroundColor = '';
});

// ------------------------------
// 11. Removing Elements from the DOM
// ------------------------------

console.log("\n----- Removing Elements from the DOM -----");

// You can remove an element from the DOM using `removeChild()` or `remove()`.

// Select the element to be removed
let removeMe = document.querySelector('.remove-me');

// Remove the selected element from the DOM
removeMe.remove();
console.log("Element has been removed from the DOM.");

// ------------------------------
// 12. Creating New Elements and Adding Them to the DOM
// ------------------------------

console.log("\n----- Creating New Elements and Adding Them to the DOM -----");

// You can dynamically create new elements and append them to the DOM using `createElement()` and `appendChild()`.

let newDiv = document.createElement('div');
newDiv.classList.add('new-box');
newDiv.innerHTML = 'This is a newly created div element.';
document.body.appendChild(newDiv);
console.log("New element has been added to the DOM.");

// ------------------------------
// 13. Traversing the DOM
// ------------------------------

console.log("\n----- Traversing the DOM -----");

// You can move through the DOM tree using parentNode, childNodes, and sibling relationships.

let parentDiv = document.querySelector('.parent');

// Get the parent node
console.log("Parent node of the selected element:", parentDiv.parentNode);

// Get the first child node
console.log("First child node of the parent:", parentDiv.firstChild);

// Get the next sibling node
console.log("Next sibling node of the parent:", parentDiv.nextSibling);