import asyncio

# ------------------------------
# 1. Basic Async Function
# ------------------------------

async def say_hello():
    print("Hello,")
    await asyncio.sleep(1)  # Simulate an async task
    print("World!")

# ------------------------------
# 2. Running Multiple Async Tasks Concurrently
# ------------------------------

async def task1():
    print("Task 1 started")
    await asyncio.sleep(2)
    print("Task 1 finished")

async def task2():
    print("Task 2 started")
    await asyncio.sleep(1)
    print("Task 2 finished")

async def run_multiple_tasks():
    print("Running multiple tasks concurrently:")
    # Run task1 and task2 concurrently
    await asyncio.gather(task1(), task2())

# ------------------------------
# 3. Async Function with Arguments
# ------------------------------

async def greet_person(name):
    print(f"Hello, {name}!")
    await asyncio.sleep(2)
    print(f"Goodbye, {name}!")

async def run_greeting():
    # Running greet_person for multiple names concurrently
    await asyncio.gather(greet_person("Alice"), greet_person("Bob"))

# ------------------------------
# 4. Error Handling in Async Functions
# ------------------------------

async def task_with_error():
    print("Starting task with error...")
    await asyncio.sleep(1)
    raise ValueError("An error occurred in this task!")  # Simulating an error

async def run_with_error_handling():
    try:
        await task_with_error()
    except ValueError as e:
        print(f"Caught an error: {e}")

# ------------------------------
# 5. Async I/O (Simulating Network Requests)
# ------------------------------

async def fake_network_request(url):
    print(f"Starting request to {url}")
    await asyncio.sleep(3)  # Simulate network delay
    print(f"Finished request to {url}")
    return f"Response from {url}"

async def fetch_data():
    # Simulating multiple network requests concurrently
    url1 = "https://example.com/api1"
    url2 = "https://example.com/api2"
    result1, result2 = await asyncio.gather(fake_network_request(url1), fake_network_request(url2))
    print(result1)
    print(result2)

# ------------------------------
# 6. Main Function to Run All Sections
# ------------------------------

async def main():
    # 1. Running a simple async function
    print("1. Basic Async Function:")
    await say_hello()

    # 2. Running multiple tasks concurrently
    print("\n2. Running Multiple Async Tasks Concurrently:")
    await run_multiple_tasks()

    # 3. Async Function with Arguments
    print("\n3. Async Function with Arguments:")
    await run_greeting()

    # 4. Error Handling in Async Functions
    print("\n4. Error Handling in Async Functions:")
    await run_with_error_handling()

    # 5. Async I/O (Simulating Network Requests)
    print("\n5. Async I/O (Simulating Network Requests):")
    await fetch_data()

# Run the main async function using asyncio
if __name__ == "__main__":
    asyncio.run(main())
