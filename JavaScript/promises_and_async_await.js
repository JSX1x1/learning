// **Promises and Async/Await in JavaScript**

// 1. **Promises**

/*
   A Promise is an object that represents the eventual completion (or failure) of an asynchronous operation and its resulting value.
   
   A promise can be:
   - Pending: The initial state; the operation is still in progress.
   - Fulfilled: The operation completed successfully.
   - Rejected: The operation failed.
*/

// Example of creating a simple promise
const myPromise = new Promise((resolve, reject) => {
    const success = true;
    
    if (success) {
      resolve("Promise has been resolved!");
    } else {
      reject("Promise has been rejected.");
    }
  });
  
  // Using `.then()` and `.catch()` to handle resolved/rejected promises
  myPromise
    .then((result) => {
      console.log(result); // If resolved: "Promise has been resolved!"
    })
    .catch((error) => {
      console.log(error); // If rejected: "Promise has been rejected."
    });
  
  // 2. **Chaining Promises**
  
  /*
     You can chain `.then()` methods to execute multiple operations one after another.
  */
  
  // Example of promise chaining:
  const firstPromise = new Promise((resolve, reject) => {
    resolve("First promise resolved!");
  });
  
  firstPromise
    .then((result) => {
      console.log(result); // "First promise resolved!"
      return "Second promise resolved!"; // Returning a value to the next .then
    })
    .then((result) => {
      console.log(result); // "Second promise resolved!"
      return "Third promise resolved!";
    })
    .then((result) => {
      console.log(result); // "Third promise resolved!"
    })
    .catch((error) => {
      console.log(error); // Handle any rejection errors
    });
  
  // 3. **Promise.all()**
  
  /*
     `Promise.all()` allows you to run multiple promises in parallel and wait for all of them to resolve (or any to reject).
  */
  
  // Example of `Promise.all()` with multiple promises
  const promise1 = new Promise((resolve) => setTimeout(resolve, 1000, "First Promise"));
  const promise2 = new Promise((resolve) => setTimeout(resolve, 2000, "Second Promise"));
  const promise3 = new Promise((resolve) => setTimeout(resolve, 3000, "Third Promise"));
  
  Promise.all([promise1, promise2, promise3])
    .then((results) => {
      console.log(results); // ["First Promise", "Second Promise", "Third Promise"]
    })
    .catch((error) => {
      console.log("Error in promises:", error);
    });
  
  // 4. **Async/Await**
  
  /*
     `async/await` is a cleaner syntax for working with promises and allows you to write asynchronous code as if it were synchronous.
     - `async` makes a function return a promise.
     - `await` pauses the execution of an async function until the promise resolves.
  */
  
  // Example of using `async/await`
  async function fetchData() {
    const result = await myPromise;  // Wait for the promise to resolve
    console.log(result);  // If resolved: "Promise has been resolved!"
  }
  
  fetchData();
  
  // 5. **Handling Errors with try/catch in async/await**
  
  /*
     You can use `try/catch` blocks to handle errors when using `async/await`.
  */
  
  // Example of error handling with try/catch
  async function fetchDataWithErrorHandling() {
    try {
      const result = await myPromise;  // If promise resolves successfully
      console.log(result);
    } catch (error) {
      console.log("Error caught:", error);  // If promise is rejected
    }
  }
  
  fetchDataWithErrorHandling();
  
  // 6. **Returning Promises from Async Functions**
  
  /*
     Async functions always return a promise, even if you don't explicitly return one.
     If you return a value, it’s automatically wrapped in a resolved promise.
  */
  
  // Example:
  async function returnValue() {
    return "Returned value from async function";
  }
  
  returnValue().then((result) => {
    console.log(result);  // "Returned value from async function"
  });
  
  // 7. **Using await with multiple asynchronous operations**
  
  /*
     You can use `await` multiple times in an async function, allowing you to perform operations in sequence.
  */
  
  // Example with multiple `await` statements
  async function multipleAsyncOperations() {
    const result1 = await new Promise((resolve) => setTimeout(resolve, 1000, "First operation done"));
    console.log(result1);  // "First operation done"
    
    const result2 = await new Promise((resolve) => setTimeout(resolve, 2000, "Second operation done"));
    console.log(result2);  // "Second operation done"
    
    const result3 = await new Promise((resolve) => setTimeout(resolve, 3000, "Third operation done"));
    console.log(result3);  // "Third operation done"
  }
  
  multipleAsyncOperations();
  
  // 8. **Handling Multiple async operations with `Promise.all()`**
  
  /*
     If you need to run multiple async operations in parallel and wait for them to complete, use `Promise.all()` with `await`.
  */
  
  // Example of using `Promise.all()` with async/await
  async function runParallelOperations() {
    const [result1, result2, result3] = await Promise.all([
      new Promise((resolve) => setTimeout(resolve, 1000, "First operation done")),
      new Promise((resolve) => setTimeout(resolve, 2000, "Second operation done")),
      new Promise((resolve) => setTimeout(resolve, 3000, "Third operation done"))
    ]);
    
    console.log(result1);  // "First operation done"
    console.log(result2);  // "Second operation done"
    console.log(result3);  // "Third operation done"
  }
  
  runParallelOperations();
  
  // 9. **Handling Timeout with `setTimeout` and Promises**
  
  /*
     You can also use promises with `setTimeout` to handle asynchronous delays in your code.
  */
  
  // Example of timeout using promises
  function delay(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }
  
  async function delayedFunction() {
    console.log("Waiting...");
    await delay(2000);  // Wait for 2 seconds
    console.log("Waited for 2 seconds");
  }
  
  delayedFunction();
  