#include <iostream>
#include <typeinfo>  // For typeid and type_info
#include <stdexcept> // For exceptions like invalid_argument
using namespace std;

// --- SECTION 1: Introduction to Type Safety ---

// Type safety ensures that variables are used according to their type
// and prevents type errors at compile-time or run-time.

void introductionToTypeSafety() {
    cout << "--- SECTION 1: Introduction to Type Safety ---" << endl;
    int num = 10; // Type-safe: num is of type int
    double pi = 3.14; // Type-safe: pi is of type double

    // Uncommenting the following line will cause a compile-time error:
    // num = pi; // Cannot assign a double to an int without explicit conversion
    cout << "Type Safety is about ensuring variables are used with correct types." << endl;
    cout << "num: " << num << ", pi: " << pi << endl;
    cout << endl;
}

// --- SECTION 2: Implicit Type Conversions (Type Coercion) ---

// Implicit type conversion happens automatically in certain situations,
// where the compiler converts one type to another (i.e., smaller types to larger types).

void implicitTypeConversion() {
    cout << "--- SECTION 2: Implicit Type Conversions ---" << endl;

    int a = 5;
    double b = 2.5;
    double result = a + b;  // Implicit conversion: a (int) is converted to double
    cout << "Result of implicit conversion: " << result << endl; // Output: 7.5
    cout << "Type of result: " << typeid(result).name() << endl;

    cout << "a: " << a << ", b: " << b << ", result: " << result << endl;
    cout << endl;
}

// --- SECTION 3: Explicit Type Conversion (Type Casting) ---

// Type casting is the process of converting one type to another explicitly.

void explicitTypeConversion() {
    cout << "--- SECTION 3: Explicit Type Conversion (Type Casting) ---" << endl;

    double x = 5.75;
    int y = static_cast<int>(x);  // Explicit conversion: double to int

    cout << "x (double): " << x << ", y (int): " << y << endl;
    cout << "Type of x: " << typeid(x).name() << ", Type of y: " << typeid(y).name() << endl;
    cout << "Result of explicit cast: " << y << endl;
    cout << endl;
}

// --- SECTION 4: C-style Casting vs. C++ Casting ---

// C++ provides four casting operators: static_cast, dynamic_cast, const_cast, reinterpret_cast.
// These provide better type safety compared to the traditional C-style cast.

void cStyleCastingVsCppCasting() {
    cout << "--- SECTION 4: C-style Casting vs. C++ Casting ---" << endl;

    // C-style cast
    double pi = 3.14159;
    int piInt = (int)pi;  // C-style cast: double to int

    // C++ static_cast
    double pi2 = 3.14159;
    int piInt2 = static_cast<int>(pi2);  // C++ style cast: double to int

    cout << "C-style cast: " << piInt << endl;
    cout << "C++ static_cast: " << piInt2 << endl;

    // Static cast does the same as C-style cast but provides better safety.
    cout << endl;
}

// --- SECTION 5: const_cast ---

// const_cast allows you to modify a constant object (i.e., remove the const qualifier).
// It should be used carefully, as changing a constant object is undefined behavior if done incorrectly.

void constCastExample() {
    cout << "--- SECTION 5: const_cast ---" << endl;

    const int constNum = 10;
    int* ptr = const_cast<int*>(&constNum);  // Remove const qualifier

    // Modifying a const object through const_cast is dangerous:
    *ptr = 20; // Modifying a constant value may lead to undefined behavior

    cout << "Original constNum: " << constNum << " (may have been modified)" << endl;
    cout << "Modified value: " << *ptr << endl;
    cout << endl;
}

// --- SECTION 6: dynamic_cast (Used with Polymorphism) ---

// dynamic_cast is used to safely convert pointers/references of base class type to derived class type in case of polymorphism.

class Base {
public:
    virtual void show() { cout << "Base class" << endl; }
};

class Derived : public Base {
public:
    void show() override { cout << "Derived class" << endl; }
};

void dynamicCastExample() {
    cout << "--- SECTION 6: dynamic_cast ---" << endl;

    Base* basePtr = new Derived();
    Derived* derivedPtr = dynamic_cast<Derived*>(basePtr); // Safe conversion

    if (derivedPtr) {
        derivedPtr->show();  // Calls Derived class show()
    } else {
        cout << "Failed to cast Base to Derived" << endl;
    }

    delete basePtr;
    cout << endl;
}

// --- SECTION 7: reinterpret_cast (Dangerous Cast) ---

// reinterpret_cast is used for low-level casting. It forces the compiler to reinterpret the bit pattern of an object.
void reinterpretCastExample() {
    cout << "--- SECTION 7: reinterpret_cast ---" << endl;

    int num = 42;
    char* ptr = reinterpret_cast<char*>(&num); // Reinterpreting the address of num as a char*

    cout << "Original num: " << num << endl;
    cout << "Reinterpreted as char*: " << *ptr << endl; // May print unexpected output as we are casting raw memory

    cout << endl;
}

// --- SECTION 8: Type Information (typeid and type_info) ---

// You can use typeid to get information about the type of an expression.
void typeInformationExample() {
    cout << "--- SECTION 8: Type Information ---" << endl;

    int num = 42;
    double pi = 3.14159;
    
    // Using typeid to get type information
    cout << "Type of num: " << typeid(num).name() << endl;
    cout << "Type of pi: " << typeid(pi).name() << endl;

    // Typeid with references or pointers
    int* ptr = &num;
    cout << "Type of ptr: " << typeid(ptr).name() << endl;

    cout << endl;
}

// --- SECTION 9: Type Safety in Templates ---

// Templates provide type safety at compile-time, ensuring that only the correct types are used.
template <typename T>
T add(T a, T b) {
    return a + b;
}

void templateTypeSafety() {
    cout << "--- SECTION 9: Type Safety in Templates ---" << endl;

    int intResult = add(10, 20);   // Works for integers
    double doubleResult = add(3.14, 2.71);  // Works for doubles

    cout << "Sum of integers: " << intResult << endl;
    cout << "Sum of doubles: " << doubleResult << endl;

    // Uncommenting the following line will cause a compile-time error:
    // string result = add(10, "Hello");  // Incompatible types

    cout << endl;
}

// --- MAIN FUNCTION ---

int main() {
    // Section 1: Introduction to Type Safety
    introductionToTypeSafety();

    // Section 2: Implicit Type Conversion
    implicitTypeConversion();

    // Section 3: Explicit Type Conversion
    explicitTypeConversion();

    // Section 4: C-style Casting vs. C++ Casting
    cStyleCastingVsCppCasting();

    // Section 5: const_cast
    constCastExample();

    // Section 6: dynamic_cast
    dynamicCastExample();

    // Section 7: reinterpret_cast
    reinterpretCastExample();

    // Section 8: Type Information (typeid and type_info)
    typeInformationExample();

    // Section 9: Type Safety in Templates
    templateTypeSafety();

    return 0;
}
