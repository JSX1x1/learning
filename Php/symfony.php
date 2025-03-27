<?php
// Symfony Learning Script

// Lessons array that defines all the lessons available
$lessons = [
    '1' => 'Introduction to Symfony',
    '2' => 'Installing Symfony',
    '3' => 'Symfony Project Structure',
    '4' => 'Controllers and Routing',
    '5' => 'Services and Dependency Injection',
    '6' => 'Twig Templating Engine',
    '7' => 'Forms and Validation',
    '8' => 'Doctrine ORM',
    '9' => 'Security and Authentication',
    '10' => 'Testing in Symfony',
    '11' => 'Best Practices and Advanced Features'
];

// Router: Check which lesson is selected by the user
if (isset($_GET['lesson'])) {
    $lesson = $_GET['lesson'];
    if (isset($lessons[$lesson])) {
        echo "<h2>Lesson " . $lesson . ": " . $lessons[$lesson] . "</h2>";
        showLessonContent($lesson);
    } else {
        echo "<h2>Lesson not found!</h2>";
    }
} else {
    // Display a list of all available lessons when no lesson is selected
    echo "<h1>Welcome to the Symfony Learning System</h1>";
    echo "<p>Choose a lesson to begin:</p>";
    echo "<ul>";
    foreach ($lessons as $key => $lesson) {
        echo "<li><a href='?lesson=$key'>$lesson</a></li>";
    }
    echo "</ul>";
}

// Function to display content for each lesson
function showLessonContent($lesson) {
    switch ($lesson) {
        case '1':
            echo "<h3>Introduction to Symfony</h3>";
            echo "<p>Symfony is a PHP framework designed to help developers create web applications with ease, scalability, and flexibility.</p>";
            echo "<p>It follows the MVC (Model-View-Controller) architecture and encourages best practices in development.</p>";
            echo "<p>In Symfony, you can build REST APIs, manage forms, integrate databases, authenticate users, and much more.</p>";
            break;

        case '2':
            echo "<h3>Installing Symfony</h3>";
            echo "<p>To install Symfony, you'll need Composer, which is a dependency manager for PHP.</p>";
            echo "<p>Run the following command to create a new Symfony project:</p>";
            echo "<pre><code>composer create-project symfony/skeleton my_project_name</code></pre>";
            echo "<p>This will set up a basic Symfony project. Once the installation is complete, navigate to the project directory and run the following command to start the local server:</p>";
            echo "<pre><code>php bin/console server:run</code></pre>";
            echo "<p>Now open <a href='http://localhost:8000'>http://localhost:8000</a> in your browser.</p>";
            break;

        case '3':
            echo "<h3>Symfony Project Structure</h3>";
            echo "<p>A typical Symfony project has the following structure:</p>";
            echo "<pre>
/bin
/config
/public
/src
/tests
/templates
/var
/vendor
            </pre>";
            echo "<p>Explanation of Key Directories:</p>";
            echo "<ul>
                    <li><strong>/bin</strong>: Contains the command line scripts for Symfony.</li>
                    <li><strong>/config</strong>: Holds all configuration files for routing, services, etc.</li>
                    <li><strong>/src</strong>: Contains the application code, such as controllers, services, etc.</li>
                    <li><strong>/public</strong>: The document root, where your frontend (public) files like CSS, JS, and images are placed.</li>
                    <li><strong>/var</strong>: Stores cache, logs, and other temporary files.</li>
                    <li><strong>/vendor</strong>: Third-party dependencies managed by Composer.</li>
                    </ul>";
            break;

        case '4':
            echo "<h3>Controllers and Routing</h3>";
            echo "<p>Controllers in Symfony respond to HTTP requests. A basic controller looks like this:</p>";
            echo "<pre><code>
namespace App\\Controller;

use Symfony\\Component\\HttpFoundation\\Response;

class DefaultController
{
    public function index()
    {
        return new Response('Hello Symfony!');
    }
}
            </code></pre>";
            echo "<p>To map a route to a controller action, you need to define the routing in the config (config/routes.yaml) like this:</p>";
            echo "<pre><code>
index:
    path: /
    controller: App\\Controller\\DefaultController::index
            </code></pre>";
            break;

        case '5':
            echo "<h3>Services and Dependency Injection</h3>";
            echo "<p>Services are PHP classes that are designed to do a specific task. Symfony's Dependency Injection (DI) container manages the instantiation of services.</p>";
            echo "<p>For example, let’s inject a service into a controller:</p>";
            echo "<pre><code>
namespace App\\Controller;

use App\\Service\\MyService;

class MyController
{
    private \$myService;

    public function __construct(MyService \$myService)
    {
        \$this->myService = \$myService;
    }

    public function index()
    {
        return new Response(\$this->myService->getMessage());
    }
}
            </code></pre>";
            break;

        case '6':
            echo "<h3>Twig Templating Engine</h3>";
            echo "<p>Symfony uses Twig as its templating engine. It allows you to separate logic from presentation.</p>";
            echo "<p>Here is a simple example of a Twig template:</p>";
            echo "<pre><code>
<h1>{{ title }}</h1>
<p>{{ content }}</p>
            </code></pre>";
            echo "<p>In the controller, you render this template like this:</p>";
            echo "<pre><code>
return \$this->render('default/index.html.twig', [
    'title' => 'Symfony is Awesome',
    'content' => 'Learn Symfony with ease!'
]);
            </code></pre>";
            break;

        case '7':
            echo "<h3>Forms and Validation</h3>";
            echo "<p>Symfony provides a powerful form component for building forms and validating data.</p>";
            echo "<p>Here’s an example of a form type:</p>";
            echo "<pre><code>
namespace App\\Form;

use Symfony\\Component\\Form\\AbstractType;
use Symfony\\Component\\Form\\FormBuilderInterface;
use Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface \$builder, array \$options)
    {
        \$builder->add('name', TextType::class);
    }
}
            </code></pre>";
            echo "<p>And in your controller, you can handle the form like this:</p>";
            echo "<pre><code>
public function contact(Request \$request)
{
    \$form = \$this->createForm(ContactType::class);
    \$form->handleRequest(\$request);

    if (\$form->isSubmitted() && \$form->isValid()) {
        // Process form data
    }

    return \$this->render('contact.html.twig', ['form' => \$form->createView()]);
}
            </code></pre>";
            break;

        case '8':
            echo "<h3>Doctrine ORM</h3>";
            echo "<p>Doctrine is the default ORM (Object-Relational Mapping) tool for Symfony, allowing you to interact with databases easily.</p>";
            echo "<p>To use Doctrine, you must first configure the database connection in <strong>config/packages/doctrine.yaml</strong>.</p>";
            echo "<p>Here’s an example of an entity:</p>";
            echo "<pre><code>
namespace App\\Entity;

use Doctrine\\ORM\\Mapping as ORM;

/**
 * @ORM\\Entity
 */
class Product
{
    /**
     * @ORM\\Id
     * @ORM\\GeneratedValue
     * @ORM\\Column(type=\"integer\")
     */
    private \$id;

    /**
     * @ORM\\Column(type=\"string\")
     */
    private \$name;

    // Getter and setter methods...
}
            </code></pre>";
            break;

        case '9':
            echo "<h3>Security and Authentication</h3>";
            echo "<p>Symfony provides robust security features to authenticate users and manage access control.</p>";
            echo "<p>To configure authentication, you need to set up firewalls and access control in <strong>config/packages/security.yaml</strong>.</p>";
            break;

        case '10':
            echo "<h3>Testing in Symfony</h3>";
            echo "<p>Symfony integrates PHPUnit for writing unit and functional tests. You can test controllers, forms, and services using Symfony’s testing framework.</p>";
            break;

        case '11':
            echo "<h3>Best Practices and Advanced Features</h3>";
            echo "<p>Some best practices include using Dependency Injection, following SOLID principles, and testing your code thoroughly.</p>";
            break;
    }
}
?>
