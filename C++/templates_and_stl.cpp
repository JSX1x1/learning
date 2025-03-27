#include <iostream>
#include <vector>
#include <list>
#include <map>
#include <set>
#include <stack>
#include <queue>
#include <algorithm>  // For STL algorithms
#include <iterator>   // For iterators

using namespace std;

// --- SECTION 1: Function Templates ---
template <typename T>
T add(T a, T b) {
    return a + b;
}

template <typename T>
T multiply(T a, T b) {
    return a * b;
}

void functionTemplatesDemo() {
    cout << "--- SECTION 1: Function Templates ---" << endl;
    int intResult = add(5, 3);    // Uses the add function for integers
    double doubleResult = add(3.5, 2.5);  // Uses the add function for doubles
    
    cout << "Sum of integers: " << intResult << endl;
    cout << "Sum of doubles: " << doubleResult << endl;

    int intMulResult = multiply(4, 6);    // Uses the multiply function for integers
    double doubleMulResult = multiply(1.5, 2.0);  // Uses the multiply function for doubles
    
    cout << "Product of integers: " << intMulResult << endl;
    cout << "Product of doubles: " << doubleMulResult << endl;
    cout << endl;
}

// --- SECTION 2: Class Templates ---
template <typename T>
class Box {
private:
    T value;

public:
    Box(T value) : value(value) {}

    T getValue() {
        return value;
    }

    void setValue(T value) {
        this->value = value;
    }
};

void classTemplatesDemo() {
    cout << "--- SECTION 2: Class Templates ---" << endl;
    Box<int> intBox(10);
    cout << "Box with int value: " << intBox.getValue() << endl;

    Box<string> stringBox("Hello Templates");
    cout << "Box with string value: " << stringBox.getValue() << endl;

    intBox.setValue(20);
    cout << "Updated int box value: " << intBox.getValue() << endl;
    cout << endl;
}

// --- SECTION 3: Template Specialization ---
// Template specialization allows defining a different implementation of a template for a specific type.

template <typename T>
class Printer {
public:
    void print(T data) {
        cout << "Generic print: " << data << endl;
    }
};

// Template specialization for type `char*` (C-string)
template <>
class Printer<char*> {
public:
    void print(char* data) {
        cout << "Specialized print for C-strings: " << data << endl;
    }
};

void templateSpecializationDemo() {
    cout << "--- SECTION 3: Template Specialization ---" << endl;
    Printer<int> intPrinter;
    intPrinter.print(100);

    Printer<char*> stringPrinter;
    stringPrinter.print("Hello, specialized templates!");

    cout << endl;
}

// --- SECTION 4: STL Containers ---
// This section demonstrates the most common containers in STL: vector, list, set, map, stack, and queue.

void stlContainersDemo() {
    cout << "--- SECTION 4: STL Containers ---" << endl;

    // Vector (Dynamic array)
    vector<int> vec = {1, 2, 3, 4, 5};
    cout << "Vector: ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << endl;

    // List (Doubly linked list)
    list<int> lst = {10, 20, 30, 40, 50};
    cout << "List: ";
    for (int num : lst) {
        cout << num << " ";
    }
    cout << endl;

    // Set (Unique sorted elements)
    set<int> st = {3, 1, 4, 1, 5, 9};
    cout << "Set (sorted, no duplicates): ";
    for (int num : st) {
        cout << num << " ";
    }
    cout << endl;

    // Map (Key-Value pairs)
    map<string, int> m;
    m["apple"] = 3;
    m["banana"] = 2;
    m["cherry"] = 5;
    cout << "Map (key-value pairs): ";
    for (const auto& pair : m) {
        cout << pair.first << ": " << pair.second << " ";
    }
    cout << endl;

    // Stack (LIFO)
    stack<int> stk;
    stk.push(1);
    stk.push(2);
    stk.push(3);
    cout << "Stack (LIFO order): ";
    while (!stk.empty()) {
        cout << stk.top() << " ";
        stk.pop();
    }
    cout << endl;

    // Queue (FIFO)
    queue<int> q;
    q.push(10);
    q.push(20);
    q.push(30);
    cout << "Queue (FIFO order): ";
    while (!q.empty()) {
        cout << q.front() << " ";
        q.pop();
    }
    cout << endl;

    cout << endl;
}

// --- SECTION 5: STL Algorithms ---
// This section demonstrates using STL algorithms such as `sort`, `find`, `reverse`, and `for_each`.

void stlAlgorithmsDemo() {
    cout << "--- SECTION 5: STL Algorithms ---" << endl;

    vector<int> vec = {5, 3, 8, 1, 2};

    // Sorting the vector
    sort(vec.begin(), vec.end());
    cout << "Sorted vector: ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << endl;

    // Finding an element
    auto it = find(vec.begin(), vec.end(), 3);
    if (it != vec.end()) {
        cout << "Found 3 in the vector!" << endl;
    } else {
        cout << "3 not found in the vector!" << endl;
    }

    // Reversing the vector
    reverse(vec.begin(), vec.end());
    cout << "Reversed vector: ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << endl;

    // Using for_each to apply a function to each element
    cout << "Applying for_each to print elements: ";
    for_each(vec.begin(), vec.end(), [](int num) { cout << num << " "; });
    cout << endl;

    cout << endl;
}

// --- SECTION 6: Iterators ---
// This section demonstrates the use of iterators in STL containers.

void iteratorsDemo() {
    cout << "--- SECTION 6: Iterators ---" << endl;

    vector<int> vec = {1, 2, 3, 4, 5};

    cout << "Using iterators to print vector elements: ";
    for (vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
        cout << *it << " ";
    }
    cout << endl;

    // Using auto keyword to simplify iterator type
    cout << "Using auto keyword with iterators: ";
    for (auto it = vec.begin(); it != vec.end(); ++it) {
        cout << *it << " ";
    }
    cout << endl;

    cout << endl;
}

// --- MAIN FUNCTION ---

int main() {
    // Section 1: Function Templates
    functionTemplatesDemo();

    // Section 2: Class Templates
    classTemplatesDemo();

    // Section 3: Template Specialization
    templateSpecializationDemo();

    // Section 4: STL Containers
    stlContainersDemo();

    // Section 5: STL Algorithms
    stlAlgorithmsDemo();

    // Section 6: Iterators
    iteratorsDemo();

    return 0;
}
