<?php
// =====================
// 1. Memory Management
// =====================

function memoryTest() {
    $data = array_fill(0, 100000, 'some value'); // Simulate large data
    echo "Memory used before clearing: " . memory_get_usage() . " bytes\n";
    unset($data); // Clear the data to release memory
    echo "Memory used after clearing: " . memory_get_usage() . " bytes\n";
}

echo "=== Memory Management ===\n";
memoryTest();
echo "\n";

// =====================
// 2. Profiling Tools (Xdebug)
// =====================

function slowFunction() {
    $total = 0;
    for ($i = 0; $i < 1000000; $i++) {
        $total += $i;
    }
    return $total;
}

echo "=== Profiling Tools (Xdebug) ===\n";
// Start profiling (Ensure Xdebug is installed)
xdebug_start_trace();

// Run the function to profile
slowFunction();

// End profiling
xdebug_stop_trace();

echo "Profiling data is saved in the default trace file.\n\n";

// =====================
// 3. Concurrency (pthreads)
// =====================

class ParallelTask extends Thread {
    public function run() {
        echo "Task running in parallel\n";
        sleep(2); // Simulating a time-consuming task
        echo "Task completed in parallel\n";
    }
}

echo "=== Concurrency (pthreads) ===\n";
$thread1 = new ParallelTask();
$thread2 = new ParallelTask();

$thread1->start();
$thread2->start();

// Wait for both threads to finish
$thread1->join();
$thread2->join();
echo "\n";

// =====================
// 4. CPU Optimization
// =====================

function slowSum() {
    $total = 0;
    for ($i = 0; $i < 1000000; $i++) {
        $total += $i;
    }
    return $total;
}

function optimizedSum() {
    // Using a mathematical formula for sum of first n numbers
    $n = 1000000;
    return $n * ($n + 1) / 2;
}

echo "=== CPU Optimization ===\n";
echo "Slow sum result: " . slowSum() . "\n";
echo "Optimized sum result: " . optimizedSum() . "\n\n";

// =====================
// 5. Algorithm Optimization
// =====================

function fibonacci($n) {
    if ($n <= 1) return $n;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

function optimizedFibonacci($n) {
    $a = 0;
    $b = 1;
    for ($i = 0; $i < $n; $i++) {
        $temp = $b;
        $b = $a + $b;
        $a = $temp;
    }
    return $a;
}

echo "=== Algorithm Optimization ===\n";
echo "Fibonacci (recursive) for 10: " . fibonacci(10) . "\n";
echo "Optimized Fibonacci for 10: " . optimizedFibonacci(10) . "\n\n";

// =====================
// 6. Caching
// =====================

$cache = [];

function fetchFromCache($key) {
    global $cache;
    if (isset($cache[$key])) {
        echo "Cache hit for key: $key\n";
        return $cache[$key];
    }
    echo "Cache miss for key: $key\n";
    $result = 'Value for ' . $key; // Simulate data fetching
    $cache[$key] = $result;
    return $result;
}

echo "=== Caching ===\n";
echo fetchFromCache('user_123') . "\n"; // Cache miss
echo fetchFromCache('user_123') . "\n"; // Cache hit
echo "\n";

// =====================
// 7. Load Testing (Simulate Load)
// =====================

function simulateLoad($numRequests) {
    for ($i = 0; $i < $numRequests; $i++) {
        echo "Processing request #$i\n";
        sleep(1); // Simulate request processing time
    }
}

echo "=== Load Testing (Simulate Load) ===\n";
simulateLoad(5); // Simulate 5 requests
echo "\n";

// =====================
// 8. Parallel Computing (multi-processing)
// =====================

function parallelTask($taskName) {
    echo "Starting task: $taskName\n";
    sleep(2); // Simulating a time-consuming task
    echo "Completed task: $taskName\n";
}

echo "=== Parallel Computing (multi-processing) ===\n";
$tasks = ['Task 1', 'Task 2', 'Task 3'];

foreach ($tasks as $task) {
    parallelTask($task); // Simulating parallel execution
}
echo "\n";

// =====================
// 9. Database Optimization
// =====================

function optimizeQuery($query) {
    // Simulate a database query optimization
    echo "Optimizing query: $query\n";
    // Placeholder for actual query optimization logic
    return "Optimized query: $query";
}

echo "=== Database Optimization ===\n";
echo optimizeQuery('SELECT * FROM users WHERE active = 1') . "\n";
echo "\n";

?>
