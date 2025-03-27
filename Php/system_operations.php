<?php
// System Operations Learning Script in PHP

// Define lessons related to system operations
$lessons = [
    '1' => 'Introduction to System Operations in PHP',
    '2' => 'Working with File Systems (Reading, Writing, Deleting Files)',
    '3' => 'Executing System Commands from PHP',
    '4' => 'Managing Processes in PHP',
    '5' => 'Working with Directories in PHP',
    '6' => 'Handling Permissions in PHP',
    '7' => 'Logging System Operations in PHP',
    '8' => 'Getting System Information in PHP',
    '9' => 'Creating System-Specific PHP Scripts',
    '10' => 'Security Considerations for System Operations'
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
    echo "<h1>Welcome to the System Operations Learning System</h1>";
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
            echo "<h3>Introduction to System Operations in PHP</h3>";
            echo "<p>System operations involve interacting with the underlying operating system, including file management, executing system commands, handling permissions, and getting system-related information. PHP provides a set of functions that allow developers to interact with the file system, execute shell commands, and retrieve system data.</p>";
            echo "<p>Some key topics covered in this course:</p>";
            echo "<ul>
                    <li>Working with file systems (creating, reading, deleting files).</li>
                    <li>Executing system commands via PHP.</li>
                    <li>Managing processes and handling permissions.</li>
                    <li>Logging system operations and events.</li>
                    <li>Retrieving system information and interacting with hardware.</li>
                    <li>Security considerations for executing system operations.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Working with File Systems (Reading, Writing, Deleting Files)</h3>";
            echo "<p>PHP provides functions to interact with the file system, such as reading files, writing data, and deleting files. This allows developers to perform a variety of file operations.</p>";
            echo "<p>Example: Reading a file in PHP:</p>";
            echo "<pre><code>
if (\$file = fopen('example.txt', 'r')) {
    while (\$line = fgets(\$file)) {
        echo \$line . '<br>';
    }
    fclose(\$file);
} else {
    echo 'Failed to open the file.';
}
            </code></pre>";
            echo "<p>Example: Writing to a file in PHP:</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'w');
if (\$file) {
    fwrite(\$file, 'Hello, world!');
    fclose(\$file);
    echo 'File written successfully.';
} else {
    echo 'Failed to open the file for writing.';
}
            </code></pre>";
            echo "<p>Example: Deleting a file in PHP:</p>";
            echo "<pre><code>
if (unlink('example.txt')) {
    echo 'File deleted successfully.';
} else {
    echo 'Failed to delete the file.';
}
            </code></pre>";
            break;

        case '3':
            echo "<h3>Executing System Commands from PHP</h3>";
            echo "<p>PHP allows you to execute system commands using functions like <strong>shell_exec()</strong>, <strong>exec()</strong>, and <strong>system()</strong>.</p>";
            echo "<p>Example: Executing a system command with <strong>shell_exec()</strong>:</p>";
            echo "<pre><code>
\$output = shell_exec('ls -l'); // List directory contents in Linux
echo '<pre>' . \$output . '</pre>';
            </code></pre>";
            echo "<p>Example: Executing a command and getting the output using <strong>exec()</strong>:</p>";
            echo "<pre><code>
exec('ls -l', \$output);
foreach (\$output as \$line) {
    echo \$line . '<br>';
}
            </code></pre>";
            break;

        case '4':
            echo "<h3>Managing Processes in PHP</h3>";
            echo "<p>In PHP, you can manage processes such as starting and stopping system processes using functions like <strong>proc_open()</strong> and <strong>exec()</strong>.</p>";
            echo "<p>Example: Starting a new process:</p>";
            echo "<pre><code>
\$process = proc_open('php -r \"echo \\\"Hello, World!\\\";\"', [], \$pipes);
if (is_resource(\$process)) {
    echo 'Process started successfully.';
    fclose(\$pipes[0]);
    fclose(\$pipes[1]);
    fclose(\$pipes[2]);
    proc_close(\$process);
} else {
    echo 'Failed to start the process.';
}
            </code></pre>";
            break;

        case '5':
            echo "<h3>Working with Directories in PHP</h3>";
            echo "<p>PHP provides several functions for working with directories, including creating directories, reading directories, and removing directories.</p>";
            echo "<p>Example: Creating a directory:</p>";
            echo "<pre><code>
if (!is_dir('new_directory')) {
    mkdir('new_directory');
    echo 'Directory created.';
} else {
    echo 'Directory already exists.';
}
            </code></pre>";
            echo "<p>Example: Reading files from a directory:</p>";
            echo "<pre><code>
if (\$handle = opendir('.')) {
    while (false !== (\$entry = readdir(\$handle))) {
        echo \$entry . '<br>';
    }
    closedir(\$handle);
}
            </code></pre>";
            break;

        case '6':
            echo "<h3>Handling Permissions in PHP</h3>";
            echo "<p>PHP allows you to change file and directory permissions using the <strong>chmod()</strong> function.</p>";
            echo "<p>Example: Changing the permission of a file:</p>";
            echo "<pre><code>
if (chmod('example.txt', 0755)) {
    echo 'Permissions changed successfully.';
} else {
    echo 'Failed to change permissions.';
}
            </code></pre>";
            break;

        case '7':
            echo "<h3>Logging System Operations in PHP</h3>";
            echo "<p>PHP allows you to log system operations or errors using functions like <strong>error_log()</strong> and <strong>file_put_contents()</strong>.</p>";
            echo "<p>Example: Logging to a file:</p>";
            echo "<pre><code>
\$log_message = 'This is a log entry';
file_put_contents('log.txt', \$log_message . PHP_EOL, FILE_APPEND);
echo 'Log entry added.';
            </code></pre>";
            echo "<p>Example: Logging PHP errors:</p>";
            echo "<pre><code>
error_log('This is an error message', 3, 'errors.log');
echo 'Error logged.';
            </code></pre>";
            break;

        case '8':
            echo "<h3>Getting System Information in PHP</h3>";
            echo "<p>PHP provides functions to retrieve system information such as the operating system, PHP version, and server details.</p>";
            echo "<p>Example: Getting PHP version:</p>";
            echo "<pre><code>
echo 'PHP Version: ' . phpversion();
            </code></pre>";
            echo "<p>Example: Getting operating system details:</p>";
            echo "<pre><code>
echo 'Operating System: ' . PHP_OS;
            </code></pre>";
            break;

        case '9':
            echo "<h3>Creating System-Specific PHP Scripts</h3>";
            echo "<p>In some cases, you may need to create PHP scripts that interact with specific systems or environments. For example, handling file paths that are system-dependent or executing commands for specific OSs.</p>";
            echo "<p>Example: Handling system-specific file paths:</p>";
            echo "<pre><code>
if (PHP_OS == 'Linux') {
    \$file_path = '/home/user/file.txt';
} else {
    \$file_path = 'C:\\Users\\User\\file.txt';
}
echo 'File Path: ' . \$file_path;
            </code></pre>";
            break;

        case '10':
            echo "<h3>Security Considerations for System Operations</h3>";
            echo "<p>When interacting with the system from PHP, it's important to follow security best practices to prevent unauthorized access and protect the system. This includes validating and sanitizing user inputs, restricting user permissions, and avoiding shell injection attacks.</p>";
            echo "<ul>
                    <li>Never directly pass user input to system commands.</li>
                    <li>Use <strong>escapeshellcmd()</strong> to escape special characters in shell commands.</li>
                    <li>Ensure that PHP files do not expose sensitive system information.</li>
                    <li>Limit file and directory permissions to prevent unauthorized access.</li>
                    <li>Log and monitor system operations to detect malicious activity.</li>
                  </ul>";
            break;
    }
}
?>
