#include <iostream>  // This is necessary for input/output functions (cout, cin)
#include <string>    // Necessary to work with strings

using namespace std;  // Using the standard namespace to avoid writing std:: before cout, cin, etc.

// Main function: The entry point of every C++ program
int main() {

    // 1. **Declaring Variables and Data Types**

    int integerVar = 10;             // Integer data type (stores whole numbers)
    double doubleVar = 3.14;         // Double data type (stores floating-point numbers)
    char charVar = 'A';              // Character data type (stores a single character)
    string stringVar = "Hello!";     // String data type (stores a sequence of characters)
    bool boolVar = true;             // Boolean data type (stores either true or false)

    // 2. **Displaying Output using cout**
    // This prints the value of the variables to the console

    cout << "Integer Value: " << integerVar << endl;   // Prints the integer value
    cout << "Double Value: " << doubleVar << endl;     // Prints the double value
    cout << "Character Value: " << charVar << endl;    // Prints the character value
    cout << "String Value: " << stringVar << endl;     // Prints the string value
    cout << "Boolean Value: " << boolVar << endl;      // Prints the boolean value

    // 3. **Taking User Input using cin**
    // You can get input from the user using cin and store it in variables

    cout << "Enter an integer: ";
    int userInput;  // Declaring a variable to store the user's input
    cin >> userInput;  // Taking the input and storing it in 'userInput'
    cout << "You entered: " << userInput << endl;  // Display the user's input

    // 4. **Basic Arithmetic Operators**
    // C++ supports standard arithmetic operations like addition, subtraction, multiplication, etc.

    int a = 5, b = 3;  // Declaring two integer variables
    cout << "Addition: " << a + b << endl;        // Prints the sum of 'a' and 'b'
    cout << "Subtraction: " << a - b << endl;     // Prints the difference between 'a' and 'b'
    cout << "Multiplication: " << a * b << endl;  // Prints the product of 'a' and 'b'
    cout << "Division: " << a / b << endl;        // Prints the quotient of 'a' divided by 'b'
    cout << "Modulo (remainder): " << a % b << endl;  // Prints the remainder when 'a' is divided by 'b'

    // 5. **Constant Variables**
    // Constants are variables whose values cannot be changed once they are set.

    const float PI = 3.14159;  // Declaring a constant variable (value cannot be modified)
    cout << "Value of PI: " << PI << endl;  // Prints the value of the constant

    // 6. **String Concatenation**
    // You can concatenate strings using the '+' operator

    string firstName = "John";
    string lastName = "Doe";
    string fullName = firstName + " " + lastName;  // Concatenating first name and last name
    cout << "Full Name: " << fullName << endl;  // Prints the full name

    // 7. **Escaping Special Characters**
    // Some characters like quotes or backslashes need to be escaped with a backslash (\)

    cout << "This is a \"quoted\" text." << endl;   // Prints: This is a "quoted" text.
    cout << "This is a backslash: \\" << endl;       // Prints: This is a backslash: \

    // 8. **Null Terminator in Strings**
    // C++ strings are null-terminated (i.e., they end with the '\0' character, but you don't need to worry about this in most cases)

    char charArray[] = "Hello";  // Declaring a character array (C-string)
    cout << "C-string: " << charArray << endl;  // Prints the C-string

    // 9. **Size of Data Types**
    // You can find the size (in bytes) of a variable or data type using the sizeof() operator

    cout << "Size of int: " << sizeof(int) << " bytes" << endl;     // Prints size of int
    cout << "Size of double: " << sizeof(double) << " bytes" << endl; // Prints size of double
    cout << "Size of char: " << sizeof(char) << " bytes" << endl;     // Prints size of char
    cout << "Size of string: " << sizeof(string) << " bytes" << endl; // Prints size of string class (implementation-dependent)

    return 0;  // End of the program
}
