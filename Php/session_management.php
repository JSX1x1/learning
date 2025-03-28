<?php
// session_management.php

// 1. Start a Session
session_start(); // Always call session_start() at the beginning of the file

// 2. Secure Session Configuration
// Set session cookie parameters to enhance security
session_set_cookie_params([
    'lifetime' => 3600, // Session expires in 1 hour
    'path' => '/',
    'domain' => 'yourdomain.com',
    'secure' => true, // Only sent over HTTPS
    'httponly' => true, // Not accessible via JavaScript
    'samesite' => 'Strict', // Strict SameSite for cross-site request security
]);

// Regenerate session ID to prevent session fixation
session_regenerate_id(true); // Regenerate the session ID on each request

// 3. Store Session Data
// Store user information in the session
$_SESSION['user_id'] = $user_id; // Store user ID
$_SESSION['username'] = $username; // Store username
$_SESSION['role'] = $role; // Store user role (e.g., 'admin')

// 4. Access Session Data
// Retrieve user data from the session
$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'];
$role = $_SESSION['role'];

// 5. Check Session Validity
// Ensure the session is valid and the user is logged in
if (!isset($_SESSION['user_id'])) {
    die("Session expired or user not logged in");
}

// 6. Session Timeout
// Expire session after a certain period of inactivity
$timeout_duration = 1800; // 30 minutes of inactivity
if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $timeout_duration)) {
    session_unset(); // Clear session data
    session_destroy(); // Destroy session
    die("Session expired due to inactivity");
}
$_SESSION['last_activity'] = time(); // Update last activity timestamp

// 7. Destroy Session
// Log out user and destroy session data
session_unset(); // Remove session variables
session_destroy(); // Destroy the session

// 8. Set Flash Messages (for one-time notifications)
$_SESSION['flash_message'] = "Welcome back, $username!"; // Set flash message
echo $_SESSION['flash_message']; // Display flash message
unset($_SESSION['flash_message']); // Unset it after displaying

// 9. Prevent Session Hijacking (Check for IP and User Agent)
if ($_SESSION['user_ip'] !== $_SERVER['REMOTE_ADDR'] || $_SESSION['user_agent'] !== $_SERVER['HTTP_USER_AGENT']) {
    session_unset();
    session_destroy();
    die("Session hijacking attempt detected");
}

// Store user IP and User Agent on login
$_SESSION['user_ip'] = $_SERVER['REMOTE_ADDR'];
$_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];

// 10. Use Session in Multiple Pages
// Use sessions across multiple pages by starting session on each page
// Example of checking if user is logged in on a different page
session_start();
if (isset($_SESSION['user_id'])) {
    echo "User ID: " . $_SESSION['user_id'];
} else {
    echo "User not logged in.";
}

// 11. Secure Session Management - Close Sessions
// Ensure to close sessions properly to avoid session fixation vulnerabilities
session_write_close(); // Allows other scripts to read/write session data while the current script continues to run

// 12. Prevent Session Fixation (via Regeneration of Session ID)
if (!isset($_SESSION['user_id'])) {
    session_regenerate_id(true); // Regenerate session ID to prevent session fixation
    $_SESSION['user_id'] = $user_id; // Store user ID after session ID regeneration
}

?>
