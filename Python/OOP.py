# Class definition
class Animal:
    def __init__(self, name, species):
        # Encapsulation: Using attributes to store data
        self.name = name
        self.species = species

    # Method to represent behavior
    def speak(self):
        print(f"{self.name} makes a sound.")

    # Method to display animal information
    def get_info(self):
        return f"{self.name} is a {self.species}."


# Inheritance: Dog class inherits from Animal class
class Dog(Animal):
    def __init__(self, name, breed):
        # Super function calls the parent class constructor
        super().__init__(name, "Dog")
        self.breed = breed

    # Overriding the speak method (Polymorphism)
    def speak(self):
        print(f"{self.name} barks!")

    # Adding a new method to the Dog class
    def fetch(self):
        print(f"{self.name} is fetching the ball!")


# Inheritance: Cat class inherits from Animal class
class Cat(Animal):
    def __init__(self, name, color):
        # Super function calls the parent class constructor
        super().__init__(name, "Cat")
        self.color = color

    # Overriding the speak method (Polymorphism)
    def speak(self):
        print(f"{self.name} meows!")

    # Adding a new method to the Cat class
    def scratch(self):
        print(f"{self.name} is scratching the furniture!")


# Abstract class using ABC (Abstract Base Class)
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass
    
    @abstractmethod
    def perimeter(self):
        pass


# Concrete class Rectangle inherits from Shape
class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)


# Concrete class Circle inherits from Shape
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * (self.radius ** 2)

    def perimeter(self):
        return 2 * 3.14 * self.radius


# Main program: Using the classes defined above

if __name__ == "__main__":
    # Creating objects (instances of classes)
    dog = Dog(name="Buddy", breed="Golden Retriever")
    cat = Cat(name="Whiskers", color="Black")

    # Calling methods on dog and cat objects
    print(dog.get_info())  # Inherited from Animal
    dog.speak()  # Polymorphism: Overridden method in Dog
    dog.fetch()  # Specific to Dog

    print(cat.get_info())  # Inherited from Animal
    cat.speak()  # Polymorphism: Overridden method in Cat
    cat.scratch()  # Specific to Cat

    # Creating objects for the abstract classes
    rectangle = Rectangle(width=5, height=10)
    circle = Circle(radius=7)

    # Using the methods of the abstract classes
    print(f"Rectangle Area: {rectangle.area()} | Perimeter: {rectangle.perimeter()}")
    print(f"Circle Area: {circle.area()} | Perimeter: {circle.perimeter()}")
