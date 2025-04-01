// **AJAX (Asynchronous JavaScript and XML)**

// 1. **Using XMLHttpRequest (Traditional AJAX Approach)**

function makeRequest() {
    const xhr = new XMLHttpRequest();  // Create a new XMLHttpRequest object
  
    // Configure the request: type (GET), URL (API endpoint), and async (true means async)
    xhr.open('GET', 'https://jsonplaceholder.typicode.com/posts', true);
  
    // Set up a function to handle the response when it's received
    xhr.onload = function () {
      if (xhr.status >= 200 && xhr.status < 300) {  // Success: Status 200-299
        console.log('AJAX Response:', JSON.parse(xhr.responseText));  // Log the response to the console
      } else {
        console.error('Request failed with status:', xhr.status);  // Handle failure (e.g., 404, 500)
      }
    };
  
    // Set up a function to handle errors
    xhr.onerror = function () {
      console.error('Request failed');  // Handle network or request error
    };
  
    // Send the request
    xhr.send();
  }
  
  // Call the function to make an AJAX request
  makeRequest();
  
  // **Using Fetch API (Modern Approach)**
  
  // 2. **Using Fetch API (Promise-based)**
  
  function fetchData() {
    fetch('https://jsonplaceholder.typicode.com/posts')  // Fetch data from the API
      .then((response) => {
        if (!response.ok) {  // Check if the response is okay (status 200-299)
          throw new Error('Network response was not ok');
        }
        return response.json();  // Parse the response as JSON
      })
      .then((data) => {
        console.log('Fetch Response:', data);  // Log the parsed JSON data
      })
      .catch((error) => {
        console.error('There was a problem with the fetch operation:', error);  // Handle errors
      });
  }
  
  // Call the function to fetch data using Fetch API
  fetchData();
  
  // 3. **Using Fetch with POST Request (Sending Data)**
  
  // Sending data using a POST request
  function sendData() {
    const data = { title: 'foo', body: 'bar', userId: 1 };
  
    fetch('https://jsonplaceholder.typicode.com/posts', {
      method: 'POST',  // HTTP method
      headers: {
        'Content-Type': 'application/json'  // Indicating the type of the content being sent
      },
      body: JSON.stringify(data)  // Convert the data object to a JSON string
    })
      .then((response) => response.json())  // Parse the response JSON
      .then((data) => {
        console.log('POST Response:', data);  // Log the response from the server
      })
      .catch((error) => {
        console.error('There was an error with the POST request:', error);  // Handle errors
      });
  }
  
  // Call the function to send data via POST
  sendData();
  
  // 4. **Handling Timeouts in Fetch**
  function fetchWithTimeout(url, timeout = 5000) {
    const controller = new AbortController();
    const signal = controller.signal;
  
    setTimeout(() => {
      controller.abort();  // Abort the request if it takes too long
    }, timeout);
  
    fetch(url, { signal })
      .then((response) => response.json())
      .then((data) => console.log('Response within timeout:', data))
      .catch((error) => {
        if (error.name === 'AbortError') {
          console.error('Request timed out');
        } else {
          console.error('Error with fetch:', error);
        }
      });
  }
  
  // Fetch with timeout
  fetchWithTimeout('https://jsonplaceholder.typicode.com/posts');
  
  // 5. **Handling Errors (AJAX vs Fetch)**
  
  function fetchWithErrorHandling() {
    fetch('https://jsonplaceholder.typicode.com/invalidEndpoint')  // Using an invalid URL to simulate an error
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        console.log('Data:', data);  // If the request is successful
      })
      .catch((error) => {
        console.error('There was a problem with the fetch operation:', error);  // Catch and handle the error
      });
  }
  
  // Call function to fetch data with error handling
  fetchWithErrorHandling();
  
  // **AJAX vs Fetch API: Key Differences**
  // AJAX (XMLHttpRequest):
  // - More verbose syntax.
  // - Callbacks for handling responses and errors.
  // - No built-in support for promises (requires additional libraries for async handling).
  // - Synchronous and asynchronous capabilities, but more complex.
  
  // Fetch API:
  // - Uses promises for simpler and cleaner syntax.
  // - More modern approach, preferred for handling async HTTP requests.
  // - Easier to work with JSON and handle response status codes.
  