<?php
// Backend Implementation and Interactions Learning Script in PHP

// Define lessons related to backend implementation and interactions
$lessons = [
    '1' => 'Introduction to Backend Development in PHP',
    '2' => 'Handling HTTP Requests (GET, POST, PUT, DELETE)',
    '3' => 'Database Interaction (MySQL with PDO)',
    '4' => 'User Authentication and Authorization',
    '5' => 'Data Validation and Sanitization',
    '6' => 'Working with APIs in PHP',
    '7' => 'Handling File Uploads and Management',
    '8' => 'Error Handling in Backend Applications',
    '9' => 'Creating and Using Custom PHP Classes',
    '10' => 'Backend Security Best Practices'
];

// Check if a lesson is selected
if (isset($_GET['lesson'])) {
    $lesson = $_GET['lesson'];
    if (isset($lessons[$lesson])) {
        echo "<h2>Lesson " . $lesson . ": " . $lessons[$lesson] . "</h2>";
        showLessonContent($lesson);
    } else {
        echo "<h2>Lesson not found!</h2>";
    }
} else {
    // Display list of lessons if none is selected
    echo "<h1>Welcome to the Backend Implementation and Interactions Learning System</h1>";
    echo "<p>Choose a lesson to begin:</p>";
    echo "<ul>";
    foreach ($lessons as $key => $lesson) {
        echo "<li><a href='?lesson=$key'>$lesson</a></li>";
    }
    echo "</ul>";
}

// Function to display the lesson content
function showLessonContent($lesson) {
    switch ($lesson) {
        case '1':
            echo "<h3>Introduction to Backend Development in PHP</h3>";
            echo "<p>Backend development refers to the server-side functionality that handles requests, processes data, and interacts with the database. PHP is commonly used to develop backend systems and manage various backend operations like handling HTTP requests, performing CRUD operations, and user authentication.</p>";
            echo "<p>Some key topics in backend PHP development:</p>";
            echo "<ul>
                    <li>Handling HTTP requests (GET, POST, PUT, DELETE).</li>
                    <li>Interacting with databases using PDO.</li>
                    <li>Building user authentication systems (login/logout).</li>
                    <li>Validating and sanitizing user inputs.</li>
                    <li>Creating and consuming REST APIs.</li>
                    <li>Working with file uploads and management.</li>
                    <li>Implementing security measures to protect data and users.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Handling HTTP Requests (GET, POST, PUT, DELETE)</h3>";
            echo "<p>In backend development, HTTP requests are used to communicate with the server. The most common types of HTTP requests are GET, POST, PUT, and DELETE.</p>";
            echo "<p>Here’s an example of handling a GET request in PHP:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'GET') {
    \$id = \$_GET['id']; // Get data from the URL
    echo 'Request method is GET, ID: ' . \$id;
}
            </code></pre>";
            echo "<p>Here’s how to handle a POST request:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'POST') {
    \$name = \$_POST['name']; // Get data from the form
    echo 'Request method is POST, Name: ' . \$name;
}
            </code></pre>";
            echo "<p>Handling PUT and DELETE requests is common in REST APIs. To handle PUT and DELETE, you typically use PHP to access the raw input:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'PUT') {
    parse_str(file_get_contents('php://input'), \$put_data);
    echo 'Request method is PUT, Data: ' . print_r(\$put_data, true);
}

if (\$_SERVER['REQUEST_METHOD'] == 'DELETE') {
    \$delete_data = json_decode(file_get_contents('php://input'), true);
    echo 'Request method is DELETE, Data: ' . print_r(\$delete_data, true);
}
            </code></pre>";
            break;

        case '3':
            echo "<h3>Database Interaction (MySQL with PDO)</h3>";
            echo "<p>PDO (PHP Data Objects) is a database access layer providing a uniform method of access to multiple databases. It allows interaction with databases like MySQL using prepared statements, which help prevent SQL injection attacks.</p>";
            echo "<p>Here’s an example of connecting to a MySQL database and fetching data using PDO:</p>";
            echo "<pre><code>
try {
    \$pdo = new PDO('mysql:host=localhost;dbname=my_database', 'username', 'password');
    \$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    \$stmt = \$pdo->query('SELECT * FROM users');
    while (\$row = \$stmt->fetch()) {
        echo 'User: ' . \$row['username'] . '<br>';
    }
} catch (PDOException \$e) {
    echo 'Connection failed: ' . \$e->getMessage();
}
            </code></pre>";
            break;

        case '4':
            echo "<h3>User Authentication and Authorization</h3>";
            echo "<p>User authentication verifies a user’s identity, while authorization determines what actions the user can perform.</p>";
            echo "<p>Here's a basic example of how user login and session management works:</p>";
            echo "<pre><code>
session_start();
if (\$_SERVER['REQUEST_METHOD'] == 'POST') {
    \$username = \$_POST['username'];
    \$password = \$_POST['password'];
    // Assume that user validation logic happens here
    if (\$username == 'admin' && \$password == 'password') {
        \$_SESSION['user'] = \$username;
        echo 'Login successful.';
    } else {
        echo 'Invalid credentials.';
    }
}

if (isset(\$_SESSION['user'])) {
    echo 'Welcome ' . \$_SESSION['user'];
}
            </code></pre>";
            break;

        case '5':
            echo "<h3>Data Validation and Sanitization</h3>";
            echo "<p>Validating and sanitizing user input is crucial for security and data integrity. Validation ensures the input is of the correct format, and sanitization cleans the input to prevent malicious content such as SQL injection or cross-site scripting (XSS).</p>";
            echo "<p>Example of sanitizing and validating user input:</p>";
            echo "<pre><code>
\$email = filter_var(\$_POST['email'], FILTER_SANITIZE_EMAIL);
if (filter_var(\$email, FILTER_VALIDATE_EMAIL)) {
    echo 'Valid email: ' . \$email;
} else {
    echo 'Invalid email address.';
}
            </code></pre>";
            break;

        case '6':
            echo "<h3>Working with APIs in PHP</h3>";
            echo "<p>Backend development often involves creating and consuming APIs (Application Programming Interfaces). In PHP, you can use <strong>cURL</strong> or <strong>file_get_contents()</strong> to make HTTP requests to external APIs.</p>";
            echo "<p>Example of making an API request using cURL:</p>";
            echo "<pre><code>
\$url = 'https://api.example.com/data';
\$ch = curl_init(\$url);
curl_setopt(\$ch, CURLOPT_RETURNTRANSFER, true);
\$response = curl_exec(\$ch);
curl_close(\$ch);
echo 'API Response: ' . \$response;
            </code></pre>";
            break;

        case '7':
            echo "<h3>Handling File Uploads and Management</h3>";
            echo "<p>File uploads are commonly handled via an HTML form. PHP allows you to process uploaded files using the <strong>\$_FILES</strong> superglobal.</p>";
            echo "<p>Example of handling a file upload:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'POST' && isset(\$_FILES['file'])) {
    \$file = \$_FILES['file'];
    \$target_dir = 'uploads/';
    \$target_file = \$target_dir . basename(\$file['name']);
    if (move_uploaded_file(\$file['tmp_name'], \$target_file)) {
        echo 'File uploaded successfully.';
    } else {
        echo 'Error uploading file.';
    }
}
            </code></pre>";
            break;

        case '8':
            echo "<h3>Error Handling in Backend Applications</h3>";
            echo "<p>Proper error handling is essential in any backend application to ensure smooth operation and debugging. PHP has built-in error handling functions like <strong>try-catch</strong> blocks and custom error handling functions.</p>";
            echo "<p>Example of handling errors with a try-catch block:</p>";
            echo "<pre><code>
try {
    if (!file_exists('data.txt')) {
        throw new Exception('File not found.');
    }
} catch (Exception \$e) {
    echo 'Error: ' . \$e->getMessage();
}
            </code></pre>";
            break;

        case '9':
            echo "<h3>Creating and Using Custom PHP Classes</h3>";
            echo "<p>PHP allows you to create custom classes to encapsulate functionality and data. This helps organize code and promotes reusability.</p>";
            echo "<p>Example of a simple PHP class:</p>";
            echo "<pre><code>
class User {
    private \$username;
    private \$email;

    public function __construct(\$username, \$email) {
        \$this->username = \$username;
        \$this->email = \$email;
    }

    public function getUsername() {
        return \$this->username;
    }

    public function getEmail() {
        return \$this->email;
    }
}

\$user = new User('JohnDoe', 'john@example.com');
echo 'Username: ' . \$user->getUsername();
            </code></pre>";
            break;

        case '10':
            echo "<h3>Backend Security Best Practices</h3>";
            echo "<p>Securing the backend of your application is crucial to prevent unauthorized access and data breaches. Some security best practices include:</p>";
            echo "<ul>
                    <li>Sanitize and validate all user inputs to prevent SQL injection and XSS attacks.</li>
                    <li>Use prepared statements with PDO to protect against SQL injection.</li>
                    <li>Hash passwords using algorithms like bcrypt or Argon2.</li>
                    <li>Use HTTPS for secure communication between the server and client.</li>
                    <li>Implement proper session management and use session cookies securely.</li>
                    <li>Regularly update your PHP and server configurations to patch known vulnerabilities.</li>
                  </ul>";
            break;
    }
}
?>
