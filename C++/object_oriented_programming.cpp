#include <iostream>
using namespace std;

// --- SECTION 1: Basics of Classes and Objects ---

// A simple class definition
class Car {
public:
    string brand;
    string model;
    int year;

    // Constructor to initialize Car object
    Car(string b, string m, int y) {
        brand = b;
        model = m;
        year = y;
    }

    // Member function to display car details
    void displayInfo() {
        cout << "Car Brand: " << brand << endl;
        cout << "Car Model: " << model << endl;
        cout << "Car Year: " << year << endl;
    }
};

// --- SECTION 2: Creating and Using Objects ---
void demonstrateObjectCreation() {
    // Creating an object of the Car class
    Car car1("Toyota", "Camry", 2020);
    car1.displayInfo();  // Calling the member function to display car info

    Car car2("Honda", "Civic", 2022);
    car2.displayInfo();  // Displaying another car info
}

// --- SECTION 3: Constructors and Destructors ---
class Rectangle {
private:
    int length, width;

public:
    // Constructor to initialize length and width
    Rectangle(int l, int w) {
        length = l;
        width = w;
    }

    // Destructor to display message when object is destroyed
    ~Rectangle() {
        cout << "Rectangle object destroyed!" << endl;
    }

    // Member function to calculate area
    int area() {
        return length * width;
    }

    // Member function to display rectangle's area
    void displayArea() {
        cout << "Area of Rectangle: " << area() << endl;
    }
};

void demonstrateConstructorsAndDestructors() {
    // Creating an object, constructor is called
    Rectangle rect(10, 5);
    rect.displayArea();

    // Destructor will be automatically called when rect goes out of scope
}

// --- SECTION 4: Inheritance ---
class Animal {
public:
    // Base class function
    void eat() {
        cout << "Eating food..." << endl;
    }
};

// Derived class that inherits from Animal
class Dog : public Animal {
public:
    // Additional function in the derived class
    void bark() {
        cout << "Barking..." << endl;
    }
};

void demonstrateInheritance() {
    // Creating an object of the derived class Dog
    Dog dog;
    dog.eat();  // Inherited function
    dog.bark(); // Dog-specific function
}

// --- SECTION 5: Polymorphism ---
class Shape {
public:
    // Virtual function for polymorphism
    virtual void draw() {
        cout << "Drawing a shape..." << endl;
    }
};

class Circle : public Shape {
public:
    // Overriding the draw function in the derived class
    void draw() override {
        cout << "Drawing a circle..." << endl;
    }
};

class Square : public Shape {
public:
    // Overriding the draw function in the derived class
    void draw() override {
        cout << "Drawing a square..." << endl;
    }
};

void demonstratePolymorphism() {
    // Base class pointer to derived class objects
    Shape* shape1 = new Circle();
    Shape* shape2 = new Square();

    shape1->draw();  // Calls Circle's draw() function
    shape2->draw();  // Calls Square's draw() function

    delete shape1;
    delete shape2;
}

// --- SECTION 6: Abstraction ---
class AbstractShape {
public:
    // Pure virtual function makes this class abstract
    virtual void draw() = 0;

    void display() {
        cout << "This is an abstract shape!" << endl;
    }
};

class Triangle : public AbstractShape {
public:
    // Implementing the pure virtual function
    void draw() override {
        cout << "Drawing a triangle..." << endl;
    }
};

void demonstrateAbstraction() {
    // Creating an object of the derived class (Triangle)
    AbstractShape* shape = new Triangle();
    shape->draw();
    shape->display();
    
    delete shape;
}

// --- SECTION 7: Encapsulation ---
class BankAccount {
private:
    string accountHolder;
    double balance;

public:
    // Constructor to initialize account holder and balance
    BankAccount(string name, double initialBalance) {
        accountHolder = name;
        balance = initialBalance;
    }

    // Getter function for account holder
    string getAccountHolder() {
        return accountHolder;
    }

    // Getter function for balance
    double getBalance() {
        return balance;
    }

    // Setter function to deposit money
    void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            cout << "Deposited: $" << amount << endl;
        }
    }

    // Setter function to withdraw money
    void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            cout << "Withdrawn: $" << amount << endl;
        } else {
            cout << "Insufficient funds!" << endl;
        }
    }

    // Function to display account info
    void displayAccountInfo() {
        cout << "Account Holder: " << accountHolder << endl;
        cout << "Balance: $" << balance << endl;
    }
};

void demonstrateEncapsulation() {
    // Creating an object of BankAccount
    BankAccount account("John Doe", 5000);
    account.displayAccountInfo();

    // Deposit and Withdraw operations
    account.deposit(1500);
    account.withdraw(2000);
    account.displayAccountInfo();
}

// --- SECTION 8: Operator Overloading ---
class Complex {
private:
    int real, imag;

public:
    Complex(int r, int i) : real(r), imag(i) {}

    // Overloading the '+' operator to add two complex numbers
    Complex operator + (const Complex& c) {
        return Complex(real + c.real, imag + c.imag);
    }

    void display() {
        cout << "Complex Number: " << real << " + " << imag << "i" << endl;
    }
};

void demonstrateOperatorOverloading() {
    // Creating two Complex objects
    Complex c1(3, 4);
    Complex c2(1, 2);

    // Adding complex numbers using overloaded '+' operator
    Complex result = c1 + c2;
    result.display();
}

// --- MAIN FUNCTION ---
int main() {
    // Demonstrating Classes and Objects
    cout << "--- Demonstrating Classes and Objects ---" << endl;
    demonstrateObjectCreation();
    cout << endl;

    // Demonstrating Constructors and Destructors
    cout << "--- Demonstrating Constructors and Destructors ---" << endl;
    demonstrateConstructorsAndDestructors();
    cout << endl;

    // Demonstrating Inheritance
    cout << "--- Demonstrating Inheritance ---" << endl;
    demonstrateInheritance();
    cout << endl;

    // Demonstrating Polymorphism
    cout << "--- Demonstrating Polymorphism ---" << endl;
    demonstratePolymorphism();
    cout << endl;

    // Demonstrating Abstraction
    cout << "--- Demonstrating Abstraction ---" << endl;
    demonstrateAbstraction();
    cout << endl;

    // Demonstrating Encapsulation
    cout << "--- Demonstrating Encapsulation ---" << endl;
    demonstrateEncapsulation();
    cout << endl;

    // Demonstrating Operator Overloading
    cout << "--- Demonstrating Operator Overloading ---" << endl;
    demonstrateOperatorOverloading();

    return 0;
}