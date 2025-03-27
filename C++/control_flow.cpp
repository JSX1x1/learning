#include <iostream>  // This is necessary for input/output functions (cout, cin)

using namespace std;

int main() {

    // 1. **If-Else Statements**
    // The if-else statement is used to execute certain blocks of code based on conditions.
    
    int number = 10;
    cout << "Enter a number: ";
    cin >> number;
    
    if (number > 0) {
        cout << "The number is positive." << endl;  // If number is greater than 0, it prints this message
    } else if (number < 0) {
        cout << "The number is negative." << endl;  // If number is less than 0, it prints this message
    } else {
        cout << "The number is zero." << endl;      // If number is 0, it prints this message
    }

    // 2. **Nested If-Else Statements**
    // You can also have one if-else statement inside another to check for multiple conditions.

    int age = 20;
    if (age >= 18) {
        cout << "You are an adult." << endl;
        if (age >= 65) {
            cout << "You are a senior citizen." << endl;  // Nested if to check if the person is 65 or older
        }
    } else {
        cout << "You are a minor." << endl;
    }

    // 3. **Switch Case**
    // The switch-case statement is used when you want to check a variable against multiple possible values.

    int day = 3;  // Let's assume we are checking for a day of the week
    switch (day) {
        case 1:
            cout << "Monday" << endl;
            break;  // Exits the switch block
        case 2:
            cout << "Tuesday" << endl;
            break;
        case 3:
            cout << "Wednesday" << endl;
            break;
        case 4:
            cout << "Thursday" << endl;
            break;
        case 5:
            cout << "Friday" << endl;
            break;
        case 6:
            cout << "Saturday" << endl;
            break;
        case 7:
            cout << "Sunday" << endl;
            break;
        default:
            cout << "Invalid day" << endl;  // If none of the cases match
    }

    // 4. **For Loop**
    // The for loop is typically used when you know in advance how many times you want to repeat a block of code.
    
    cout << "For loop example: " << endl;
    for (int i = 1; i <= 5; i++) {
        cout << "Iteration: " << i << endl;  // Prints the current iteration number
    }

    // 5. **While Loop**
    // The while loop is used when you want to repeat a block of code as long as a certain condition is true.
    
    int counter = 0;
    cout << "While loop example: " << endl;
    while (counter < 5) {
        cout << "Counter: " << counter << endl;
        counter++;  // Increment counter on each iteration
    }

    // 6. **Do-While Loop**
    // The do-while loop works similarly to the while loop, but it ensures that the code is executed at least once.
    
    int counter2 = 0;
    cout << "Do-while loop example: " << endl;
    do {
        cout << "Counter2: " << counter2 << endl;
        counter2++;  // Increment counter2 on each iteration
    } while (counter2 < 5);  // The loop will continue as long as counter2 is less than 5

    // 7. **Break and Continue**
    // The break statement is used to exit a loop or switch early.
    // The continue statement is used to skip the current iteration and move to the next iteration.

    // Example of break in a loop:
    cout << "Break example: " << endl;
    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            break;  // Breaks the loop when i is 5
        }
        cout << "i: " << i << endl;
    }

    // Example of continue in a loop:
    cout << "Continue example: " << endl;
    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            continue;  // Skips the iteration when i is 5
        }
        cout << "i: " << i << endl;
    }

    return 0;  // End of the program
}
