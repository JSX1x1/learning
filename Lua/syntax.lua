-- syntax.lua

-- Introduction message
print("Welcome to Lua Syntax Basics!")
print("This script will guide you through the basics of Lua syntax.\n")

-- 1. Variables and Data Types
print("1. Variables and Data Types:")

-- Numbers and Strings
local number = 42
local name = "Lua"
local isActive = true
local emptyValue = nil

-- Displaying them
print("Number: " .. number)  -- Concatenating a string with a number
print("String: " .. name)
print("Boolean: " .. tostring(isActive))  -- 'tostring' converts boolean to string
print("Nil value: " .. tostring(emptyValue))  -- 'nil' is used to represent 'no value'

print("\n")

-- 2. Operators
print("2. Operators:")

local x, y = 5, 10

-- Arithmetic operators
print("Addition: " .. (x + y))
print("Subtraction: " .. (x - y))
print("Multiplication: " .. (x * y))
print("Division: " .. (x / y))

-- Relational operators
print("x == y: " .. tostring(x == y))  -- False
print("x ~= y: " .. tostring(x ~= y))  -- True
print("x > y: " .. tostring(x > y))   -- False
print("x < y: " .. tostring(x < y))   -- True

-- Logical operators
print("x > 3 and y < 15: " .. tostring(x > 3 and y < 15))  -- True
print("x > 3 or y < 5: " .. tostring(x > 3 or y < 5))      -- True

print("\n")

-- 3. Control Structures
print("3. Control Structures:")

-- If-Else
if x < y then
    print("x is less than y")
else
    print("x is greater than or equal to y")
end

-- While loop
local i = 1
print("\nWhile loop:")
while i <= 3 do
    print("Iteration " .. i)
    i = i + 1
end

-- For loop
print("\nFor loop:")
for i = 1, 3 do
    print("Iteration " .. i)
end

-- Repeat-Until loop
print("\nRepeat-Until loop:")
local count = 1
repeat
    print("Repeat count: " .. count)
    count = count + 1
until count > 3

print("\n")

-- 4. Functions
print("4. Functions:")

-- Defining a function
local function greet(name)
    return "Hello, " .. name .. "!"
end

print(greet("Lua"))

-- Functions with default arguments
local function add(a, b)
    return a + b
end

print("Sum of 5 and 3: " .. add(5, 3))

-- Anonymous functions
local square = function(n)
    return n * n
end

print("Square of 4: " .. square(4))

print("\n")

-- 5. Tables (Arrays and Dictionaries)
print("5. Tables:")

-- Arrays (List)
local fruits = {"apple", "banana", "cherry"}

-- Accessing array elements
print("First fruit: " .. fruits[1])  -- Arrays are 1-indexed in Lua

-- Dictionaries (Key-Value pairs)
local person = {name = "John", age = 30}

-- Accessing dictionary values
print("Person's name: " .. person.name)
print("Person's age: " .. person.age)

-- Adding new key-value pair
person.city = "New York"
print("Person's city: " .. person.city)

print("\n")

-- 6. Comments
print("6. Comments:")

-- This is a single-line comment

--[[
This is a
multi-line comment
]]

print("Check out the comments above!")

print("\n")
print("End of Lua Syntax Basics. Keep exploring Lua!")