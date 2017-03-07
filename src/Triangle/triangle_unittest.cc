#include "triangle.h"
#include "gtest/gtest.h"

// Boundary Value Test
TEST(BVTest, WeakNormal) {
    // No Boundary
    EXPECT_EQ("Equilateral", Triangle(100, 100, 100));
    // Valid Single Boundary
    EXPECT_EQ("Isosceles", Triangle(1, 100, 100));
    EXPECT_EQ("Isosceles", Triangle(100, 1, 100));
    EXPECT_EQ("Isosceles", Triangle(100, 100, 1));
    // Valid Single Near Boundary
    EXPECT_EQ("Isosceles", Triangle(2, 100, 100));
    EXPECT_EQ("Isosceles", Triangle(100, 2, 100));
    EXPECT_EQ("Isosceles", Triangle(100, 100, 2));
}

TEST(BVTest, WeakRobust) {
    // Invalid Single Near Boundary
    EXPECT_EQ("NotATriangle", Triangle(0, 100, 100));
    EXPECT_EQ("NotATriangle", Triangle(100, 0, 100));
    EXPECT_EQ("NotATriangle", Triangle(100, 100, 0));
}

TEST(BVTest, StrongNormal) {
    // Valid Multiple Boundary
    EXPECT_EQ("NotATriangle", Triangle(1, 1, 100));
    EXPECT_EQ("NotATriangle", Triangle(1, 100, 1));
    EXPECT_EQ("NotATriangle", Triangle(100, 1, 1));
    EXPECT_EQ("Equilateral", Triangle(1, 1, 1));
    // Valid Multiple Near Boundary
    EXPECT_EQ("NotATriangle", Triangle(2, 2, 100));
    EXPECT_EQ("NotATriangle", Triangle(2, 100, 2));
    EXPECT_EQ("NotATriangle", Triangle(100, 2, 2));
    EXPECT_EQ("Equilateral", Triangle(2, 2, 2));
}

TEST(BVTest, StrongRobust) {
    // Invalid Multiple Near Boundary
    EXPECT_EQ("NotATriangle", Triangle(0, 0, 100));
    EXPECT_EQ("NotATriangle", Triangle(0, 100, 0));
    EXPECT_EQ("NotATriangle", Triangle(100, 0, 0));
    EXPECT_EQ("NotATriangle", Triangle(0, 0, 0));
}
