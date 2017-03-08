#include "nextdate.h"
#include "gtest/gtest.h"

// Boundary Value Test
    // 1 <= y
    // 1 <= m <= 12
    // 1 <= d <= 31
TEST(BVTest, WeakNormal) {
    // No Boundary
    EXPECT_EQ("2000.6.16", NextDate(2000, 6, 15));
    // Valid Single Boundary
    EXPECT_EQ("1.6.16", NextDate(1, 6, 15));
    EXPECT_EQ("2000.1.16", NextDate(2000, 1, 15));
    EXPECT_EQ("2000.12.16", NextDate(2000, 12, 15));
    EXPECT_EQ("2000.6.2", NextDate(2000, 6, 1));
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, 31));
    // Valid Single Near Boundary
    EXPECT_EQ("2.6.16", NextDate(2, 6, 15));
    EXPECT_EQ("2000.2.16", NextDate(2000, 2, 15));
    EXPECT_EQ("2000.11.16", NextDate(2000, 11, 15));
    EXPECT_EQ("2000.6.3", NextDate(2000, 6, 2));
    EXPECT_EQ("2000.7.1", NextDate(2000, 6, 30));
}

TEST(BVTest, WeakRobust) {
    // Invalid Single Near Boundary
    EXPECT_EQ("InvalidInput", NextDate(0, 6, 15));
    EXPECT_EQ("InvalidInput", NextDate(2000, 0, 15));
    EXPECT_EQ("InvalidInput", NextDate(2000, 13, 15));
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, 0));
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, 32));
}

TEST(BVTest, StrongNormal) {
    // Valid Multiple Boundary
    EXPECT_EQ("1.1.16", NextDate(1, 1, 15));
    EXPECT_EQ("1.12.16", NextDate(1, 12, 15));
    EXPECT_EQ("1.6.2", NextDate(1, 6, 1));
    EXPECT_EQ("InvalidInput", NextDate(1, 6, 31));
    EXPECT_EQ("2000.1.2", NextDate(2000, 1, 1));
    EXPECT_EQ("2000.2.1", NextDate(2000, 1, 31));
    EXPECT_EQ("2000.12.2", NextDate(2000, 12, 1));
    EXPECT_EQ("2001.1.1", NextDate(2000, 12, 31));
    EXPECT_EQ("1.1.2", NextDate(1, 1, 1));
    EXPECT_EQ("1.12.2", NextDate(1, 12, 1));
    EXPECT_EQ("1.2.1", NextDate(1, 1, 31));
    EXPECT_EQ("2.1.1", NextDate(1, 12, 31));
    // Valid Multiple Near Boundary
    EXPECT_EQ("2.2.16", NextDate(2, 2, 15));
    EXPECT_EQ("2.11.16", NextDate(2, 11, 15));
    EXPECT_EQ("2.6.3", NextDate(2, 6, 2));
    EXPECT_EQ("2.7.1", NextDate(2, 6, 30));
    EXPECT_EQ("2000.2.3", NextDate(2000, 2, 2));
    EXPECT_EQ("InvalidInput", NextDate(2000, 2, 30));
    EXPECT_EQ("2000.11.3", NextDate(2000, 11, 2));
    EXPECT_EQ("2000.12.1", NextDate(2000, 11, 30));
    EXPECT_EQ("2.2.3", NextDate(2, 2, 2));
    EXPECT_EQ("2.11.3", NextDate(2, 11, 2));
    EXPECT_EQ("InvalidInput", NextDate(2, 2, 30));
    EXPECT_EQ("2.12.1", NextDate(2, 11, 30));
}

TEST(BVTest, StrongRobust) {
    // Invalid Multiple Near Boundary
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 15));
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 15));
    EXPECT_EQ("InvalidInput", NextDate(0, 6, 0));
    EXPECT_EQ("InvalidInput", NextDate(0, 6, 32));
    EXPECT_EQ("InvalidInput", NextDate(2000, 0, 0));
    EXPECT_EQ("InvalidInput", NextDate(2000, 0, 32));
    EXPECT_EQ("InvalidInput", NextDate(2000, 13, 0));
    EXPECT_EQ("InvalidInput", NextDate(2000, 13, 32));
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 0));
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 0));
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 32));
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 32));
}
