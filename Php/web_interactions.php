<?php
// Web Interaction Learning Script for PHP

// Define lessons related to web interactions
$lessons = [
    '1' => 'Introduction to Web Interactions in PHP',
    '2' => 'Handling User Input (GET, POST)',
    '3' => 'Handling Forms in PHP',
    '4' => 'Working with Cookies in PHP',
    '5' => 'Using Sessions in PHP',
    '6' => 'File Uploads in PHP',
    '7' => 'Sending Emails in PHP',
    '8' => 'Database Interaction (MySQL with PDO)',
    '9' => 'Error Handling in Web Interactions',
    '10' => 'Security Best Practices in Web Development'
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
    echo "<h1>Welcome to the Web Interaction Learning System</h1>";
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
            echo "<h3>Introduction to Web Interactions in PHP</h3>";
            echo "<p>PHP is widely used for building dynamic and interactive websites. Web interaction refers to the process of handling requests from users (via forms, URLs, cookies, etc.) and providing responses back (such as displaying pages, sending emails, or storing information in a database).</p>";
            echo "<p>Some of the core PHP functions for web interactions include:</p>";
            echo "<ul>
                    <li><strong>\$_GET</strong>, <strong>\$_POST</strong> for handling user input.</li>
                    <li><strong>$_COOKIE</strong>, <strong>$_SESSION</strong> for managing user data across requests.</li>
                    <li><strong>move_uploaded_file()</strong> for handling file uploads.</li>
                    <li><strong>mail()</strong> for sending emails.</li>
                    <li><strong>PDO</strong> for interacting with databases securely.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Handling User Input (GET, POST)</h3>";
            echo "<p>In PHP, user input is usually sent via forms, and the data is available to you through the <strong>\$_GET</strong> (for GET requests) and <strong>\$_POST</strong> (for POST requests) superglobals.</p>";
            echo "<p>Here’s an example of handling data from a form using the GET method:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'GET') {
    \$name = isset(\$_GET['name']) ? \$_GET['name'] : '';
    echo 'Hello, ' . \$name;
}
            </code></pre>";
            echo "<p>Example of handling data from a POST form:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'POST') {
    \$name = isset(\$_POST['name']) ? \$_POST['name'] : '';
    echo 'Hello, ' . \$name;
}
            </code></pre>";
            break;

        case '3':
            echo "<h3>Handling Forms in PHP</h3>";
            echo "<p>Forms are the main way to collect input from users on a website. PHP processes the data when the form is submitted. You can either use GET or POST as the form method depending on the type of data you're sending.</p>";
            echo "<p>Here’s an example of a simple HTML form:</p>";
            echo "<pre><code>
<form action='' method='POST'>
    <label for='name'>Name:</label>
    <input type='text' name='name' id='name'>
    <input type='submit' value='Submit'>
</form>
            </code></pre>";
            echo "<p>And in PHP, we handle the form submission like this:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'POST') {
    \$name = isset(\$_POST['name']) ? \$_POST['name'] : '';
    echo 'Form submitted. Name: ' . \$name;
}
            </code></pre>";
            break;

        case '4':
            echo "<h3>Working with Cookies in PHP</h3>";
            echo "<p>Cookies are small pieces of data stored on the client's browser. You can use them to track user activity or store preferences.</p>";
            echo "<p>Setting a cookie in PHP is simple:</p>";
            echo "<pre><code>
// Set a cookie that expires in 1 hour
setcookie('user', 'John Doe', time() + 3600, '/');
            </code></pre>";
            echo "<p>To retrieve the cookie value:</p>";
            echo "<pre><code>
if (isset(\$_COOKIE['user'])) {
    echo 'Hello, ' . \$_COOKIE['user'];
} else {
    echo 'No cookie found.';
}
            </code></pre>";
            break;

        case '5':
            echo "<h3>Using Sessions in PHP</h3>";
            echo "<p>Sessions are used to store data across multiple pages, and they persist until the browser is closed or the session expires.</p>";
            echo "<p>Start a session using <strong>session_start()</strong>:</p>";
            echo "<pre><code>
session_start();
if (!isset(\$_SESSION['user'])) {
    \$_SESSION['user'] = 'John Doe';
}
echo 'Welcome, ' . \$_SESSION['user'];
            </code></pre>";
            break;

        case '6':
            echo "<h3>File Uploads in PHP</h3>";
            echo "<p>PHP allows you to handle file uploads easily through HTML forms. The <strong>move_uploaded_file()</strong> function is used to move the uploaded file to a desired location on the server.</p>";
            echo "<p>Example of an HTML form for file uploads:</p>";
            echo "<pre><code>
<form action='' method='POST' enctype='multipart/form-data'>
    <label for='file'>Choose a file:</label>
    <input type='file' name='file' id='file'>
    <input type='submit' value='Upload'>
</form>
            </code></pre>";
            echo "<p>Handling the file upload in PHP:</p>";
            echo "<pre><code>
if (\$_SERVER['REQUEST_METHOD'] == 'POST' && isset(\$_FILES['file'])) {
    \$target_dir = 'uploads/';
    \$target_file = \$target_dir . basename(\$_FILES['file']['name']);
    if (move_uploaded_file(\$_FILES['file']['tmp_name'], \$target_file)) {
        echo 'The file has been uploaded.';
    } else {
        echo 'Sorry, there was an error uploading your file.';
    }
}
            </code></pre>";
            break;

        case '7':
            echo "<h3>Sending Emails in PHP</h3>";
            echo "<p>PHP provides the <strong>mail()</strong> function to send simple emails. The basic usage involves specifying the recipient, subject, and message.</p>";
            echo "<pre><code>
\$to = 'recipient@example.com';
\$subject = 'Test Email';
\$message = 'Hello, this is a test email.';
\$headers = 'From: sender@example.com';
mail(\$to, \$subject, \$message, \$headers);
            </code></pre>";
            break;

        case '8':
            echo "<h3>Database Interaction (MySQL with PDO)</h3>";
            echo "<p>PHP can interact with MySQL databases using PDO (PHP Data Objects). This allows you to perform database operations securely and efficiently.</p>";
            echo "<p>Here’s an example of connecting to a MySQL database and performing a query:</p>";
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

        case '9':
            echo "<h3>Error Handling in Web Interactions</h3>";
            echo "<p>In web development, error handling is crucial to ensure that the application works smoothly. PHP provides error handling mechanisms such as try-catch blocks and custom error handling functions.</p>";
            echo "<p>Here’s an example of handling errors with a try-catch block:</p>";
            echo "<pre><code>
try {
    if (!file_exists('somefile.txt')) {
        throw new Exception('File does not exist.');
    }
} catch (Exception \$e) {
    echo 'Error: ' . \$e->getMessage();
}
            </code></pre>";
            break;

        case '10':
            echo "<h3>Security Best Practices in Web Development</h3>";
            echo "<p>Security is a critical aspect of web development. Some best practices include:</p>";
            echo "<ul>
                    <li>Always sanitize and validate user input to prevent SQL injection and XSS attacks.</li>
                    <li>Use prepared statements and parameterized queries when interacting with databases.</li>
                    <li>Always use HTTPS to encrypt data transmitted between the server and client.</li>
                    <li>Hash sensitive data like passwords using secure hashing algorithms (e.g., bcrypt).</li>
                    <li>Implement session security, such as regenerating session IDs and setting proper session timeouts.</li>
                  </ul>";
            break;
    }
}
?>
