#include <gtest/gtest.h>

// Function to be tested
int Add(int a, int b) {
    return a + b;
}

int Multiply(int a, int b) {
    return a * b;
}

// Test Case 1: Testing Add function
TEST(AdditionTest, PositiveNumbers) {
    EXPECT_EQ(Add(2, 3), 5);  // Test with positive numbers
}

TEST(AdditionTest, NegativeNumbers) {
    EXPECT_EQ(Add(-2, -3), -5);  // Test with negative numbers
}

TEST(AdditionTest, Zero) {
    EXPECT_EQ(Add(0, 0), 0);  // Test with zeros
}

// Test Case 2: Testing Multiply function
TEST(MultiplicationTest, PositiveNumbers) {
    EXPECT_EQ(Multiply(2, 3), 6);  // Test with positive numbers
}

TEST(MultiplicationTest, NegativeNumbers) {
    EXPECT_EQ(Multiply(-2, 3), -6);  // Test with negative numbers
}

TEST(MultiplicationTest, Zero) {
    EXPECT_EQ(Multiply(0, 3), 0);  // Test with zero
}

// Main function to run the tests
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);  // Initializes Google Test
    return RUN_ALL_TESTS();  // Runs all tests
}
