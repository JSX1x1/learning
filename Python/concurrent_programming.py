import concurrent.futures
import time
import math
import requests
from typing import List


# Step 1: Example of Threading
def download_data(url: str) -> str:
    """Simulates downloading data from a URL by sleeping for a few seconds."""
    print(f"Starting to download from {url}")
    time.sleep(2)  # Simulating network delay
    print(f"Finished downloading from {url}")
    return f"Data from {url}"


def thread_example(urls: List[str]):
    """Downloads data concurrently using threads."""
    print("Starting thread example...")
    
    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Map the download function to a list of URLs
        results = executor.map(download_data, urls)
    
    for result in results:
        print(result)


# Step 2: Example of Process Pooling
def calculate_factorial(n: int) -> int:
    """Calculates the factorial of a number."""
    print(f"Calculating factorial of {n}")
    time.sleep(1)  # Simulate a CPU-bound task
    return math.factorial(n)


def process_pool_example(numbers: List[int]):
    """Calculates factorials concurrently using processes."""
    print("Starting process pool example...")
    
    with concurrent.futures.ProcessPoolExecutor() as executor:
        # Map the factorial calculation function to the list of numbers
        results = executor.map(calculate_factorial, numbers)
    
    for result in results:
        print(f"Factorial result: {result}")


# Step 3: Using Futures for Asynchronous Execution
def fetch_data_async(url: str) -> str:
    """Simulates an asynchronous data fetching operation."""
    print(f"Fetching data from {url} asynchronously...")
    time.sleep(2)  # Simulate delay
    return f"Fetched data from {url}"


def future_example(urls: List[str]):
    """Fetches data concurrently and processes results using futures."""
    print("Starting future example...")
    
    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Submit tasks and store the Future objects
        futures = [executor.submit(fetch_data_async, url) for url in urls]
        
        # Wait for all futures to complete and retrieve results
        for future in concurrent.futures.as_completed(futures):
            print(future.result())


# Main function
def main():
    urls = [
        "https://example.com/page1",
        "https://example.com/page2",
        "https://example.com/page3"
    ]
    
    numbers = [5, 7, 10, 15]

    # Threading example
    thread_example(urls)
    
    # Process Pooling example
    process_pool_example(numbers)
    
    # Future example
    future_example(urls)


# Run the main function
if __name__ == '__main__':
    main()
