-- async_coding.lua

-- Introduction message
print("Welcome to Asynchronous Programming in Lua!")
print("This script will guide you through the different techniques and tools for handling asynchronous tasks in Lua.\n")

-- 1. Overview of Asynchronous Programming
print("1. Overview of Asynchronous Programming:")

-- Asynchronous programming allows certain tasks to be executed concurrently, without blocking the main program flow.
-- This is especially useful in applications like web servers, real-time processing, and handling multiple I/O tasks.
-- In Lua, asynchronous programming is typically handled with coroutines or by using external libraries for I/O operations.

-- Lua itself does not have built-in async/await like JavaScript, but coroutines can be used to achieve cooperative multitasking.
print("In Lua, we simulate asynchronous programming primarily using coroutines and libraries like `luasocket` for handling asynchronous I/O operations.\n")

-- 2. Coroutines: The Basics
print("2. Coroutines: The Basics")

-- Coroutines are Lua's way of providing cooperative multitasking.
-- Unlike threads, coroutines work in a cooperative manner, meaning they yield control back to the caller and wait for the caller to resume them.

-- The two basic coroutine functions are:
-- coroutine.create()    - Creates a new coroutine.
-- coroutine.resume()    - Resumes a coroutine.
-- coroutine.yield()     - Yields the execution of the coroutine and returns control to the caller.

-- Example of a simple coroutine:
local function simpleCoroutine()
    print("Starting Coroutine")
    for i = 1, 5 do
        print("Coroutine iteration: " .. i)
        coroutine.yield()  -- Yield control back to the main program
    end
    print("Coroutine Finished")
end

-- Creating and running the coroutine:
local co = coroutine.create(simpleCoroutine)
for i = 1, 5 do
    print("Main Program Iteration: " .. i)
    coroutine.resume(co)  -- Resume the coroutine
end
print("\n")

-- 3. Using Coroutines for Asynchronous Tasks
print("3. Using Coroutines for Asynchronous Tasks")

-- In this example, we'll simulate an asynchronous task using coroutines:
-- Let's simulate an I/O task (such as fetching data) that doesn't block the main program.

local function asyncTask()
    print("Async task started.")
    for i = 1, 3 do
        print("Async task progress: " .. i)
        coroutine.yield()  -- Simulate some work and yield control
    end
    print("Async task finished.")
end

-- Creating and running the asynchronous task coroutine:
local coAsync = coroutine.create(asyncTask)

-- Simulate a main program that runs asynchronously with the task:
for i = 1, 5 do
    print("Main Program Iteration: " .. i)
    if coroutine.status(coAsync) ~= "dead" then
        coroutine.resume(coAsync)  -- Resume the asynchronous task coroutine
    end
end
print("\n")

-- 4. Non-Blocking I/O with LuaSocket
print("4. Non-Blocking I/O with LuaSocket:")

-- For real-world asynchronous I/O operations (like network operations), you can use libraries such as `luasocket`.

-- To use `luasocket`, install it using LuaRocks (if you don't have it installed):
-- luarocks install luasocket

-- Example of using `luasocket` for a non-blocking task (e.g., a simple HTTP request).
local socket = require("socket")

-- Let's simulate an asynchronous network task using `luasocket` with coroutines:

local function asyncNetworkRequest()
    print("Simulating network request (non-blocking)...")
    
    local client = socket.tcp()  -- Create a TCP socket
    client:settimeout(1)  -- Set timeout to 1 second
    
    local success, err = client:connect("example.com", 80)  -- Attempt to connect to a server
    if not success then
        print("Connection failed: " .. err)
        return
    end
    
    local request = "GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n"
    local bytes_sent, err = client:send(request)  -- Send the request asynchronously
    if not bytes_sent then
        print("Failed to send request: " .. err)
        return
    end
    
    print("Request sent, waiting for response...")
    local response, err = client:receive("*a")  -- Receive the response (non-blocking)
    if response then
        print("Received response from the server:")
        print(response:sub(1, 200))  -- Print first 200 characters of the response
    else
        print("Error receiving response: " .. err)
    end
    
    client:close()  -- Close the socket after the task is done
end

-- Simulate running the network request asynchronously:
local coNetwork = coroutine.create(asyncNetworkRequest)

for i = 1, 5 do
    print("Main Program Iteration: " .. i)
    if coroutine.status(coNetwork) ~= "dead" then
        coroutine.resume(coNetwork)  -- Resume the network request coroutine
    end
end
print("\n")

-- 5. Simulating Asynchronous Delays with `socket.select()`
print("5. Simulating Asynchronous Delays with `socket.select()`:")

-- Another useful function in asynchronous programming is `socket.select()`, which allows you to wait for an event, like waiting for input/output readiness on a socket, without blocking the program.

local function simulateDelay()
    print("Simulating asynchronous delay...")

    -- Using socket.select to simulate non-blocking delay
    local ready, _, _ = socket.select(nil, nil, 3)  -- Wait for 3 seconds asynchronously (non-blocking)
    if ready then
        print("Delay completed without blocking the main program!")
    else
        print("Timed out after waiting 3 seconds.")
    end
end

-- Running simulateDelay with coroutines:
local coDelay = coroutine.create(simulateDelay)

for i = 1, 3 do
    print("Main Program Iteration: " .. i)
    if coroutine.status(coDelay) ~= "dead" then
        coroutine.resume(coDelay)  -- Resume the delay coroutine
    end
end
print("\n")

-- 6. Handling Concurrent Tasks with `luarocks` and `luasocket`
print("6. Handling Concurrent Tasks with `luasocket` and Coroutines:")

-- You can use the `luasocket` library and coroutines together to handle multiple concurrent tasks.

local function concurrentTask(id)
    print("Starting task " .. id)
    for i = 1, 3 do
        print("Task " .. id .. " progress: " .. i)
        coroutine.yield()  -- Yield to simulate non-blocking behavior
    end
    print("Task " .. id .. " finished.")
end

-- Creating multiple tasks:
local co1 = coroutine.create(concurrentTask)
local co2 = coroutine.create(concurrentTask)

-- Running the concurrent tasks:
for i = 1, 5 do
    print("Main Program Iteration: " .. i)
    coroutine.resume(co1, 1)  -- Resume the first task
    coroutine.resume(co2, 2)  -- Resume the second task
end
print("\n")

-- Conclusion
print("End of Asynchronous Programming in Lua! While Lua doesn't have built-in async/await, it provides powerful tools like coroutines and external libraries to handle asynchronous tasks efficiently.")
