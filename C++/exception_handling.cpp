#include <iostream>
#include <stdexcept>
using namespace std;

// --- SECTION 1: Introduction to Exceptions ---

// A simple function that demonstrates throwing an exception
void throwException() {
    cout << "This function will throw an exception." << endl;
    throw runtime_error("An error has occurred!");
}

// --- SECTION 2: Try-Catch Block ---

// A function that uses try-catch to handle exceptions
void tryCatchExample() {
    try {
        cout << "Trying to throw an exception..." << endl;
        throwException();  // This will throw an exception
    } catch (const runtime_error& e) {
        cout << "Caught exception: " << e.what() << endl;  // Catching the exception
    }
}

// --- SECTION 3: Catching Different Types of Exceptions ---

// A function that demonstrates catching different exception types
void catchDifferentExceptions() {
    try {
        int choice;
        cout << "Enter 1 to throw runtime_error or 2 to throw logic_error: ";
        cin >> choice;

        if (choice == 1) {
            throw runtime_error("Runtime error occurred!");
        } else if (choice == 2) {
            throw logic_error("Logic error occurred!");
        } else {
            cout << "Invalid choice." << endl;
        }
    } catch (const runtime_error& e) {
        cout << "Caught runtime_error: " << e.what() << endl;
    } catch (const logic_error& e) {
        cout << "Caught logic_error: " << e.what() << endl;
    }
}

// --- SECTION 4: Handling Multiple Exceptions in Sequence ---

// A function that demonstrates handling multiple exceptions in sequence
void handleMultipleExceptions() {
    try {
        int num;
        cout << "Enter a number (0 to throw exception): ";
        cin >> num;

        if (num == 0) {
            throw runtime_error("Zero is not allowed!");
        } else if (num < 0) {
            throw invalid_argument("Negative numbers are not allowed!");
        }

        cout << "You entered a valid number: " << num << endl;
    } catch (const runtime_error& e) {
        cout << "Caught runtime_error: " << e.what() << endl;
    } catch (const invalid_argument& e) {
        cout << "Caught invalid_argument: " << e.what() << endl;
    }
}

// --- SECTION 5: Custom Exceptions ---

// A custom exception class derived from std::exception
class MyCustomException : public exception {
public:
    const char* what() const noexcept override {
        return "My custom exception occurred!";
    }
};

// A function that demonstrates throwing and catching a custom exception
void customExceptionHandling() {
    try {
        throw MyCustomException();  // Throw custom exception
    } catch (const MyCustomException& e) {
        cout << "Caught custom exception: " << e.what() << endl;
    }
}

// --- SECTION 6: Rethrowing Exceptions ---

// A function that demonstrates rethrowing an exception
void rethrowException() {
    try {
        try {
            throw runtime_error("An error in the inner try block");
        } catch (const runtime_error& e) {
            cout << "Caught inside inner try block: " << e.what() << endl;
            throw;  // Rethrow the exception
        }
    } catch (const runtime_error& e) {
        cout << "Caught after rethrowing: " << e.what() << endl;
    }
}

// --- SECTION 7: Exception Specification and noexcept ---

// A function that uses noexcept to indicate no exception is thrown
void noexceptExample() noexcept {
    cout << "This function guarantees no exceptions will be thrown." << endl;
}

// A function that throws an exception and does not declare noexcept
void throwsException() {
    throw runtime_error("This function throws an exception");
}

// --- SECTION 8: Exception Handling in Resource Management (RAII) ---

// A class that demonstrates the RAII (Resource Acquisition Is Initialization) principle
class FileHandler {
private:
    FILE* file;

public:
    FileHandler(const char* filename) {
        file = fopen(filename, "r");
        if (file == nullptr) {
            throw runtime_error("Unable to open file!");
        }
        cout << "File opened successfully." << endl;
    }

    ~FileHandler() {
        if (file) {
            fclose(file);
            cout << "File closed." << endl;
        }
    }
};

// A function that demonstrates resource management with exception handling
void resourceManagementWithExceptions() {
    try {
        FileHandler fileHandler("non_existent_file.txt");  // This will throw an exception
    } catch (const runtime_error& e) {
        cout << "Caught exception: " << e.what() << endl;
    }
}

// --- SECTION 9: Preventing and Fixing Exceptions ---

// A function that demonstrates an exception fix (prevention)
void preventDivideByZero() {
    try {
        int numerator, denominator;
        cout << "Enter numerator: ";
        cin >> numerator;
        cout << "Enter denominator: ";
        cin >> denominator;

        // Preventing divide by zero exception
        if (denominator == 0) {
            throw runtime_error("Cannot divide by zero!");
        }

        cout << "Result: " << numerator / denominator << endl;
    } catch (const runtime_error& e) {
        cout << "Caught exception: " << e.what() << endl;
    }
}

// --- MAIN FUNCTION ---

int main() {
    // Section 1: Introduction to Exceptions
    cout << "--- SECTION 1: Introduction to Exceptions ---" << endl;
    try {
        throwException();  // Demonstrating throwing an exception
    } catch (const exception& e) {
        cout << "Caught exception: " << e.what() << endl;
    }
    cout << endl;

    // Section 2: Try-Catch Block
    cout << "--- SECTION 2: Try-Catch Block ---" << endl;
    tryCatchExample();
    cout << endl;

    // Section 3: Catching Different Types of Exceptions
    cout << "--- SECTION 3: Catching Different Types of Exceptions ---" << endl;
    catchDifferentExceptions();
    cout << endl;

    // Section 4: Handling Multiple Exceptions in Sequence
    cout << "--- SECTION 4: Handling Multiple Exceptions in Sequence ---" << endl;
    handleMultipleExceptions();
    cout << endl;

    // Section 5: Custom Exceptions
    cout << "--- SECTION 5: Custom Exceptions ---" << endl;
    customExceptionHandling();
    cout << endl;

    // Section 6: Rethrowing Exceptions
    cout << "--- SECTION 6: Rethrowing Exceptions ---" << endl;
    rethrowException();
    cout << endl;

    // Section 7: Exception Specification and noexcept
    cout << "--- SECTION 7: Exception Specification and noexcept ---" << endl;
    try {
        noexceptExample();  // Function marked noexcept (no exceptions should be thrown)
        throwsException();  // This will throw an exception
    } catch (const exception& e) {
        cout << "Caught exception: " << e.what() << endl;
    }
    cout << endl;

    // Section 8: Exception Handling in Resource Management (RAII)
    cout << "--- SECTION 8: Exception Handling in Resource Management (RAII) ---" << endl;
    resourceManagementWithExceptions();
    cout << endl;

    // Section 9: Preventing and Fixing Exceptions
    cout << "--- SECTION 9: Preventing and Fixing Exceptions ---" << endl;
    preventDivideByZero();

    return 0;
}