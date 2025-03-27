// ------------------------------
// 1. Basic localStorage Operations
// ------------------------------

// 1.1: Save Name to localStorage
function saveName() {
    const name = document.getElementById('name').value;
    // Saving the name entered by the user in localStorage with the key 'userName'
    localStorage.setItem('userName', name);
    alert('Name saved in localStorage!');
  }
  
  // 1.2: Load Name from localStorage
  function loadName() {
    // Retrieving the 'userName' from localStorage
    const name = localStorage.getItem('userName');
    
    if (name) {
      // If name is found, greet the user
      alert('Welcome back, ' + name + '!');
    } else {
      // If no name is found, prompt the user
      alert('No name found in localStorage.');
    }
  }
  
  // 1.3: Clear Name from localStorage
  function clearName() {
    // Removing the 'userName' from localStorage
    localStorage.removeItem('userName');
    alert('Name has been cleared from localStorage.');
  }
  
  // ------------------------------
  // 2. Storing Complex Data (Objects)
  // ------------------------------
  
  // 2.1: Save an Object to localStorage
  function saveUser() {
    const user = {
      name: document.getElementById('name').value,
      age: document.getElementById('age').value
    };
  
    // Storing the user object as a string (using JSON.stringify)
    localStorage.setItem('user', JSON.stringify(user));
    alert('User data saved in localStorage!');
  }
  
  // 2.2: Retrieve an Object from localStorage
  function loadUser() {
    // Retrieving the user object and parsing it back to a JavaScript object
    const user = JSON.parse(localStorage.getItem('user'));
    
    if (user) {
      // If the user object exists, show the user data
      alert('User Info: ' + user.name + ', Age: ' + user.age);
    } else {
      // If no user data is found, inform the user
      alert('No user data found in localStorage.');
    }
  }
  
  // ------------------------------
  // 3. Persistent Data with Expiry
  // ------------------------------
  
  // 3.1: Save Data with Expiry
  function saveWithExpiry() {
    const user = {
      name: document.getElementById('name').value,
      age: document.getElementById('age').value
    };
  
    // Set an expiry time (1 hour from now)
    const expiryTime = new Date().getTime() + 3600000; // 1 hour expiration
    const data = {
      user: user,
      expiry: expiryTime
    };
  
    // Store the data and expiry time as a string
    localStorage.setItem('userWithExpiry', JSON.stringify(data));
    alert('User data with expiry saved!');
  }
  
  // 3.2: Load Data with Expiry Check
  function loadWithExpiry() {
    // Retrieve the stored data and expiry time
    const data = JSON.parse(localStorage.getItem('userWithExpiry'));
  
    if (data) {
      const currentTime = new Date().getTime();
      
      // Check if the current time is before the expiry time
      if (currentTime < data.expiry) {
        // If not expired, show the user data
        alert('User Info: ' + data.user.name + ', Age: ' + data.user.age);
      } else {
        // If expired, remove the item from localStorage and alert the user
        localStorage.removeItem('userWithExpiry');
        alert('Data expired. Please save again.');
      }
    } else {
      // If no data is found, inform the user
      alert('No data found or data has expired.');
    }
  }
  
  // ------------------------------
  // 4. Iterating Through localStorage Items
  // ------------------------------
  
  // 4.1: Show all localStorage data
  function showAllStorage() {
    let allData = '';
    // Loop through all the keys in localStorage
    for (let i = 0; i < localStorage.length; i++) {
      let key = localStorage.key(i);
      let value = localStorage.getItem(key);
      allData += key + ': ' + value + '\n';
    }
    alert(allData || 'No data in localStorage.');
  }
  
  // ------------------------------
  // 5. Handling localStorage Quota Limits
  // ------------------------------
  
  // 5.1: Save data with large size to test storage limits
  function saveDataWithLimit() {
    try {
      // Trying to save a large string to localStorage (may exceed quota)
      localStorage.setItem('bigData', new Array(1000000).join('X')); // Simulating a large data set
      alert('Data saved successfully!');
    } catch (e) {
      if (e.name === 'QuotaExceededError') {
        // Catching quota exceeded error
        alert('Storage limit exceeded. Try removing some data.');
      } else {
        alert('An error occurred: ' + e.message);
      }
    }
  }
  
  // ------------------------------
  // 6. Listening to localStorage Changes
  // ------------------------------
  
  // 6.1: Listen for changes in localStorage (across different tabs)
  window.addEventListener('storage', function(event) {
    alert(`Storage changed: 
      Key: ${event.key}, 
      Old Value: ${event.oldValue}, 
      New Value: ${event.newValue}, 
      URL: ${event.url}`);
  });
  
  // ------------------------------
  // 7. Checking for localStorage Support
  // ------------------------------
  
  // 7.1: Check if localStorage is supported by the browser
  function checkLocalStorageSupport() {
    if (typeof(Storage) !== 'undefined') {
      alert('localStorage is supported!');
    } else {
      alert('localStorage is not supported in this browser.');
    }
  }
  