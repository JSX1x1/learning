<?php
// Object-Oriented Programming (OOP) Learning Script in PHP

// Define lessons related to OOP
$lessons = [
    '1' => 'Introduction to Object-Oriented Programming (OOP)',
    '2' => 'Creating Classes and Objects',
    '3' => 'Properties and Methods in Classes',
    '4' => 'Constructors and Destructors',
    '5' => 'Inheritance in OOP',
    '6' => 'Polymorphism in OOP',
    '7' => 'Interfaces in PHP',
    '8' => 'Traits in PHP',
    '9' => 'Access Modifiers in PHP',
    '10' => 'Namespaces in PHP',
    '11' => 'Best Practices for OOP in PHP'
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
    echo "<h1>Welcome to the PHP Object-Oriented Programming (OOP) Learning System</h1>";
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
            echo "<h3>Introduction to Object-Oriented Programming (OOP)</h3>";
            echo "<p>Object-Oriented Programming (OOP) is a programming paradigm that uses objects and classes to structure software in a way that is easy to manage and scale. OOP helps to improve code reusability, readability, and maintainability.</p>";
            echo "<p>Key OOP concepts:</p>";
            echo "<ul>
                    <li><strong>Classes and Objects</strong>: Define the blueprint and instances of objects.</li>
                    <li><strong>Encapsulation</strong>: Bundling data and methods together and controlling access with access modifiers.</li>
                    <li><strong>Inheritance</strong>: A mechanism to inherit properties and methods from another class.</li>
                    <li><strong>Polymorphism</strong>: The ability to take different forms, typically by overriding methods.</li>
                    <li><strong>Abstraction</strong>: Hiding complex implementation details and exposing only essential parts.</li>
                  </ul>";
            break;

        case '2':
            echo "<h3>Creating Classes and Objects</h3>";
            echo "<p>A class is a blueprint for creating objects, while an object is an instance of a class. Here's how to create a class and an object in PHP:</p>";
            echo "<pre><code>
class Car {
    // Properties
    public \$make;
    public \$model;

    // Method
    public function startEngine() {
        echo 'Engine started!';
    }
}

// Create an object (instance) of the Car class
\$car = new Car();
\$car->make = 'Toyota';
\$car->model = 'Corolla';
echo 'Car Make: ' . \$car->make . ', Model: ' . \$car->model;
\$car->startEngine();
            </code></pre>";
            break;

        case '3':
            echo "<h3>Properties and Methods in Classes</h3>";
            echo "<p>Properties represent data or attributes of the object, and methods define behaviors or actions the object can perform.</p>";
            echo "<p>Example of a class with properties and methods:</p>";
            echo "<pre><code>
class Animal {
    public \$name;
    public \$type;

    public function __construct(\$name, \$type) {
        \$this->name = \$name;
        \$this->type = \$type;
    }

    public function describe() {
        echo 'This is a ' . \$this->type . ' called ' . \$this->name;
    }
}

\$dog = new Animal('Buddy', 'dog');
\$dog->describe();
            </code></pre>";
            break;

        case '4':
            echo "<h3>Constructors and Destructors</h3>";
            echo "<p>Constructors are special methods that get called when an object is instantiated. Destructors are called when an object is destroyed.</p>";
            echo "<p>Example of constructors and destructors:</p>";
            echo "<pre><code>
class User {
    public \$name;

    // Constructor
    public function __construct(\$name) {
        \$this->name = \$name;
        echo 'User ' . \$this->name . ' created.<br>';
    }

    // Destructor
    public function __destruct() {
        echo 'User ' . \$this->name . ' destroyed.<br>';
    }
}

\$user = new User('John Doe');
unset(\$user); // Destructor is called when object is destroyed
            </code></pre>";
            break;

        case '5':
            echo "<h3>Inheritance in OOP</h3>";
            echo "<p>Inheritance allows a class to inherit properties and methods from another class. This helps reduce code duplication and promotes reusability.</p>";
            echo "<p>Example of inheritance in PHP:</p>";
            echo "<pre><code>
class Animal {
    public function speak() {
        echo 'Animal sound<br>';
    }
}

class Dog extends Animal {
    public function speak() {
        echo 'Bark!<br>';
    }
}

\$dog = new Dog();
\$dog->speak();  // Outputs: Bark!
            </code></pre>";
            break;

        case '6':
            echo "<h3>Polymorphism in OOP</h3>";
            echo "<p>Polymorphism allows objects to be treated as instances of their parent class, even though they may have their own methods. It enables method overriding.</p>";
            echo "<p>Example of polymorphism in PHP:</p>";
            echo "<pre><code>
class Shape {
    public function draw() {
        echo 'Drawing a shape<br>';
    }
}

class Circle extends Shape {
    public function draw() {
        echo 'Drawing a circle<br>';
    }
}

\$shape = new Shape();
\$circle = new Circle();

\$shape->draw();  // Outputs: Drawing a shape
\$circle->draw();  // Outputs: Drawing a circle
            </code></pre>";
            break;

        case '7':
            echo "<h3>Interfaces in PHP</h3>";
            echo "<p>Interfaces define methods that must be implemented in a class. A class can implement multiple interfaces, promoting flexibility.</p>";
            echo "<p>Example of interfaces:</p>";
            echo "<pre><code>
interface Animal {
    public function speak();
}

class Dog implements Animal {
    public function speak() {
        echo 'Bark!<br>';
    }
}

class Cat implements Animal {
    public function speak() {
        echo 'Meow!<br>';
    }
}

\$dog = new Dog();
\$cat = new Cat();

\$dog->speak();  // Outputs: Bark!
\$cat->speak();  // Outputs: Meow!
            </code></pre>";
            break;

        case '8':
            echo "<h3>Traits in PHP</h3>";
            echo "<p>Traits allow you to reuse methods across different classes without using inheritance. This helps reduce code duplication.</p>";
            echo "<p>Example of traits:</p>";
            echo "<pre><code>
trait CanFly {
    public function fly() {
        echo 'Flying!<br>';
    }
}

class Bird {
    use CanFly;
}

\$bird = new Bird();
\$bird->fly();  // Outputs: Flying!
            </code></pre>";
            break;

        case '9':
            echo "<h3>Access Modifiers in PHP</h3>";
            echo "<p>Access modifiers control the visibility of properties and methods. There are three types of access modifiers:</p>";
            echo "<ul>
                    <li><strong>public</strong>: Accessible from anywhere.</li>
                    <li><strong>protected</strong>: Accessible only within the class and its subclasses.</li>
                    <li><strong>private</strong>: Accessible only within the class.</li>
                  </ul>";
            echo "<p>Example of access modifiers:</p>";
            echo "<pre><code>
class Person {
    public \$name;
    protected \$age;
    private \$ssn;

    public function __construct(\$name, \$age, \$ssn) {
        \$this->name = \$name;
        \$this->age = \$age;
        \$this->ssn = \$ssn;
    }

    public function getName() {
        return \$this->name;
    }

    private function getSsn() {
        return \$this->ssn;
    }
}

\$person = new Person('John', 30, '123-45-6789');
echo \$person->getName(); // Works
echo \$person->getSsn();   // Error: Cannot call private method
            </code></pre>";
            break;

        case '10':
            echo "<h3>Namespaces in PHP</h3>";
            echo "<p>Namespaces help avoid name conflicts by grouping related classes, interfaces, and functions together.</p>";
            echo "<p>Example of namespaces:</p>";
            echo "<pre><code>
namespace Animals;

class Dog {
    public function speak() {
        echo 'Woof!<br>';
    }
}

\$dog = new Dog();
\$dog->speak();  // Outputs: Woof!
            </code></pre>";
            break;

        case '11':
            echo "<h3>Best Practices for OOP in PHP</h3>";
            echo "<p>Some best practices for OOP in PHP include:</p>";
            echo "<ul>
                    <li>Use meaningful class and method names.</li>
                    <li>Encapsulate properties and methods properly (use access modifiers).</li>
                    <li>Keep classes small and focused on a single responsibility.</li>
                    <li>Use interfaces and traits for flexible and reusable code.</li>
                    <li>Follow SOLID principles for better object-oriented design.</li>
                  </ul>";
            break;
    }
}
?>
