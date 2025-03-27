-- typesafety_and_datatypes.lua

-- Introduction message
print("Welcome to Type Safety and Data Types in Lua!")
print("This script will teach you about Lua's data types and type safety mechanisms.\n")

-- 1. Basic Data Types
print("1. Basic Data Types:")

-- Numbers (Lua uses float for both integers and floating point numbers)
local number = 42
local floatNumber = 3.14

print("Number: " .. number)  -- integer representation
print("Float Number: " .. floatNumber)  -- floating point representation

-- Strings
local str = "Hello, Lua!"
print("String: " .. str)

-- Booleans
local isActive = true
local isComplete = false
print("Boolean: " .. tostring(isActive))  -- true/false values

-- Nil
local emptyValue = nil
print("Nil: " .. tostring(emptyValue))  -- Represents no value

print("\n")

-- 2. Tables (Arrays and Dictionaries)
print("2. Tables (Arrays and Dictionaries):")

-- Arrays (Lists)
local fruits = {"apple", "banana", "cherry"}
print("First fruit: " .. fruits[1])  -- Arrays are 1-indexed in Lua

-- Dictionaries (Key-Value pairs)
local person = {name = "John", age = 30}
print("Person's name: " .. person.name)
print("Person's age: " .. person.age)

-- Modifying the table (adding new key-value pair)
person.city = "New York"
print("Person's city: " .. person.city)

-- Nested tables (Table inside a table)
local student = {
    name = "Alice",
    subjects = {"Math", "Science", "History"}
}
print("Student's first subject: " .. student.subjects[1])

print("\n")

-- 3. Type Checking and Type Safety
print("3. Type Checking and Type Safety:")

-- Checking the type of a variable
local x = 10
local y = "Hello"
local z = {}

print("Type of x: " .. type(x))  -- number
print("Type of y: " .. type(y))  -- string
print("Type of z: " .. type(z))  -- table

-- Checking for specific types using type()
print("Is x a number? " .. tostring(type(x) == "number"))  -- true
print("Is y a string? " .. tostring(type(y) == "string"))  -- true
print("Is z a table? " .. tostring(type(z) == "table"))  -- true

-- Lua's type coercion (automatic type conversion)
local num = 10
local strNum = "20"
local sum = num + tonumber(strNum)  -- Using tonumber to convert string to number
print("Sum (with type coercion): " .. sum)  -- Output will be 30

-- Coercion fails if the string cannot be converted to a number
local invalidNum = "hello"
local result = tonumber(invalidNum)  -- This will return nil because "hello" is not a number
print("Coercion of 'hello' to number: " .. tostring(result))  -- nil

-- 4. Type Errors
print("4. Type Errors:")

-- Attempting to perform an operation on incompatible types
local a = 5
local b = "Lua"
-- Uncommenting this will cause a type error: 
-- print(a + b)  -- Error: attempt to perform arithmetic on a number and a string

-- Lua allows flexible operations but does not support certain mismatched operations directly.
-- To avoid errors, always ensure correct types when performing operations.

print("\n")

-- 5. Type Safety in Tables
print("5. Type Safety in Tables:")

-- Storing mixed types in tables
local mixedTable = {10, "hello", true, nil, 3.14}
print("Mixed table contents:")
for index, value in ipairs(mixedTable) do
    print("Index: " .. index .. ", Value: " .. tostring(value))
end

-- Mixed types inside a table
local userInfo = {
    id = 101,
    name = "Alice",
    isAdmin = true
}

-- Using type checking within the table
if type(userInfo.isAdmin) == "boolean" then
    print("User's admin status: " .. tostring(userInfo.isAdmin))
end

print("\n")

-- 6. Type Coercion with Booleans
print("6. Type Coercion with Booleans:")

-- Implicit conversion to boolean in conditions
local value = 0
if value then
    print("Non-zero values are true in Lua!")
else
    print("Zero is considered false in Lua.")
end

local str = ""
if str then
    print("Non-empty strings are true in Lua!")
else
    print("Empty strings are considered false in Lua.")
end

print("\n")

-- 7. Metatables and Type Handling
print("7. Metatables and Type Handling:")

-- Metatable example: Changing behavior of tables
local mt = {
    __index = function(table, key)
        return "Value not found!"
    end
}

local t = setmetatable({}, mt)
print("Accessing an undefined field in the table: " .. t.undefinedField)

-- Metatables for type coercion (operations between types)
local number1 = { value = 10 }
local number2 = { value = 20 }

local mt_add = {
    __add = function(a, b)
        return { value = a.value + b.value }
    end
}

setmetatable(number1, mt_add)
setmetatable(number2, mt_add)

local sumResult = number1 + number2
print("Sum using metatables: " .. sumResult.value)

print("\n")

-- Conclusion
print("End of Type Safety and Data Types in Lua! Keep exploring and experimenting with Lua's powerful type system!")
