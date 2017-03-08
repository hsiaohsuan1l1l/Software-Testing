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

// Equivalence Class Test
TEST(ECTest, WeakNormal) {
    // Class1: Equilateral
    EXPECT_EQ("Equilateral", Triangle(5, 5, 5));
    // Class2: Isosceles
    EXPECT_EQ("Isosceles", Triangle(3, 3, 5));
    // Class3: Scalene
    EXPECT_EQ("Scalene", Triangle(3, 4, 5));
    // Class4: NotATriangle
    EXPECT_EQ("NotATriangle", Triangle(2, 3, 5));
}

TEST(ECTest, WeakRobust) {
    // Class5: a <= 0
    EXPECT_EQ("NotATriangle", Triangle(-1, 5, 5));
    // Class6: b <= 0
    EXPECT_EQ("NotATriangle", Triangle(5, -1, 5));
    // Class7: c <= 0
    EXPECT_EQ("NotATriangle", Triangle(5, 5, -1));
}

TEST(ECTest, StrongNormal) {
    // No valid subintervals exist, strong normal = weak normal 
}

TEST(ECTest, StrongRobust) {
    // Class8: a <= 0 and b <= 0
    EXPECT_EQ("NotATriangle", Triangle(-1, -1, 5));
    // Class9: a <= 0 and c <= 0
    EXPECT_EQ("NotATriangle", Triangle(-1, 5, -1));
    // Class10: b <= 0 and c <= 0
    EXPECT_EQ("NotATriangle", Triangle(5, -1, -1));
    // Class11: a <= 0 and b <= 0 and c <= 0
    EXPECT_EQ("NotATriangle", Triangle(-1, -1, -1));
}

// Edge Test
TEST(EdgeTest, WeakNormal) {
    // Class1: Equilateral with a,b,c = valid min
    EXPECT_EQ("Equilateral", Triangle(1, 1, 1));
    // Class2: Equilateral with a,b,c = valid near min
    EXPECT_EQ("Equilateral", Triangle(2, 2, 2));
    // Class3: Isosceles with a,b = valid min
    EXPECT_EQ("Isosceles", Triangle(2, 2, 3));
    // Class4: Isosceles with a,b = valid near min
    EXPECT_EQ("Isosceles", Triangle(3, 3, 5));
    // Class5: Scalene with a = valid min
    EXPECT_EQ("Scalene", Triangle(2, 3, 4));
    // Class6: Scalene with a = valid near min
    EXPECT_EQ("Scalene", Triangle(3, 4, 5));
    // Class7: NotATriangle with a = valid min
    EXPECT_EQ("NotATriangle", Triangle(1, 2, 3));
    // Class8: NotATriangle with a = valid near min
    EXPECT_EQ("NotATriangle", Triangle(2, 2, 5));
}

TEST(EdgeTest, WeakRobust) {
    // Similar with tests in ECTest.WeakRobust when choosing boundary
}

TEST(EdgeTest, StrongNormal) {
    // No valid subintervals exist, strong normal = weak normal
}

TEST(EdgeTest, StrongRobust) {
    // Similar with tests in ECTest.StrongRobust when choosing boundary
}

// Decision Table Based Test
    // c1: a < b + c ?
    // c2: b < a + c ?
    // c3: c < a + b ?
    // c4: a = b ?
    // c5: a = c ?
    // c6: b = c ?
TEST(DTBTest, Rule1) { // c1=False; rc=32
    EXPECT_EQ("NotATriangle", Triangle(100, 50, 50));
}

TEST(DTBTest, Rule2) { // c1=True, c2=False; rc=16
    EXPECT_EQ("NotATriangle", Triangle(50, 100, 50));
}

TEST(DTBTest, Rule3) { // c1,c2=True, c3=False; rc=8
    EXPECT_EQ("NotATriangle", Triangle(50, 50, 100));
}

TEST(DTBTest, Rule4) { // c1,c2,c3,c4,c5,c6=True; rc=1
    EXPECT_EQ("Equilateral", Triangle(200, 200, 200));
}

TEST(DTBTest, Rule5) { // c1,c2,c3,c4,c5=True, c6=False; rc=1
    // Logically Impossible
}

TEST(DTBTest, Rule6) { // c1,c2,c3,c4,c6=True, c5=False; rc=1
    // Logically Impossible
}

TEST(DTBTest, Rule7) { // c1,c2,c3,c4=True, c5,c6=False; rc=1
    EXPECT_EQ("Isosceles", Triangle(100, 100, 99));
}

TEST(DTBTest, Rule8) { // c1,c2,c3,c5,c6=True, c4=False; rc=1
    // Logically Impossible
}

TEST(DTBTest, Rule9) { // c1,c2,c3,c5=True, c4,c6=False; rc=1
    EXPECT_EQ("Isosceles", Triangle(100, 99, 100));
}

TEST(DTBTest, Rule10) { // c1,c2,c3,c6=True, c4,c5=False; rc=1
    EXPECT_EQ("Isosceles", Triangle(99, 100, 100));
}

TEST(DTBTest, Rule11) { // c1,c2,c3=True, c4,c5,c6=False; rc=1
    EXPECT_EQ("Scalene", Triangle(99, 100, 101));
}
