-- functions_and_operations.lua

-- Introduction message
print("Welcome to Functions and Operations in Lua!")
print("This script will guide you through functions and various operations in Lua.\n")

-- 1. Defining Functions
print("1. Defining Functions:")

-- Basic Function
local function greet(name)
    return "Hello, " .. name .. "!"
end

print(greet("Lua"))  -- Calling a basic function

-- Function with multiple parameters
local function add(a, b)
    return a + b
end

print("Sum of 5 and 7: " .. add(5, 7))

-- Function with default parameters
local function greetWithDefault(name, greeting)
    greeting = greeting or "Hello"  -- Default greeting is "Hello" if not provided
    return greeting .. ", " .. name .. "!"
end

print(greetWithDefault("Lua"))  -- Using default greeting
print(greetWithDefault("Lua", "Hi"))  -- Using custom greeting

print("\n")

-- 2. Return Values and Multiple Returns
print("2. Return Values and Multiple Returns:")

-- Function returning multiple values
local function divide(a, b)
    if b == 0 then
        return nil, "Error: Division by zero"
    end
    return a / b, "Success"
end

local result, message = divide(10, 2)
print("Result: " .. result .. ", Message: " .. message)

local result, message = divide(10, 0)
print("Result: " .. tostring(result) .. ", Message: " .. message)

print("\n")

-- 3. Anonymous Functions
print("3. Anonymous Functions:")

-- Anonymous function assigned to a variable
local square = function(n)
    return n * n
end

print("Square of 6: " .. square(6))

-- Passing anonymous function as an argument to another function
local function applyFunction(fn, value)
    return fn(value)
end

print("Applying anonymous function to 4: " .. applyFunction(function(n) return n + 2 end, 4))

print("\n")

-- 4. Variable Scope
print("4. Variable Scope:")

-- Global and Local variables
local function demonstrateScope()
    local localVar = "I am local"
    globalVar = "I am global"
    print(localVar)
    print(globalVar)
end

demonstrateScope()

-- Accessing globalVar outside the function
print("Accessing global variable outside function: " .. globalVar)

-- localVar will not be accessible here
-- print(localVar)  -- Uncommenting this line will cause an error

print("\n")

-- 5. Operations on Functions
print("5. Operations on Functions:")

-- Storing functions in tables
local operations = {
    add = function(a, b) return a + b end,
    subtract = function(a, b) return a - b end,
    multiply = function(a, b) return a * b end,
    divide = function(a, b) return a / b end
}

-- Using operations from the table
print("Addition (5 + 3): " .. operations.add(5, 3))
print("Subtraction (5 - 3): " .. operations.subtract(5, 3))
print("Multiplication (5 * 3): " .. operations.multiply(5, 3))
print("Division (6 / 3): " .. operations.divide(6, 3))

print("\n")

-- 6. Closures
print("6. Closures:")

-- Creating a closure
local function makeMultiplier(factor)
    return function(value)
        return value * factor
    end
end

local double = makeMultiplier(2)
local triple = makeMultiplier(3)

print("Double of 4: " .. double(4))
print("Triple of 4: " .. triple(4))

print("\n")

-- 7. Recursion
print("7. Recursion:")

-- Factorial function using recursion
local function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print("Factorial of 5: " .. factorial(5))

print("\n")

-- 8. Operations with Tables
print("8. Operations with Tables:")

-- Tables as Functions
local function createPerson(name, age)
    return {name = name, age = age}
end

local person = createPerson("John", 30)
print("Person's name: " .. person.name)
print("Person's age: " .. person.age)

-- Operations on Tables
local fruits = {"apple", "banana", "cherry"}
table.insert(fruits, "orange")  -- Adding an element
print("Fruits list after inserting 'orange': " .. table.concat(fruits, ", "))

table.remove(fruits, 2)  -- Removing an element by index
print("Fruits list after removing the second item: " .. table.concat(fruits, ", "))

-- Iterating over a table
print("\nIterating over table elements:")
for index, fruit in ipairs(fruits) do
    print("Index: " .. index .. ", Fruit: " .. fruit)
end

print("\n")

-- 9. Function as First-Class Citizens
print("9. Functions as First-Class Citizens:")

-- Passing functions around as arguments
local function executeFunction(fn)
    return fn(5)
end

local function squareFunction(x)
    return x * x
end

print("Executing square function: " .. executeFunction(squareFunction))

-- Returning a function from another function
local function getAdder(amount)
    return function(n) return n + amount end
end

local add5 = getAdder(5)
print("Adding 5 to 10: " .. add5(10))

print("\n")

-- 10. Operations with Strings
print("10. Operations with Strings:")

-- String concatenation
local str1 = "Lua"
local str2 = "Programming"
print("Concatenated String: " .. str1 .. " " .. str2)

-- String manipulation
local str = "hello world"
print("Uppercase: " .. string.upper(str))
print("Substring (1 to 5): " .. string.sub(str, 1, 5))

-- Pattern matching
local match = string.match(str, "hello")
print("Pattern match 'hello' in string: " .. tostring(match ~= nil))

print("\n")

-- Conclusion
print("End of Functions and Operations in Lua! Keep experimenting and exploring!")
