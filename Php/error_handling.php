<?php
// Error Handling Learning Script in PHP

// Define lessons related to error handling
$lessons = [
    '1' => 'Introduction to Error Handling in PHP',
    '2' => 'Understanding PHP Error Types',
    '3' => 'Basic Error Handling with try-catch',
    '4' => 'Using Custom Error Handlers',
    '5' => 'Error Reporting in PHP',
    '6' => 'Handling Errors in Functions and Methods',
    '7' => 'Using Assertions in PHP',
    '8' => 'Logging Errors in PHP',
    '9' => 'Handling Errors in Production Environments',
    '10' => 'Best Practices for Error Handling in PHP'
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
    echo "<h1>Welcome to the PHP Error Handling Learning System</h1>";
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
            echo "<h3>Introduction to Error Handling in PHP</h3>";
            echo "<p>Error handling is an essential part of programming that helps developers identify and resolve issues efficiently. In PHP, error handling allows you to control how errors are reported and how the program responds to them.</p>";
            echo "<p>There are multiple types of errors in PHP, including syntax errors, runtime errors, and logical errors. PHP provides various methods to handle these errors gracefully, ensuring your application remains functional even when issues arise.</p>";
            break;

        case '2':
            echo "<h3>Understanding PHP Error Types</h3>";
            echo "<p>In PHP, there are several types of errors, each with its own characteristics:</p>";
            echo "<ul>
                    <li><strong>Parse Errors (Syntax Errors)</strong>: Occur when PHP encounters incorrect syntax. These errors are detected before the script is executed.</li>
                    <li><strong>Fatal Errors</strong>: Occur when PHP encounters an operation that it cannot continue, such as calling an undefined function or class.</li>
                    <li><strong>Warning Errors</strong>: These are non-fatal errors, often indicating that something went wrong but the script continues executing (e.g., file not found).</li>
                    <li><strong>Notice Errors</strong>: Informative messages that indicate potentially problematic code, such as using an undefined variable.</li>
                  </ul>";
            echo "<p>Example of each type of error:</p>";
            echo "<pre><code>
// Parse Error (Syntax)
echo 'Hello World';

// Fatal Error
nonExistentFunction();

// Warning Error
file_get_contents('non_existent_file.txt');

// Notice Error
echo \$undefinedVariable;
            </code></pre>";
            break;

        case '3':
            echo "<h3>Basic Error Handling with try-catch</h3>";
            echo "<p>The <strong>try-catch</strong> block is the primary way to handle errors in PHP. It allows you to attempt to execute a block of code and catch exceptions if they are thrown.</p>";
            echo "<p>Example: Using try-catch to handle an exception:</p>";
            echo "<pre><code>
try {
    // Code that might throw an exception
    if (rand(1, 10) > 5) {
        throw new Exception('Random exception occurred!');
    }
    echo 'No exceptions!';
} catch (Exception \$e) {
    echo 'Caught exception: ' . \$e->getMessage();
}
            </code></pre>";
            break;

        case '4':
            echo "<h3>Using Custom Error Handlers</h3>";
            echo "<p>You can create custom error handlers in PHP using the <strong>set_error_handler()</strong> function. This allows you to handle errors in a way that fits your application’s needs.</p>";
            echo "<p>Example: Custom error handler:</p>";
            echo "<pre><code>
function customErrorHandler(\$errno, \$errstr, \$errfile, \$errline) {
    echo \"Error [$errno]: \$errstr in \$errfile on line \$errline<br>\";
    // You can log the error to a file or database as needed
}

set_error_handler('customErrorHandler');

// Trigger an error
echo \$undefinedVariable;
            </code></pre>";
            break;

        case '5':
            echo "<h3>Error Reporting in PHP</h3>";
            echo "<p>PHP provides different levels of error reporting. You can configure how much detail you want to see in error messages. The <strong>error_reporting()</strong> function is used to set the level of error reporting.</p>";
            echo "<p>Common error reporting levels:</p>";
            echo "<ul>
                    <li><strong>E_ERROR</strong>: Fatal run-time errors.</li>
                    <li><strong>E_WARNING</strong>: Non-fatal run-time errors.</li>
                    <li><strong>E_NOTICE</strong>: Notices that do not necessarily indicate a problem.</li>
                    <li><strong>E_ALL</strong>: All errors and warnings.</li>
                  </ul>";
            echo "<p>Example of configuring error reporting:</p>";
            echo "<pre><code>
// Show all errors and warnings
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Show only fatal errors
error_reporting(E_ERROR);
ini_set('display_errors', 0);
            </code></pre>";
            break;

        case '6':
            echo "<h3>Handling Errors in Functions and Methods</h3>";
            echo "<p>When working with functions and methods, it is important to handle errors that may arise inside them. This can be done by throwing exceptions within functions or methods.</p>";
            echo "<p>Example: Handling errors within a function:</p>";
            echo "<pre><code>
function divide(\$a, \$b) {
    if (\$b == 0) {
        throw new Exception('Division by zero!');
    }
    return \$a / \$b;
}

try {
    echo divide(10, 2);  // Valid
    echo divide(10, 0);  // Invalid
} catch (Exception \$e) {
    echo 'Caught exception: ' . \$e->getMessage();
}
            </code></pre>";
            break;

        case '7':
            echo "<h3>Using Assertions in PHP</h3>";
            echo "<p>Assertions are used to test if a certain condition holds true during the execution of your program. If the condition is false, an error is triggered. This is a helpful debugging tool.</p>";
            echo "<p>Example: Using assertions:</p>";
            echo "<pre><code>
// Enable assertions
assert_options(ASSERT_ACTIVE, 1);
assert_options(ASSERT_BAIL, 1);  // Stop on failed assertion

assert(1 == 2, 'This will fail and stop the script');
            </code></pre>";
            break;

        case '8':
            echo "<h3>Logging Errors in PHP</h3>";
            echo "<p>Instead of displaying errors to users, it is often better to log them for later review. This can be done by configuring PHP’s <strong>error_log()</strong> function to send errors to a file or an external service.</p>";
            echo "<p>Example: Logging errors:</p>";
            echo "<pre><code>
// Set up error logging
ini_set('log_errors', 1);
ini_set('error_log', '/path/to/error.log');

// Trigger an error
file_get_contents('non_existent_file.txt');
            </code></pre>";
            break;

        case '9':
            echo "<h3>Handling Errors in Production Environments</h3>";
            echo "<p>In a production environment, you want to handle errors quietly and securely. It's important to log errors but not display them to users. Here’s how you can configure PHP for a production environment:</p>";
            echo "<p>Example: Configuring error handling for production:</p>";
            echo "<pre><code>
// Disable displaying errors to users
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', '/path/to/production_error.log');
error_reporting(E_ALL);
            </code></pre>";
            break;

        case '10':
            echo "<h3>Best Practices for Error Handling in PHP</h3>";
            echo "<p>Some best practices for handling errors in PHP include:</p>";
            echo "<ul>
                    <li>Always handle errors gracefully, with informative messages for debugging but not exposing sensitive information.</li>
                    <li>Use try-catch blocks to catch exceptions and prevent script termination.</li>
                    <li>Log errors for future reference and debugging.</li>
                    <li>Use assertions for development and debugging, but disable them in production environments.</li>
                    <li>Follow proper error handling strategies to avoid security issues and ensure stability.</li>
                  </ul>";
            break;
    }
}
?>
