<?php
// Asynchronous Programming in PHP - Learning Script

// Define lessons related to Asynchronous Programming in PHP
$lessons = [
    '1' => 'Introduction to Asynchronous Programming in PHP',
    '2' => 'Setting Up ReactPHP for Async Programming',
    '3' => 'Running Asynchronous Code in PHP',
    '4' => 'Using Promises in ReactPHP',
    '5' => 'Async with I/O Operations (File Handling)',
    '6' => 'Using ReactPHP Event Loop',
    '7' => 'Handling Multiple Asynchronous Tasks',
    '8' => 'Real-World Use Cases of Asynchronous Programming'
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
    echo "<h1>Welcome to the PHP Asynchronous Programming Learning System</h1>";
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
            echo "<h3>Introduction to Asynchronous Programming in PHP</h3>";
            echo "<p>Asynchronous programming allows you to run tasks concurrently without waiting for one to finish before starting the next. In PHP, synchronous programming means that each statement is executed one after another. With asynchronous programming, operations like reading files, network requests, or processing tasks can happen simultaneously.</p>";
            echo "<p>PHP, traditionally being synchronous, requires libraries like <strong>ReactPHP</strong> to simulate asynchronous behavior.</p>";
            echo "<p>Why use async programming?</p>";
            echo "<ul>
                    <li><strong>Non-blocking I/O:</strong> Allows your program to continue processing while waiting for input/output tasks to complete.</li>
                    <li><strong>Improved Performance:</strong> Enhances the performance of your application by running multiple operations concurrently.</li>
                    <li><strong>Efficient Resource Utilization:</strong> Makes better use of CPU and memory by allowing multiple tasks to run concurrently.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Setting Up ReactPHP for Async Programming</h3>";
            echo "<p>ReactPHP is a low-level library for event-driven programming in PHP, designed to enable asynchronous, non-blocking I/O operations. To start using ReactPHP, you need to install the package via Composer:</p>";
            echo "<pre><code>
composer require react/event-loop
composer require react/http
            </code></pre>";
            echo "<p>Once you have installed ReactPHP, you can start using its event loop to handle asynchronous tasks.</p>";
            break;

        case '3':
            echo "<h3>Running Asynchronous Code in PHP</h3>";
            echo "<p>In ReactPHP, asynchronous code is executed using an event loop. Below is an example of how to run asynchronous code in PHP:</p>";
            echo "<pre><code>
<?php
require 'vendor/autoload.php';

use React\EventLoop\Factory;

\$loop = Factory::create(); // Create a new event loop

\$loop->addTimer(2, function() {  // Add a timer (simulate async task)
    echo 'Hello after 2 seconds!\\n';
});

\$loop->run();  // Run the event loop
            </code></pre>";
            echo "<p>In the above example, we use an event loop to schedule a task that will print a message after 2 seconds. Notice how the code doesn't block the execution and continues to run the event loop until the timer triggers the callback.</p>";
            break;

        case '4':
            echo "<h3>Using Promises in ReactPHP</h3>";
            echo "<p>Promises represent the eventual completion (or failure) of an asynchronous operation and its resulting value. ReactPHP provides a <strong>Promise</strong> class that can be used to manage async tasks.</p>";
            echo "<p>Here’s an example of using a promise to simulate an asynchronous task:</p>";
            echo "<pre><code>
<?php
require 'vendor/autoload.php';

use React\Promise\Promise;

function asyncTask() {
    return new Promise(function(\$resolve, \$reject) {
        // Simulate an async operation (e.g., file reading)
        \$delay = rand(1, 3);  // Random delay between 1 to 3 seconds
        echo 'Running task...\\n';
        sleep(\$delay);

        if (\$delay > 2) {
            \$resolve('Task completed in ' . \$delay . ' seconds.');
        } else {
            \$reject('Task failed after ' . \$delay . ' seconds.');
        }
    });
}

asyncTask()->then(function(\$result) {
    echo \$result . '\\n';
}, function(\$error) {
    echo \$error . '\\n';
});
            </code></pre>";
            echo "<p>In this example, the async task will either resolve or reject based on a random delay. The <strong>then()</strong> method handles the result or error when the promise is completed.</p>";
            break;

        case '5':
            echo "<h3>Async with I/O Operations (File Handling)</h3>";
            echo "<p>Asynchronous programming is useful for I/O operations, such as reading or writing files, where you can process other tasks while waiting for I/O operations to complete.</p>";
            echo "<p>Example of async file reading with ReactPHP:</p>";
            echo "<pre><code>
<?php
require 'vendor/autoload.php';

use React\Filesystem\Filesystem;

\$loop = React\EventLoop\Factory::create();
\$fs = Filesystem::create(\$loop);

\$fs->file('example.txt')->getContents()->then(function(\$contents) {
    echo 'File content: ' . \$contents . '\\n';
}, function(\$error) {
    echo 'Error: ' . \$error . '\\n';
});

\$loop->run();  // Run the event loop
            </code></pre>";
            echo "<p>In this example, we asynchronously read the contents of a file without blocking the execution of other tasks.</p>";
            break;

        case '6':
            echo "<h3>Using ReactPHP Event Loop</h3>";
            echo "<p>The core concept of ReactPHP is the <strong>Event Loop</strong>. It waits for events to occur, like timers, I/O operations, or signals, and dispatches corresponding handlers when those events occur.</p>";
            echo "<p>Below is an example where we use the event loop to wait for multiple timers:</p>";
            echo "<pre><code>
<?php
require 'vendor/autoload.php';

use React\EventLoop\Factory;

\$loop = Factory::create();

\$loop->addTimer(1, function() { echo 'Timer 1 after 1 second\\n'; });
\$loop->addTimer(2, function() { echo 'Timer 2 after 2 seconds\\n'; });
\$loop->addTimer(3, function() { echo 'Timer 3 after 3 seconds\\n'; });

\$loop->run();  // Run the event loop
            </code></pre>";
            echo "<p>The timers run asynchronously without blocking each other, which allows the event loop to continue processing other events.</p>";
            break;

        case '7':
            echo "<h3>Handling Multiple Asynchronous Tasks</h3>";
            echo "<p>ReactPHP makes it easy to handle multiple asynchronous tasks concurrently. Here’s an example of running two async tasks at the same time:</p>";
            echo "<pre><code>
<?php
require 'vendor/autoload.php';

use React\Promise\Promise;

function asyncTask(\$task) {
    return new Promise(function(\$resolve, \$reject) use (\$task) {
        sleep(rand(1, 3));  // Simulate async task
        \$resolve(\$task . ' completed');
    });
}

Promise::all([asyncTask('Task 1'), asyncTask('Task 2')])->then(function(\$results) {
    echo implode(' and ', \$results) . '\\n';
});
            </code></pre>";
            echo "<p>In this example, we use <strong>Promise::all()</strong> to wait for both async tasks to finish and then output the results once both are complete.</p>";
            break;

        case '8':
            echo "<h3>Real-World Use Cases of Asynchronous Programming</h3>";
            echo "<p>Asynchronous programming is widely used in scenarios where non-blocking operations improve performance and responsiveness:</p>";
            echo "<ul>
                    <li><strong>Web Scraping:</strong> Fetching multiple web pages concurrently without blocking.</li>
                    <li><strong>File Uploads/Downloads:</strong> Handle file transfers without blocking user interaction.</li>
                    <li><strong>API Requests:</strong> Send multiple API requests concurrently and handle responses when all are received.</li>
                    <li><strong>Database Operations:</strong> Perform non-blocking queries and handle results asynchronously.</li>
                  </ul>";
            break;
    }
}
?>
