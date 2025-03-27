<?php
// File Interaction Learning Script

// Define lessons related to file handling
$lessons = [
    '1' => 'Introduction to File Handling in PHP',
    '2' => 'Opening Files (fopen)',
    '3' => 'Reading Files (fread, fgets)',
    '4' => 'Writing to Files (fwrite)',
    '5' => 'Appending to Files (fwrite)',
    '6' => 'File Deletion (unlink)',
    '7' => 'Checking File Existence (file_exists)',
    '8' => 'Getting File Information (filesize, filetype)',
    '9' => 'Handling File Errors',
    '10' => 'File Handling Best Practices'
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
    echo "<h1>Welcome to the File Interaction Learning System</h1>";
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
            echo "<h3>Introduction to File Handling in PHP</h3>";
            echo "<p>PHP provides several functions to work with files, including opening, reading, writing, appending, and deleting files. File handling is essential when working with user uploads, logs, configuration files, and more.</p>";
            echo "<p>Some common file functions in PHP are:</p>";
            echo "<ul>
                    <li><strong>fopen()</strong> - Open a file.</li>
                    <li><strong>fread()</strong> - Read from a file.</li>
                    <li><strong>fwrite()</strong> - Write to a file.</li>
                    <li><strong>unlink()</strong> - Delete a file.</li>
                    <li><strong>file_exists()</strong> - Check if a file exists.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Opening Files (fopen)</h3>";
            echo "<p>The <strong>fopen()</strong> function is used to open a file. It requires two arguments: the filename and the mode.</p>";
            echo "<p>Here’s an example of opening a file in read mode ('r'):</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'r'); // Open file for reading
if (\$file) {
    echo 'File opened successfully.';
} else {
    echo 'Failed to open the file.';
}
            </code></pre>";
            break;

        case '3':
            echo "<h3>Reading Files (fread, fgets)</h3>";
            echo "<p>Once a file is opened, you can read its contents using <strong>fread()</strong> or <strong>fgets()</strong>.</p>";
            echo "<p>To read the entire file, you can use <strong>fread()</strong>:</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'r');
if (\$file) {
    \$contents = fread(\$file, filesize('example.txt'));
    echo \$contents;
    fclose(\$file);
}
            </code></pre>";
            echo "<p>To read the file line by line, you can use <strong>fgets()</strong>:</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'r');
while (\$line = fgets(\$file)) {
    echo \$line . '<br>';
}
fclose(\$file);
            </code></pre>";
            break;

        case '4':
            echo "<h3>Writing to Files (fwrite)</h3>";
            echo "<p>The <strong>fwrite()</strong> function is used to write data to a file. If the file doesn't exist, it will be created. The file needs to be opened in write ('w') or append ('a') mode.</p>";
            echo "<p>Here’s an example of writing data to a file:</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'w'); // Open file for writing
if (\$file) {
    fwrite(\$file, 'Hello, World!');
    fclose(\$file);
    echo 'Data written to file.';
} else {
    echo 'Failed to open the file.';
}
            </code></pre>";
            break;

        case '5':
            echo "<h3>Appending to Files (fwrite)</h3>";
            echo "<p>To add content to the end of a file without overwriting its existing content, you should open the file in append mode ('a').</p>";
            echo "<p>Here’s an example of appending data to a file:</p>";
            echo "<pre><code>
\$file = fopen('example.txt', 'a'); // Open file for appending
if (\$file) {
    fwrite(\$file, '\\nAppended content!');
    fclose(\$file);
    echo 'Data appended to file.';
} else {
    echo 'Failed to open the file.';
}
            </code></pre>";
            break;

        case '6':
            echo "<h3>File Deletion (unlink)</h3>";
            echo "<p>The <strong>unlink()</strong> function is used to delete a file. You must ensure that the file exists before attempting to delete it.</p>";
            echo "<p>Here’s an example of deleting a file:</p>";
            echo "<pre><code>
if (unlink('example.txt')) {
    echo 'File deleted successfully.';
} else {
    echo 'Failed to delete the file.';
}
            </code></pre>";
            break;

        case '7':
            echo "<h3>Checking File Existence (file_exists)</h3>";
            echo "<p>The <strong>file_exists()</strong> function checks if a file or directory exists.</p>";
            echo "<p>Here’s an example of checking whether a file exists:</p>";
            echo "<pre><code>
if (file_exists('example.txt')) {
    echo 'The file exists.';
} else {
    echo 'The file does not exist.';
}
            </code></pre>";
            break;

        case '8':
            echo "<h3>Getting File Information (filesize, filetype)</h3>";
            echo "<p>PHP provides functions like <strong>filesize()</strong> and <strong>filetype()</strong> to retrieve file information such as its size and type.</p>";
            echo "<p>Here’s an example of getting the size and type of a file:</p>";
            echo "<pre><code>
if (file_exists('example.txt')) {
    echo 'File size: ' . filesize('example.txt') . ' bytes<br>';
    echo 'File type: ' . filetype('example.txt');
} else {
    echo 'The file does not exist.';
}
            </code></pre>";
            break;

        case '9':
            echo "<h3>Handling File Errors</h3>";
            echo "<p>When working with files, errors can occur, such as trying to open a non-existent file or failing to write to a file. Always check for errors using <strong>fopen()</strong>, <strong>fwrite()</strong>, etc.</p>";
            echo "<p>Here’s an example of handling file opening errors:</p>";
            echo "<pre><code>
\$file = fopen('nonexistent_file.txt', 'r');
if (\$file === false) {
    echo 'Error: Could not open the file.';
}
            </code></pre>";
            break;

        case '10':
            echo "<h3>File Handling Best Practices</h3>";
            echo "<p>Some best practices for file handling in PHP include:</p>";
            echo "<ul>
                    <li>Always check if the file exists before opening it using <strong>file_exists()</strong>.</li>
                    <li>Use <strong>fclose()</strong> to close the file after performing operations.</li>
                    <li>Ensure you have proper permissions to read, write, or delete files.</li>
                    <li>Handle errors gracefully by checking for success or failure at each step.</li>
                  </ul>";
            break;
    }
}
?>
