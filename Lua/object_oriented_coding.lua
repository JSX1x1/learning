-- object_oriented_coding.lua

-- Introduction message
print("Welcome to Object-Oriented Programming in Lua!")
print("This script will guide you through the basics and advanced concepts of object-oriented programming (OOP) in Lua.\n")

-- 1. Introduction to OOP in Lua
print("1. Introduction to Object-Oriented Programming (OOP) in Lua:")

-- Lua is not strictly an object-oriented language, but it provides tools to create object-like structures.
-- In Lua, we use tables and metatables to simulate OOP concepts such as classes, objects, inheritance, and polymorphism.
-- A "class" in Lua is typically represented by a table, and we use metatables to define behaviors (methods) for that class.
print("In Lua, a class is simply a table, and we use metatables to define methods and behaviors for objects.\n")

-- 2. Creating a Basic Class
print("2. Creating a Basic Class:")

-- Define a 'Person' class with some properties and methods using a table and metatables.

local Person = {}  -- Define the Person class (a table)
Person.__index = Person  -- Set the metatable for Person class

-- Constructor function for creating new Person objects
function Person.new(name, age)
    local self = setmetatable({}, Person)  -- Create a new table and set its metatable to Person
    self.name = name
    self.age = age
    return self
end

-- Method for printing the person's info
function Person:introduce()
    print("Hi, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

-- Create an object (instance) of the Person class
local person1 = Person.new("Alice", 30)
local person2 = Person.new("Bob", 25)

-- Call the method on the person objects
person1:introduce()
person2:introduce()

print("\n")

-- 3. Inheritance
print("3. Inheritance:")

-- Inheritance in Lua is implemented by setting the metatable of a subclass to a superclass.
-- Let's create a "Student" subclass that inherits from the "Person" class.

local Student = setmetatable({}, Person)  -- Set Student's metatable to Person, making Student inherit from Person
Student.__index = Student  -- Define the metatable for the Student class

-- Constructor function for creating new Student objects
function Student.new(name, age, school)
    local self = Person.new(name, age)  -- Call the parent class constructor
    setmetatable(self, Student)  -- Set the metatable of this object to Student
    self.school = school  -- Add additional property specific to Student
    return self
end

-- Override the introduce method to include school information
function Student:introduce()
    print("Hi, my name is " .. self.name .. " and I am " .. self.age .. " years old. I go to " .. self.school .. ".")
end

-- Create an object (instance) of the Student class
local student1 = Student.new("Charlie", 20, "Harvard")
local student2 = Student.new("David", 22, "MIT")

-- Call the method on the student objects
student1:introduce()
student2:introduce()

print("\n")

-- 4. Polymorphism
print("4. Polymorphism:")

-- Polymorphism allows different classes to implement methods with the same name but different behaviors.
-- The `introduce` method in the `Student` class overrides the `introduce` method in the `Person` class.

-- Create a function that calls introduce() on any object, regardless of its class
function introducePerson(person)
    person:introduce()  -- This will call the appropriate method based on the object's class
end

-- Using polymorphism
introducePerson(person1)  -- Calls Person's introduce method
introducePerson(student1)  -- Calls Student's overridden introduce method

print("\n")

-- 5. Encapsulation
print("5. Encapsulation:")

-- Encapsulation is the concept of restricting access to certain details of an object's implementation.
-- In Lua, we can achieve encapsulation by not directly exposing some properties or methods.

-- Let's modify the `Person` class to make its properties private and use getter and setter methods to access them.

local PersonEncapsulated = {}  -- Define the Person class
PersonEncapsulated.__index = PersonEncapsulated  -- Set metatable

-- Constructor function for creating new Person objects with encapsulated data
function PersonEncapsulated.new(name, age)
    local self = setmetatable({}, PersonEncapsulated)
    self._name = name  -- Private property (using an underscore prefix)
    self._age = age  -- Private property
    return self
end

-- Getter method for name
function PersonEncapsulated:getName()
    return self._name
end

-- Setter method for name
function PersonEncapsulated:setName(name)
    self._name = name
end

-- Getter method for age
function PersonEncapsulated:getAge()
    return self._age
end

-- Setter method for age
function PersonEncapsulated:setAge(age)
    self._age = age
end

-- Create an object (instance) of the PersonEncapsulated class
local personEncapsulated = PersonEncapsulated.new("Emma", 35)

-- Accessing private data through getter methods
print("Name: " .. personEncapsulated:getName())  -- Get name
print("Age: " .. personEncapsulated:getAge())    -- Get age

-- Modify the name and age through setter methods
personEncapsulated:setName("Emma Watson")
personEncapsulated:setAge(36)

print("Updated Name: " .. personEncapsulated:getName())  -- Updated name
print("Updated Age: " .. personEncapsulated:getAge())    -- Updated age

print("\n")

-- 6. Metatables and Operator Overloading
print("6. Metatables and Operator Overloading:")

-- In Lua, metatables allow us to define custom behavior for operators like `+`, `-`, `*`, etc.
-- Let's create a `Point` class that represents a point in 2D space, and we'll overload the `+` operator.

local Point = {}
Point.__index = Point  -- Set metatable

-- Constructor function for creating new Point objects
function Point.new(x, y)
    local self = setmetatable({}, Point)
    self.x = x
    self.y = y
    return self
end

-- Overload the + operator to add two points
function Point.__add(p1, p2)
    return Point.new(p1.x + p2.x, p1.y + p2.y)
end

-- Create two points and add them together
local point1 = Point.new(1, 2)
local point2 = Point.new(3, 4)

local result = point1 + point2  -- Uses the overloaded + operator

print("Resulting Point after addition: (" .. result.x .. ", " .. result.y .. ")")

print("\n")

-- 7. Conclusion
print("7. Conclusion:")

-- Object-Oriented Programming in Lua can be implemented using tables and metatables.
-- We can define classes using tables, create instances, and implement key OOP concepts like inheritance, polymorphism, and encapsulation.
-- Lua's metatables provide powerful mechanisms to customize object behavior, such as operator overloading and custom method definitions.

-- Summary of OOP concepts in Lua:
-- 1. Classes are tables, and methods are functions associated with those tables.
-- 2. Inheritance is achieved by setting metatables to create subclass relationships.
-- 3. Polymorphism allows different objects to implement methods with the same name but different behaviors.
-- 4. Encapsulation restricts access to an object's internal state, providing getter and setter methods.
-- 5. Metatables allow operator overloading and custom behavior for Lua's operators.
