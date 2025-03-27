// ------------------------------
// 1. Save Data to the Database
// ------------------------------

async function saveUser() {
    const name = document.getElementById('name').value;
    const age = document.getElementById('age').value;
  
    // Check if both name and age are provided
    if (!name || !age) {
      alert('Please provide both name and age.');
      return;
    }
  
    try {
      // Sending a POST request to save the user data
      const response = await fetch('http://localhost:5000/api/users', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name, age })
      });
  
      if (!response.ok) {
        throw new Error('Failed to save user.');
      }
  
      const user = await response.json();
      alert('User saved successfully: ' + JSON.stringify(user));
      loadUsers(); // Refresh user list after saving
    } catch (error) {
      console.error('Error saving user:', error);
      alert('Error saving user: ' + error.message);
    }
  }
  
  // ------------------------------
  // 2. Retrieve Data from the Database
  // ------------------------------
  
  async function loadUsers() {
    try {
      // Sending a GET request to fetch all users
      const response = await fetch('http://localhost:5000/api/users');
      
      if (!response.ok) {
        throw new Error('Failed to load users.');
      }
  
      const users = await response.json();
  
      // Displaying users in an unordered list
      const userList = document.getElementById('userList');
      userList.innerHTML = ''; // Clear any previous list
  
      if (users.length === 0) {
        userList.innerHTML = '<li>No users found in the database.</li>';
      } else {
        users.forEach(user => {
          const li = document.createElement('li');
          li.textContent = `Name: ${user.name}, Age: ${user.age}`;
          userList.appendChild(li);
        });
      }
    } catch (error) {
      console.error('Error loading users:', error);
      alert('Error loading users: ' + error.message);
    }
  }
  
  // ------------------------------
  // 3. Update Data in the Database
  // ------------------------------
  
  async function updateUser(id) {
    const name = prompt('Enter the new name:');
    const age = prompt('Enter the new age:');
  
    // Validate input
    if (!name || !age) {
      alert('Both name and age are required.');
      return;
    }
  
    try {
      // Sending a PUT request to update the user data
      const response = await fetch(`http://localhost:5000/api/users/${id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name, age })
      });
  
      if (!response.ok) {
        throw new Error('Failed to update user.');
      }
  
      const updatedUser = await response.json();
      alert('User updated successfully: ' + JSON.stringify(updatedUser));
      loadUsers(); // Refresh user list after update
    } catch (error) {
      console.error('Error updating user:', error);
      alert('Error updating user: ' + error.message);
    }
  }
  
  // ------------------------------
  // 4. Delete Data from the Database
  // ------------------------------
  
  async function deleteUser(id) {
    const confirmation = confirm('Are you sure you want to delete this user?');
  
    if (!confirmation) {
      return;
    }
  
    try {
      // Sending a DELETE request to delete the user
      const response = await fetch(`http://localhost:5000/api/users/${id}`, {
        method: 'DELETE'
      });
  
      if (!response.ok) {
        throw new Error('Failed to delete user.');
      }
  
      const result = await response.json();
      alert('User deleted successfully.');
      loadUsers(); // Refresh user list after deletion
    } catch (error) {
      console.error('Error deleting user:', error);
      alert('Error deleting user: ' + error.message);
    }
  }
  
  // ------------------------------
  // 5. Handle Errors (Generic)
  // ------------------------------
  
  async function handleRequest(url, method, body = null) {
    try {
      const response = await fetch(url, {
        method: method,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body ? JSON.stringify(body) : null
      });
  
      if (!response.ok) {
        throw new Error(`Request failed with status: ${response.status}`);
      }
  
      return await response.json();
    } catch (error) {
      console.error('Error with request:', error);
      alert('Error: ' + error.message);
    }
  }
  
  // ------------------------------
  // 6. Data Pagination (For Large Datasets)
  // ------------------------------
  
  async function loadUsersPaginated(page = 1, limit = 10) {
    try {
      // Sending GET request to fetch users with pagination (page & limit)
      const response = await fetch(`http://localhost:5000/api/users?page=${page}&limit=${limit}`);
      
      if (!response.ok) {
        throw new Error('Failed to load paginated users.');
      }
  
      const result = await response.json();
      const users = result.users;
  
      // Displaying users in an unordered list
      const userList = document.getElementById('userList');
      userList.innerHTML = ''; // Clear current list
  
      if (users.length === 0) {
        userList.innerHTML = '<li>No users found in the database.</li>';
      } else {
        users.forEach(user => {
          const li = document.createElement('li');
          li.textContent = `Name: ${user.name}, Age: ${user.age}`;
          userList.appendChild(li);
        });
      }
  
      // Display pagination controls if needed
      if (result.totalPages > 1) {
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';
  
        for (let i = 1; i <= result.totalPages; i++) {
          const button = document.createElement('button');
          button.textContent = i;
          button.onclick = () => loadUsersPaginated(i, limit);
          pagination.appendChild(button);
        }
      }
    } catch (error) {
      console.error('Error loading paginated users:', error);
      alert('Error loading users: ' + error.message);
    }
  }
  
  // ------------------------------
  // 7. Check for Server Availability
  // ------------------------------
  
  async function checkServerStatus() {
    try {
      const response = await fetch('http://localhost:5000/healthcheck');
      
      if (response.ok) {
        alert('Server is running fine.');
      } else {
        alert('Server returned an error: ' + response.status);
      }
    } catch (error) {
      console.error('Error checking server status:', error);
      alert('Error connecting to the server: ' + error.message);
    }
  }
  