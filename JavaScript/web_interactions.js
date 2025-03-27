// ------------------------------
// 1. Selecting HTML Elements
// ------------------------------

// Selecting an element by its ID
const elementById = document.getElementById('myElement');
console.log(elementById); // Logs the element with the ID 'myElement'

// Selecting elements by class name
const elementsByClass = document.getElementsByClassName('myClass');
console.log(elementsByClass); // Logs an HTMLCollection of elements with the class 'myClass'

// Selecting elements by tag name
const elementsByTag = document.getElementsByTagName('div');
console.log(elementsByTag); // Logs all <div> elements in the document

// Selecting the first element matching a CSS selector
const firstElement = document.querySelector('.myClass');
console.log(firstElement); // Logs the first element with the class 'myClass'

// Selecting all elements matching a CSS selector
const allElements = document.querySelectorAll('div.myClass');
console.log(allElements); // Logs a NodeList of all <div> elements with the class 'myClass'

// ------------------------------
// 2. Modifying HTML Elements
// ------------------------------

// Changing text content of an element
const element = document.querySelector('#myElement');
element.textContent = 'This is the new text content!';
console.log(element.textContent); // Logs the new text content

// Changing the inner HTML of an element
element.innerHTML = '<strong>This is <em>new</em> HTML content!</strong>';
console.log(element.innerHTML); // Logs the new HTML content

// Changing the value of an input field
const inputElement = document.querySelector('#inputField');
inputElement.value = 'New input value';
console.log(inputElement.value); // Logs the new input value

// ------------------------------
// 3. Modifying Element Attributes
// ------------------------------

// Changing an element's attribute
const linkElement = document.querySelector('#myLink');
linkElement.setAttribute('href', 'https://www.new-url.com');
console.log(linkElement.getAttribute('href')); // Logs the updated href attribute

// ------------------------------
// 4. Manipulating Styles
// ------------------------------

// Changing inline styles of an element
const styledElement = document.querySelector('#styledElement');
styledElement.style.backgroundColor = 'lightblue'; // Sets background color
styledElement.style.fontSize = '20px'; // Sets font size
styledElement.style.padding = '10px'; // Sets padding

// Adding and removing classes
styledElement.classList.add('newClass'); // Adds a class to the element
styledElement.classList.remove('oldClass'); // Removes a class
styledElement.classList.toggle('activeClass'); // Toggles a class (if it exists, remove it, else add it)

// ------------------------------
// 5. Event Handling
// ------------------------------

// Adding an event listener for a button click
const button = document.querySelector('#myButton');
button.addEventListener('click', () => {
  alert('Button was clicked!');
});

// Event delegation: handling clicks for a dynamically generated list of items
const listContainer = document.querySelector('#listContainer');
listContainer.addEventListener('click', (event) => {
  if (event.target && event.target.matches('li.list-item')) {
    console.log('List item clicked:', event.target.textContent);
  }
});

// ------------------------------
// 6. Creating and Removing Elements
// ------------------------------

// Creating a new element
const newDiv = document.createElement('div');
newDiv.textContent = 'This is a dynamically created div';
newDiv.classList.add('newDivClass');
document.body.appendChild(newDiv); // Adds the new div to the end of the body

// Removing an element
const elementToRemove = document.querySelector('#removeThisElement');
elementToRemove.remove(); // Removes the element with the ID 'removeThisElement'

// ------------------------------
// 7. Form Handling and Validation
// ------------------------------

// Submitting a form via JavaScript
const form = document.querySelector('#myForm');
form.addEventListener('submit', (e) => {
  e.preventDefault(); // Prevents the form from submitting normally
  const formData = new FormData(form); // Grabs form data
  console.log([...formData]); // Logs form data as an array of key-value pairs
});

// Simple input validation
const nameInput = document.querySelector('#nameInput');
nameInput.addEventListener('input', () => {
  if (nameInput.value.trim() === '') {
    nameInput.setCustomValidity('Name cannot be empty!');
  } else {
    nameInput.setCustomValidity('');
  }
});

// ------------------------------
// 8. Animations and Transitions
// ------------------------------

// Adding a transition effect to an element
const animatedElement = document.querySelector('#animatedElement');
animatedElement.style.transition = 'all 2s ease-in-out';
animatedElement.style.transform = 'scale(1.5)'; // Apply a transformation

// Simple animation using setInterval
let counter = 0;
const animateBox = document.querySelector('#animateBox');
const interval = setInterval(() => {
  counter += 1;
  animateBox.style.left = `${counter}px`; // Moves the element to the right
  if (counter >= 200) clearInterval(interval); // Stops the animation after 200px
}, 10);

// ------------------------------
// 9. AJAX and Fetch API (Asynchronous Data Fetching)
// ------------------------------

// Using Fetch API to fetch data from an external resource
fetch('https://jsonplaceholder.typicode.com/todos/1')
  .then(response => response.json()) // Parses the JSON response
  .then(data => {
    console.log('Fetched Data:', data); // Logs the fetched data
    const todo = document.createElement('p');
    todo.textContent = `Task: ${data.title}`;
    document.body.appendChild(todo); // Adds the fetched data to the page
  })
  .catch(error => {
    console.error('Error fetching data:', error); // Handles any errors
  });

// ------------------------------
// 10. Working with Media (Audio/Video)
// ------------------------------

// Playing an audio file
const audio = document.querySelector('#audioElement');
audio.play(); // Starts playing the audio

// Pausing an audio file
audio.pause(); // Pauses the audio playback

// Changing the source of a video element
const video = document.querySelector('#videoElement');
video.src = 'https://www.example.com/video.mp4';
video.play(); // Plays the new video

// ------------------------------
// 11. Advanced DOM Manipulation Techniques
// ------------------------------

// Using template literals to generate dynamic HTML content
const user = {
  name: 'John Doe',
  age: 30
};

const userElement = document.createElement('div');
userElement.innerHTML = `
  <h2>User Info</h2>
  <p>Name: ${user.name}</p>
  <p>Age: ${user.age}</p>
`;
document.body.appendChild(userElement); // Appends dynamic content to the body

// Dynamically styling elements using CSS variables
document.documentElement.style.setProperty('--main-bg-color', 'lightcoral');
const styledElement2 = document.querySelector('#styledElement2');
styledElement2.style.backgroundColor = 'var(--main-bg-color)';

// ------------------------------
// Conclusion
// ------------------------------

// This script covers many aspects of DOM manipulation, event handling, animations, form handling, AJAX requests, and more. Mastering these concepts allows you to build interactive, dynamic web pages.