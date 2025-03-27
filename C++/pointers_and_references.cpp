#include <iostream>
using namespace std;

void demonstratePointers() {
    // Pointer declaration and initialization
    int num = 10;
    int* ptr = &num;  // Pointer to int, storing the address of num
    
    cout << "Value of num: " << num << endl;
    cout << "Address of num: " << &num << endl;  // Address of num
    cout << "Value stored at ptr (dereferencing): " << *ptr << endl;  // Dereferencing pointer to get the value
    
    // Changing value using pointer
    *ptr = 20;  // Dereferencing the pointer and changing the value of num
    
    cout << "New value of num after changing using pointer: " << num << endl;
}

void demonstratePointerArithmetic() {
    // Pointer arithmetic
    int arr[] = {1, 2, 3, 4, 5};
    int* ptr = arr;  // Pointing to the first element of the array
    
    cout << "Array elements using pointer arithmetic: ";
    for (int i = 0; i < 5; i++) {
        cout << *(ptr + i) << " ";  // Move the pointer to the next element
    }
    cout << endl;
}

void demonstrateReferences() {
    // Reference declaration and usage
    int num = 30;
    int& ref = num;  // Reference to int, ref is an alias for num
    
    cout << "Value of num: " << num << endl;
    cout << "Value through reference ref: " << ref << endl;
    
    // Changing value through reference
    ref = 40;  // This will change num as ref is an alias to num
    
    cout << "New value of num after changing using reference: " << num << endl;
}

void demonstrateConstantPointersAndReferences() {
    int num = 50;
    int num2 = 60;
    
    // Constant pointer: Pointer whose value (address) cannot be changed
    int* const ptr = &num;
    cout << "Value of num (through constant pointer): " << *ptr << endl;
    
    // Uncommenting the following line would cause a compile-time error
    // ptr = &num2;  // Error: Cannot change address of constant pointer
    
    // Constant reference: Reference whose value cannot be changed
    const int& ref = num;
    cout << "Value of num (through constant reference): " << ref << endl;
    
    // Uncommenting the following line would cause a compile-time error
    // ref = num2;  // Error: Cannot change the value of a constant reference
}

void demonstrateNullPointer() {
    int* ptr = nullptr;  // Null pointer
    
    if (ptr == nullptr) {
        cout << "Pointer is null!" << endl;
    } else {
        cout << "Pointer is not null!" << endl;
    }
}

void demonstratePointerToPointer() {
    int num = 100;
    int* ptr = &num;    // Pointer to int
    int** ptr2 = &ptr;   // Pointer to pointer (pointer to ptr)
    
    cout << "Value of num: " << num << endl;
    cout << "Value using ptr (pointer to int): " << *ptr << endl;
    cout << "Value using ptr2 (pointer to pointer): " << **ptr2 << endl;
}

int main() {
    // Demonstrating basic pointer usage
    cout << "Demonstrating Pointers:" << endl;
    demonstratePointers();
    cout << endl;

    // Demonstrating pointer arithmetic
    cout << "Demonstrating Pointer Arithmetic:" << endl;
    demonstratePointerArithmetic();
    cout << endl;

    // Demonstrating references
    cout << "Demonstrating References:" << endl;
    demonstrateReferences();
    cout << endl;

    // Demonstrating constant pointers and references
    cout << "Demonstrating Constant Pointers and References:" << endl;
    demonstrateConstantPointersAndReferences();
    cout << endl;

    // Demonstrating null pointer
    cout << "Demonstrating Null Pointer:" << endl;
    demonstrateNullPointer();
    cout << endl;

    // Demonstrating pointer to pointer
    cout << "Demonstrating Pointer to Pointer:" << endl;
    demonstratePointerToPointer();

    return 0;
}
