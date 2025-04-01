// **Event Handling in JavaScript**

// 1. **Basic Event Handling (Using HTML and Inline Event Handler)**

/*
   You can directly add event handlers to HTML elements via attributes like 'onclick', 'onmouseover', etc.
*/

// In HTML, you can use the 'onclick' attribute:
<button onclick="alert('Button Clicked!')">Click Me</button>

// 2. **Event Handling Using JavaScript (Event Listener)**

// a. Adding Event Listener
document.getElementById('myButton').addEventListener('click', function() {
  alert('Button Clicked using Event Listener!');
});

// In HTML:
// <button id="myButton">Click Me</button>

// b. Event Listener for Multiple Events
const button = document.getElementById('myButton');
button.addEventListener('click', () => {
  console.log('Button Clicked!');
});
button.addEventListener('mouseover', () => {
  console.log('Mouse Over Button!');
});
button.addEventListener('mouseout', () => {
  console.log('Mouse Left Button!');
});

// c. Removing Event Listeners
const buttonToRemove = document.getElementById('removeButton');
function showMessage() {
  alert('Button clicked!');
}
buttonToRemove.addEventListener('click', showMessage);

// To remove the event listener:
buttonToRemove.removeEventListener('click', showMessage);

// In HTML:
// <button id="removeButton">Remove Event Listener</button>

// 3. **Event Object (Accessing Event Information)**

// Event object provides details about the event that occurred (e.g., which key was pressed, mouse position, etc.)
document.getElementById('keyPressButton').addEventListener('keydown', function(event) {
  console.log('Key Pressed:', event.key);  // Logs the key that was pressed
  console.log('Key Code:', event.keyCode);  // Logs the key code of the pressed key
});

// In HTML:
// <input type="text" id="keyPressButton" placeholder="Press a key">

// 4. **Handling Mouse Events**

const mouseElement = document.getElementById('mouseEventElement');

// Mouseover: Triggered when mouse enters the element
mouseElement.addEventListener('mouseover', () => {
  console.log('Mouse Over Element');
});

// Mouseout: Triggered when mouse leaves the element
mouseElement.addEventListener('mouseout', () => {
  console.log('Mouse Left Element');
});

// Mousemove: Triggered as the mouse moves within the element
mouseElement.addEventListener('mousemove', (event) => {
  console.log(`Mouse Position: (${event.clientX}, ${event.clientY})`);
});

// In HTML:
// <div id="mouseEventElement" style="width: 200px; height: 200px; background: lightblue;">
//   Hover over me
// </div>

// 5. **Handling Keyboard Events**

const inputElement = document.getElementById('inputElement');

// keydown: Triggered when a key is pressed
inputElement.addEventListener('keydown', (event) => {
  console.log('Key Down:', event.key);
});

// keyup: Triggered when a key is released
inputElement.addEventListener('keyup', (event) => {
  console.log('Key Up:', event.key);
});

// In HTML:
// <input type="text" id="inputElement" placeholder="Type something">

// 6. **Event Propagation (Bubbling and Capturing)**

/*
   - Bubbling: The event starts at the target element and bubbles up to the root.
   - Capturing: The event starts at the root and travels down to the target element.
*/

// Example with event bubbling:
document.getElementById('parentElement').addEventListener('click', () => {
  console.log('Parent Clicked!');
}, false);  // Use false for bubbling phase (default)

document.getElementById('childElement').addEventListener('click', () => {
  console.log('Child Clicked!');
}, false);  // Bubbling will propagate the event to parent

// Example with event capturing (true for capturing phase):
document.getElementById('parentElement').addEventListener('click', () => {
  console.log('Parent Clicked in Capturing Phase!');
}, true);  // Use true for capturing phase

// In HTML:
// <div id="parentElement" style="width: 200px; height: 200px; background-color: lightgreen;">
//   <div id="childElement" style="width: 100px; height: 100px; background-color: lightcoral;">
//     Child Element
//   </div>
// </div>

// 7. **Event Delegation**

/*
   Instead of attaching an event listener to each individual element, you can attach a single listener
   to the parent element and take advantage of event bubbling to handle events for child elements.
*/

// Example: Handling Click on Dynamic Content
document.getElementById('parentContainer').addEventListener('click', function(event) {
  if (event.target && event.target.matches('button.className')) {
    console.log('Button inside Parent Container clicked');
  }
});

// In HTML:
// <div id="parentContainer">
//   <button class="className">Click Me 1</button>
//   <button class="className">Click Me 2</button>
// </div>

// 8. **Custom Events**

/*
   You can create and dispatch your own custom events.
*/

// Example: Creating and Dispatching a Custom Event
const customEvent = new CustomEvent('myCustomEvent', {
  detail: { message: 'Hello, this is a custom event!' }
});
document.getElementById('customEventElement').dispatchEvent(customEvent);

document.getElementById('customEventElement').addEventListener('myCustomEvent', (event) => {
  console.log('Custom Event Triggered:', event.detail.message);
});

// In HTML:
// <div id="customEventElement">Trigger Custom Event</div>

