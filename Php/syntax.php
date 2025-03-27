<?php
// ---------------------------------
// Introduction to PHP Syntax
// ---------------------------------

// Displaying text
echo "Hello, World!<br>"; // Simple output

// PHP tags
// PHP code goes between <?php and ?>

// ---------------------------------
// Variables and Data Types
// ---------------------------------

// Declaring variables
$name = "John";          // String
$age = 30;               // Integer
$height = 5.9;           // Float
$is_student = false;     // Boolean

// Display variable values
echo "Name: $name <br>";
echo "Age: $age <br>";
echo "Height: $height <br>";
echo "Is Student: " . ($is_student ? "Yes" : "No") . "<br>"; // Ternary operator

// ---------------------------------
// Constants
// ---------------------------------

define("PI", 3.14159);  // Defining a constant
echo "Value of PI: " . PI . "<br>";

// ---------------------------------
// Operators
// ---------------------------------

// Arithmetic Operators
$num1 = 10;
$num2 = 5;

echo "Addition: " . ($num1 + $num2) . "<br>";
echo "Subtraction: " . ($num1 - $num2) . "<br>";
echo "Multiplication: " . ($num1 * $num2) . "<br>";
echo "Division: " . ($num1 / $num2) . "<br>";
echo "Modulus: " . ($num1 % $num2) . "<br>";

// Comparison Operators
echo "Is equal: " . ($num1 == $num2 ? "True" : "False") . "<br>";
echo "Is not equal: " . ($num1 != $num2 ? "True" : "False") . "<br>";
echo "Is greater than: " . ($num1 > $num2 ? "True" : "False") . "<br>";
echo "Is less than: " . ($num1 < $num2 ? "True" : "False") . "<br>";

// Logical Operators
$flag1 = true;
$flag2 = false;

echo "AND: " . ($flag1 && $flag2 ? "True" : "False") . "<br>";
echo "OR: " . ($flag1 || $flag2 ? "True" : "False") . "<br>";

// ---------------------------------
// Conditional Statements
// ---------------------------------

// If, Else, Elseif
if ($age >= 18) {
    echo "You are an adult.<br>";
} elseif ($age >= 13) {
    echo "You are a teenager.<br>";
} else {
    echo "You are a child.<br>";
}

// Switch statement
switch ($age) {
    case 30:
        echo "You are 30 years old.<br>";
        break;
    case 20:
        echo "You are 20 years old.<br>";
        break;
    default:
        echo "Your age is unknown.<br>";
}

// ---------------------------------
// Loops
// ---------------------------------

// For loop
echo "For Loop: ";
for ($i = 1; $i <= 5; $i++) {
    echo $i . " ";
}
echo "<br>";

// While loop
echo "While Loop: ";
$i = 1;
while ($i <= 5) {
    echo $i . " ";
    $i++;
}
echo "<br>";

// Do-While loop
echo "Do-While Loop: ";
$i = 1;
do {
    echo $i . " ";
    $i++;
} while ($i <= 5);
echo "<br>";

// Foreach loop (for arrays)
$colors = array("Red", "Green", "Blue");
echo "Colors: ";
foreach ($colors as $color) {
    echo $color . " ";
}
echo "<br>";

// ---------------------------------
// Functions
// ---------------------------------

// Simple function
function greet($name) {
    return "Hello, " . $name . "!";
}

echo greet("Alice") . "<br>";

// Function with default argument
function say_hello($name = "Guest") {
    return "Hello, " . $name . "!";
}

echo say_hello() . "<br>"; // Uses default argument
echo say_hello("Bob") . "<br>"; // Custom argument

// ---------------------------------
// Arrays
// ---------------------------------

// Indexed array
$fruits = array("Apple", "Banana", "Cherry");
echo "First fruit: " . $fruits[0] . "<br>";

// Associative array
$person = array("name" => "Alice", "age" => 25, "city" => "New York");
echo "Name: " . $person['name'] . "<br>";
echo "Age: " . $person['age'] . "<br>";
echo "City: " . $person['city'] . "<br>";

// Multidimensional array
$users = array(
    array("name" => "John", "age" => 30),
    array("name" => "Alice", "age" => 25)
);
echo "First user: " . $users[0]['name'] . " - Age: " . $users[0]['age'] . "<br>";

// ---------------------------------
// Superglobals
// ---------------------------------

// $_GET example
// Assume a URL like: yoursite.com?name=John&age=30
if (isset($_GET['name']) && isset($_GET['age'])) {
    echo "GET Name: " . $_GET['name'] . "<br>";
    echo "GET Age: " . $_GET['age'] . "<br>";
}

// $_POST example (for form handling)
// This can be demonstrated with an HTML form

// ---------------------------------
// File Handling
// ---------------------------------

// Reading a file (ensure 'test.txt' file exists)
$file = fopen("test.txt", "r");
if ($file) {
    $contents = fread($file, filesize("test.txt"));
    echo "File Contents: " . $contents . "<br>";
    fclose($file);
} else {
    echo "Unable to open the file.<br>";
}

// Writing to a file
$file = fopen("output.txt", "w");
if ($file) {
    fwrite($file, "Hello, this is a test file!");
    fclose($file);
    echo "Data written to file.<br>";
} else {
    echo "Unable to open the file for writing.<br>";
}

// ---------------------------------
// Object-Oriented PHP
// ---------------------------------

// Creating a simple class
class Car {
    public $make;
    public $model;

    // Constructor
    function __construct($make, $model) {
        $this->make = $make;
        $this->model = $model;
    }

    // Method
    function displayInfo() {
        echo "Car make: " . $this->make . ", Model: " . $this->model . "<br>";
    }
}

// Creating an object
$car1 = new Car("Toyota", "Corolla");
$car1->displayInfo();

// ---------------------------------
// Error Handling
// ---------------------------------

// Simple error handling with try-catch
try {
    if ($age < 18) {
        throw new Exception("You must be at least 18 years old.");
    }
    echo "Age is valid.<br>";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

?>