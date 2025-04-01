// security_best_practices.js

// 1. **Input Validation**: Always validate inputs to prevent malicious data from entering your application.
function isValidEmail(email) {
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return regex.test(email);
}

console.log(isValidEmail('test@example.com')); // true
console.log(isValidEmail('test@com')); // false

// 2. **Sanitize User Inputs**: Sanitize inputs to avoid cross-site scripting (XSS) attacks.
function sanitizeInput(input) {
    return input.replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

const userInput = '<script>alert("XSS Attack")</script>';
console.log(sanitizeInput(userInput)); // &lt;script&gt;alert("XSS Attack")&lt;/script&gt;

// 3. **Use HTTPS for Secure Communication**: Always use HTTPS for secure communication between the client and server.
if (window.location.protocol !== 'https:') {
    console.log('Warning: Your connection is not secure, please use HTTPS!');
} else {
    console.log('Secure connection established.');
}

// 4. **Password Hashing**: Never store passwords in plain text. Always hash passwords before storing them.
const bcrypt = require('bcrypt');
const saltRounds = 10;
const password = 'userPassword123';

bcrypt.hash(password, saltRounds, function(err, hash) {
    if (err) throw err;
    console.log('Hashed Password:', hash);
    // Store the hashed password in your database
});

// 5. **Use Secure Cookie Attributes**: Ensure that cookies are secure, HttpOnly, and have the SameSite attribute set.
document.cookie = "username=JohnDoe; Secure; HttpOnly; SameSite=Strict";

// 6. **Authentication and Authorization**: Always verify user authentication and use role-based access control (RBAC).
function authenticateUser(username, password) {
    const user = getUserFromDatabase(username); // Assume this fetches the user from your database
    if (bcrypt.compareSync(password, user.passwordHash)) {
        return 'Authenticated';
    } else {
        return 'Authentication failed';
    }
}

// 7. **Cross-Site Request Forgery (CSRF) Protection**: Protect against CSRF by using anti-CSRF tokens.
function generateCsrfToken() {
    return Math.random().toString(36).substring(2); // This is a basic example, consider using libraries
}

const csrfToken = generateCsrfToken();
console.log('CSRF Token:', csrfToken);

// Send token along with your requests to ensure authenticity
// For example, in an AJAX request, send the token as a header:
// headers: { 'X-CSRF-Token': csrfToken }

// 8. **CORS (Cross-Origin Resource Sharing) Configuration**: Restrict CORS to allow only trusted origins to access your resources.
const allowedOrigins = ['https://trusted-domain.com'];
const origin = window.location.origin;

if (allowedOrigins.includes(origin)) {
    console.log('CORS allowed');
} else {
    console.log('CORS denied');
}

// 9. **Secure Session Management**: Ensure sessions are properly managed and expired after inactivity.
function manageSession(sessionId) {
    const sessionTimeout = 30 * 60 * 1000; // Session timeout after 30 minutes
    const lastActivity = Date.now(); // Assuming we store the timestamp of last activity

    if (Date.now() - lastActivity > sessionTimeout) {
        console.log('Session expired');
        // Redirect to login page or destroy session
    } else {
        console.log('Session active');
    }
}

// 10. **Avoid Storing Sensitive Data in LocalStorage**: LocalStorage is not secure, avoid storing sensitive data like passwords or tokens.
localStorage.setItem('username', 'user'); // Example of safe data to store
// Avoid storing sensitive data in localStorage, as it is accessible through JavaScript

// 11. **Avoid Eval()**: Do not use eval() as it allows execution of arbitrary code and can open up your app to XSS attacks.
function safeEval(code) {
    // Avoid eval, use alternatives such as JSON.parse or safe functions
    console.log("Code executed safely: ", code);
}

const code = 'console.log("Hello World")';
// Avoid using eval(code) due to security concerns

// 12. **Use Content Security Policy (CSP)**: Set up a CSP header to mitigate XSS risks and reduce the possibility of malicious code execution.
const cspHeader = "Content-Security-Policy: default-src 'self'; script-src 'self'; object-src 'none';";
console.log('CSP Header:', cspHeader);

// 13. **Security Headers**: Always set appropriate HTTP security headers such as X-Content-Type-Options and X-Frame-Options.
const headers = {
    'X-Content-Type-Options': 'nosniff',
    'X-Frame-Options': 'DENY',
    'Strict-Transport-Security': 'max-age=31536000; includeSubDomains'
};

console.log('HTTP Security Headers:', headers);

// 14. **Regular Security Audits**: Perform regular security audits to ensure your code and dependencies are secure.
function auditSecurity() {
    // Use security tools like npm audit or manual checks for vulnerabilities in dependencies
    console.log('Performing security audit...');
}

auditSecurity();
