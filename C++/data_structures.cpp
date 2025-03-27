#include <iostream>
#include <vector>
#include <list>
#include <stack>
#include <queue>
#include <map>
#include <set>

using namespace std;

int main() {

    // 1. **Arrays**: Fixed-size containers for storing elements of the same data type.
    cout << "Array Example: " << endl;
    int arr[5] = {10, 20, 30, 40, 50}; // Array of integers
    for (int i = 0; i < 5; i++) {
        cout << "arr[" << i << "] = " << arr[i] << endl;  // Accessing array elements by index
    }

    // 2. **Vectors**: Dynamic arrays that can grow in size.
    cout << "\nVector Example: " << endl;
    vector<int> vec = {1, 2, 3, 4, 5};  // Initializing a vector
    vec.push_back(6);  // Adding an element to the end of the vector
    vec.push_back(7);  // Adding another element to the vector
    
    for (int i = 0; i < vec.size(); i++) {
        cout << "vec[" << i << "] = " << vec[i] << endl;  // Accessing vector elements
    }

    // 3. **Linked Lists**: A linear data structure where elements (nodes) are linked using pointers.
    cout << "\nLinked List Example: " << endl;
    list<int> l;  // Creating a linked list of integers
    l.push_back(10);  // Adding element at the end
    l.push_back(20);  // Adding another element
    l.push_front(5);  // Adding element at the beginning
    
    for (int num : l) {  // Iterating through a linked list
        cout << "Linked List element: " << num << endl;
    }

    // 4. **Stacks**: LIFO (Last In First Out) data structure.
    cout << "\nStack Example: " << endl;
    stack<int> st;  // Creating a stack of integers
    st.push(1);  // Pushing elements onto the stack
    st.push(2);
    st.push(3);
    
    while (!st.empty()) {  // Stack is not empty
        cout << "Stack top element: " << st.top() << endl;  // Accessing the top element
        st.pop();  // Popping the top element
    }

    // 5. **Queues**: FIFO (First In First Out) data structure.
    cout << "\nQueue Example: " << endl;
    queue<int> q;  // Creating a queue of integers
    q.push(1);  // Enqueueing elements
    q.push(2);
    q.push(3);
    
    while (!q.empty()) {  // Queue is not empty
        cout << "Queue front element: " << q.front() << endl;  // Accessing the front element
        q.pop();  // Dequeueing the front element
    }

    // 6. **Maps (HashMap in C++)**: A collection of key-value pairs.
    cout << "\nMap Example: " << endl;
    map<string, int> m;  // Creating a map of string (key) and int (value)
    m["Alice"] = 25;  // Inserting elements
    m["Bob"] = 30;
    m["Charlie"] = 35;
    
    for (const auto& pair : m) {  // Iterating through a map
        cout << "Name: " << pair.first << ", Age: " << pair.second << endl;
    }

    // 7. **Sets**: A collection of unique elements.
    cout << "\nSet Example: " << endl;
    set<int> s;  // Creating a set of integers
    s.insert(10);  // Inserting elements
    s.insert(20);
    s.insert(10);  // Duplicate will not be inserted (sets store unique elements)
    s.insert(30);
    
    for (int num : s) {  // Iterating through a set
        cout << "Set element: " << num << endl;
    }

    // 8. **Multiset**: A set that allows duplicate elements.
    cout << "\nMultiset Example: " << endl;
    multiset<int> ms;  // Creating a multiset of integers
    ms.insert(10);  // Inserting elements (duplicates allowed)
    ms.insert(20);
    ms.insert(10);  // Inserting a duplicate value
    ms.insert(30);
    
    for (int num : ms) {  // Iterating through a multiset
        cout << "Multiset element: " << num << endl;
    }

    // 9. **Unordered Map**: A hash table-based implementation of key-value pairs (unordered).
    cout << "\nUnordered Map Example: " << endl;
    unordered_map<string, int> um;  // Creating an unordered map
    um["Dave"] = 40;  // Inserting elements
    um["Eve"] = 45;
    um["Frank"] = 50;
    
    for (const auto& pair : um) {  // Iterating through an unordered map
        cout << "Name: " << pair.first << ", Age: " << pair.second << endl;
    }

    // 10. **Priority Queue (Max Heap / Min Heap)**: A queue that stores elements based on priority.
    cout << "\nPriority Queue Example (Max Heap): " << endl;
    priority_queue<int> pq;  // Creating a max-heap priority queue
    pq.push(5);  // Inserting elements
    pq.push(10);
    pq.push(3);
    pq.push(7);
    
    while (!pq.empty()) {  // Priority queue is not empty
        cout << "Priority Queue element: " << pq.top() << endl;  // Accessing the top element
        pq.pop();  // Removing the top element
    }

    // 11. **Deque (Double Ended Queue)**: A sequence container that allows fast insertion/removal from both ends.
    cout << "\nDeque Example: " << endl;
    deque<int> dq;  // Creating a deque of integers
    dq.push_back(1);  // Inserting elements at the back
    dq.push_front(0);  // Inserting element at the front
    dq.push_back(2);
    
    for (int num : dq) {  // Iterating through a deque
        cout << "Deque element: " << num << endl;
    }

    return 0;  // End of the program
}
