-- memory_management.lua

-- Introduction message
print("Welcome to Memory Management in Lua!")
print("This script will guide you through how Lua handles memory management and garbage collection.\n")

-- 1. Overview of Memory Management in Lua
print("1. Overview of Memory Management in Lua:")

-- Lua has automatic memory management via garbage collection.
-- The programmer does not need to manually allocate or deallocate memory.
-- However, understanding the memory model and how garbage collection works can help optimize memory usage.

print("In Lua, memory is automatically managed by garbage collection (GC). Lua's garbage collector reclaims memory used by objects that are no longer referenced.")
print("While Lua handles memory management automatically, you can influence its behavior with the garbage collector's functions.\n")

-- 2. Garbage Collection in Lua
print("2. Garbage Collection in Lua:")

-- Print the current garbage collection status
print("Collecting garbage: " .. tostring(collectgarbage("isrunning")))  -- Check if GC is running

-- Manually triggering garbage collection
print("\nTriggering manual garbage collection...")
collectgarbage("collect")  -- Manually perform garbage collection
print("Garbage collection triggered.\n")

-- 3. Garbage Collection Functions
print("3. Garbage Collection Functions:")

-- `collectgarbage()` has several modes:
-- "stop"  - Stops the garbage collector.
-- "restart" - Restarts the garbage collector.
-- "collect" - Forces a garbage collection cycle.
-- "count" - Returns the total memory (in kilobytes) currently in use by Lua.
-- "setpause" - Sets the threshold for triggering the garbage collector.
-- "setstepmul" - Sets the amount of work the garbage collector performs.

print("Current memory usage (in KB): " .. collectgarbage("count"))  -- Returns memory in KB used by Lua

-- Example: Adjusting GC parameters (pause and step multiplier)
print("Setting GC pause and step multiplier...")
collectgarbage("setpause", 200)  -- Adjust the pause value
collectgarbage("setstepmul", 500)  -- Adjust the step multiplier

-- 4. Managing Memory with Tables
print("\n4. Managing Memory with Tables:")

-- Tables are one of the main sources of memory consumption in Lua.
-- Creating large tables can quickly use up memory, especially when tables are not being cleaned up.

-- Creating a large table
local largeTable = {}
for i = 1, 1000000 do
    largeTable[i] = i
end

-- Print the memory used after creating a large table
print("Memory used after creating a large table (in KB): " .. collectgarbage("count"))

-- Remove the reference to the large table to allow garbage collection
largeTable = nil

-- Trigger garbage collection to reclaim memory
collectgarbage("collect")

-- Print the memory used after garbage collection
print("Memory used after garbage collection (in KB): " .. collectgarbage("count"))

print("\n")

-- 5. Object Lifetime and Garbage Collection
print("5. Object Lifetime and Garbage Collection:")

-- Lua objects are automatically garbage collected when they go out of scope.
-- However, objects that are still referenced (e.g., stored in tables or variables) will not be collected.

-- Create some objects
local a = {name = "Object A"}
local b = {name = "Object B"}

-- Print memory usage before deleting references
print("Memory used before deleting references (in KB): " .. collectgarbage("count"))

-- Deleting references to the objects
a = nil
b = nil

-- Trigger garbage collection to clean up
collectgarbage("collect")

-- Print memory usage after garbage collection
print("Memory used after deleting references and GC (in KB): " .. collectgarbage("count"))

print("\n")

-- 6. Memory Leaks in Lua
print("6. Memory Leaks in Lua:")

-- A memory leak occurs when objects are still referenced even though they are no longer needed.

-- Example of a potential memory leak
local memoryLeak = {}

-- Simulating a memory leak by holding references unnecessarily
for i = 1, 1000000 do
    memoryLeak[i] = {value = i}
end

print("Memory used during simulated memory leak (in KB): " .. collectgarbage("count"))

-- Now remove all references and trigger GC
memoryLeak = nil
collectgarbage("collect")

print("Memory used after memory leak cleanup (in KB): " .. collectgarbage("count"))

print("\n")

-- 7. Optimizing Memory Usage in Lua
print("7. Optimizing Memory Usage in Lua:")

-- Tips for optimizing memory usage:
-- 1. Avoid creating unnecessary large tables.
-- 2. Remove references to unused objects to allow garbage collection.
-- 3. Use `collectgarbage("collect")` to trigger garbage collection when needed.
-- 4. Be cautious when storing large objects in long-lived data structures like global tables.

-- Example: Use weak tables to avoid preventing garbage collection of objects that should be collected

-- Using weak tables to optimize memory (they don’t prevent GC from collecting unused objects)
local weakTable = setmetatable({}, { __mode = "v" })

-- Storing data in a weak table (values are weak)
local obj = {key = "value"}
weakTable[obj] = true

-- Triggering garbage collection after the object is no longer referenced
obj = nil  -- Remove reference to obj

collectgarbage("collect")

-- Since the table uses weak references, obj should be garbage collected
print("Memory used after weak table cleanup (in KB): " .. collectgarbage("count"))

print("\n")

-- 8. Performance Considerations
print("8. Performance Considerations:")

-- Memory management has an impact on performance. While Lua handles most memory management automatically,
-- frequent garbage collection cycles or large memory usage can affect performance.

-- To optimize performance:
-- 1. Minimize memory allocations by reusing tables and objects when possible.
-- 2. Avoid unnecessary creation and deletion of large objects within performance-critical loops.
-- 3. Fine-tune the garbage collector’s parameters based on the application's needs.

-- Demonstrating performance-sensitive operation
local startTime = os.clock()

-- Simulating a performance-sensitive task with a large number of operations
for i = 1, 100000 do
    local temp = {value = i}
end

local endTime = os.clock()

print("Time taken for the performance-sensitive operation: " .. (endTime - startTime) .. " seconds.")

print("\n")

-- Conclusion
print("End of Memory Management in Lua! Understanding Lua's garbage collection and memory management strategies is key to building efficient programs.")