#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <sys/stat.h>   // For checking if file exists
#include <vector>        // For using vectors with files

using namespace std;

// --- SECTION 1: Basic File Operations ---
// This section demonstrates basic file reading and writing operations.

// Writing to a file
void writeFile() {
    cout << "--- SECTION 1: Writing to a File ---" << endl;

    ofstream outFile("output.txt");  // Open the file for writing (creates file if doesn't exist)
    
    if (outFile.is_open()) {
        outFile << "Hello, this is a test file!\n";
        outFile << "File I/O operations in C++ are easy to implement.\n";
        outFile << "This file demonstrates basic file writing." << endl;
        outFile.close();  // Close the file after writing
        cout << "Data has been written to 'output.txt'." << endl;
    } else {
        cerr << "Error opening file for writing!" << endl;
    }
    cout << endl;
}

// Reading from a file (line by line)
void readFileLineByLine() {
    cout << "--- SECTION 2: Reading from a File ---" << endl;

    ifstream inFile("output.txt");  // Open the file for reading
    if (inFile.is_open()) {
        string line;
        while (getline(inFile, line)) {
            cout << line << endl;  // Print each line of the file
        }
        inFile.close();  // Close the file after reading
    } else {
        cerr << "Error opening file for reading!" << endl;
    }
    cout << endl;
}

// Reading from a file (character by character)
void readFileCharacterByCharacter() {
    cout << "--- SECTION 3: Reading Character by Character ---" << endl;

    ifstream inFile("output.txt");  // Open the file for reading
    if (inFile.is_open()) {
        char ch;
        while (inFile.get(ch)) {  // Read each character
            cout << ch;  // Print the character
        }
        inFile.close();  // Close the file after reading
    } else {
        cerr << "Error opening file for reading!" << endl;
    }
    cout << endl;
}

// --- SECTION 2: Binary File Operations ---
// This section demonstrates reading and writing binary files.

// Writing to a binary file
void writeBinaryFile() {
    cout << "--- SECTION 4: Writing to a Binary File ---" << endl;

    ofstream outFile("binary_output.dat", ios::binary);  // Open a file in binary mode
    if (outFile.is_open()) {
        int data[] = {10, 20, 30, 40, 50};  // Sample data to write
        outFile.write(reinterpret_cast<char*>(data), sizeof(data));  // Write raw data (binary)
        outFile.close();
        cout << "Binary data has been written to 'binary_output.dat'." << endl;
    } else {
        cerr << "Error opening binary file for writing!" << endl;
    }
    cout << endl;
}

// Reading from a binary file
void readBinaryFile() {
    cout << "--- SECTION 5: Reading from a Binary File ---" << endl;

    ifstream inFile("binary_output.dat", ios::binary);  // Open file in binary mode
    if (inFile.is_open()) {
        int data[5];  // Array to store the data read
        inFile.read(reinterpret_cast<char*>(data), sizeof(data));  // Read raw binary data
        for (int i = 0; i < 5; i++) {
            cout << "Data[" << i << "]: " << data[i] << endl;  // Print the binary data
        }
        inFile.close();
    } else {
        cerr << "Error opening binary file for reading!" << endl;
    }
    cout << endl;
}

// --- SECTION 3: File Position and Seeking ---
// This section demonstrates how to manipulate the position of the file pointer.

void filePointerOperations() {
    cout << "--- SECTION 6: File Pointer Operations ---" << endl;

    ofstream outFile("seek_example.txt");  // Open the file to write
    outFile << "C++ is powerful.\n";
    outFile << "File handling in C++ is versatile.\n";
    outFile << "You can seek to specific positions in a file." << endl;
    outFile.close();

    ifstream inFile("seek_example.txt");  // Open the file to read
    if (inFile.is_open()) {
        string word;
        
        // Seek to the beginning of the file
        inFile.seekg(0, ios::beg);
        inFile >> word;  // Read the first word
        cout << "First word: " << word << endl;
        
        // Seek to a specific position (10 bytes from the beginning)
        inFile.seekg(10, ios::beg);
        inFile >> word;
        cout << "Word at position 10: " << word << endl;

        // Seek to the end of the file
        inFile.seekg(0, ios::end);
        cout << "At the end of the file: " << inFile.tellg() << " bytes" << endl;

        inFile.close();
    } else {
        cerr << "Error opening file for reading!" << endl;
    }
    cout << endl;
}

// --- SECTION 4: Error Handling with Files ---
// This section demonstrates file error handling.

void fileErrorHandling() {
    cout << "--- SECTION 7: Error Handling with Files ---" << endl;

    ifstream inFile("non_existent_file.txt");  // Try to open a non-existent file
    if (!inFile) {
        cerr << "Error: The file 'non_existent_file.txt' does not exist!" << endl;
    } else {
        cout << "File opened successfully!" << endl;
        inFile.close();
    }
    cout << endl;
}

// --- SECTION 5: File Existence Check ---
// This section demonstrates how to check if a file exists.

void checkIfFileExists() {
    cout << "--- SECTION 8: Checking File Existence ---" << endl;

    struct stat buffer;
    const char* fileName = "output.txt";
    if (stat(fileName, &buffer) == 0) {
        cout << "The file '" << fileName << "' exists!" << endl;
    } else {
        cout << "The file '" << fileName << "' does not exist!" << endl;
    }
    cout << endl;
}

// --- SECTION 6: File Streams with StringStream ---
// This section demonstrates using `stringstream` for file operations (useful for text processing).

void stringStreamOperations() {
    cout << "--- SECTION 9: StringStream Operations ---" << endl;

    stringstream ss;  // Create a stringstream object

    ss << "This is an example of stringstream in C++.\n";
    ss << "We can read and write to stringstreams like files.";

    string content = ss.str();  // Convert stringstream to a string
    cout << "Content in stringstream:\n" << content << endl;

    // Example of reading from a stringstream like file reading
    ss.str(content);  // Reset the stringstream with content
    string word;
    while (ss >> word) {
        cout << "Word: " << word << endl;  // Print each word
    }
    cout << endl;
}

// --- MAIN FUNCTION ---

int main() {
    // Section 1: Writing to a File
    writeFile();

    // Section 2: Reading from a File
    readFileLineByLine();
    readFileCharacterByCharacter();

    // Section 3: Binary File Operations
    writeBinaryFile();
    readBinaryFile();

    // Section 4: File Pointer Operations
    filePointerOperations();

    // Section 5: Error Handling with Files
    fileErrorHandling();

    // Section 6: Checking File Existence
    checkIfFileExists();

    // Section 7: StringStream Operations
    stringStreamOperations();

    return 0;
}
