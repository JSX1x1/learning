<?php
// security.php

// 1. SQL Injection Prevention
// Use Prepared Statements (PDO or MySQLi)

// PDO Example
$pdo = new PDO("mysql:host=localhost;dbname=mydb", "username", "password");
$stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
$stmt->bindParam(':email', $email);
$stmt->execute();
$result = $stmt->fetch(PDO::FETCH_ASSOC);

// MySQLi Example
$conn = new mysqli("localhost", "username", "password", "mydb");
$stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result()->fetch_assoc();

// 2. XSS (Cross-Site Scripting) Prevention
// Sanitize user input using htmlspecialchars()
echo htmlspecialchars($user_input, ENT_QUOTES, 'UTF-8');

// 3. CSRF (Cross-Site Request Forgery) Prevention
// Add a CSRF token to forms and verify it
session_start();

// Generate a token
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));

// Include the token in the form
echo '<input type="hidden" name="csrf_token" value="' . $_SESSION['csrf_token'] . '">';

// Verify the token on form submission
if ($_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die('CSRF token mismatch');
}

// 4. Password Hashing
// Use password_hash() for hashing passwords and password_verify() for verification
$password = 'user_password';
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Verify the password
if (password_verify($password, $hashed_password)) {
    echo "Password is correct";
} else {
    echo "Invalid password";
}

// 5. File Upload Security
// Check file extensions and size
$allowed_extensions = ['jpg', 'png', 'gif'];
$file_info = pathinfo($_FILES['file']['name']);
$file_extension = strtolower($file_info['extension']);

if (!in_array($file_extension, $allowed_extensions)) {
    die("Invalid file type");
}

if ($_FILES['file']['size'] > 5000000) { // 5MB limit
    die("File too large");
}

// 6. Secure Cookies
// Set cookies with secure and HttpOnly flags
setcookie("user", $user_id, [
    'expires' => time() + 3600,
    'path' => '/',
    'domain' => 'yourdomain.com',
    'secure' => true, // Only sent over HTTPS
    'httponly' => true, // Not accessible via JavaScript
]);

// 7. Session Security
// Use session_regenerate_id() to prevent session fixation
session_start();
session_regenerate_id(true);

// Set session cookie parameters to enhance security
session_set_cookie_params([
    'lifetime' => 3600,
    'path' => '/',
    'domain' => 'yourdomain.com',
    'secure' => true, // Only sent over HTTPS
    'httponly' => true, // Not accessible via JavaScript
]);

// 8. Input Validation
// Always validate and sanitize user input
$sanitized_input = filter_input(INPUT_GET, 'user_input', FILTER_SANITIZE_STRING);

// 9. HTTPS (SSL/TLS) Enforce HTTPS for secure communication
if ($_SERVER['HTTPS'] != 'on') {
    header("Location: https://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
    exit();
}

// 10. Error Handling
// Don't display errors to end-users, log them instead
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', '/path/to/error_log');

// 11. Use Strong Encryption
// AES Encryption Example
$method = "aes-256-cbc";
$key = "your-secret-key";
$iv = random_bytes(16);

// Encrypt data
$encrypted_data = openssl_encrypt("Sensitive data", $method, $key, 0, $iv);

// Decrypt data
$decrypted_data = openssl_decrypt($encrypted_data, $method, $key, 0, $iv);
?>
