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

// Equivalence Class Test
    // Y1: leap year             Y3: y < 1
    // Y2: common year
    // M1: month has 30 days     M4: m < 1
    // M2: month has 31 days     M5: m > 12
    // M3: Feb.
    // D1: 1 <= d <= 28          D5: d < 1
    // D2: d = 29                D6: d > 31
    // D3: d = 30
    // D4: d = 31
TEST(ECTest, WeakNormal) {
    // Class1: Y1, M1, D1
    EXPECT_EQ("2000.6.15", NextDate(2000, 6, 14));
    // Class2: Y2, M2, D2
    EXPECT_EQ("1994.7.30", NextDate(1994, 7, 29));
    // Class3: Y1, M3, D3
    EXPECT_EQ("InvalidInput", NextDate(2000, 2, 30));
    // Class4: Y2, M1, D4
    EXPECT_EQ("InvalidInput", NextDate(1994, 6, 31));
}

TEST(ECTest, WeakRobust) {
    // Class5: Y3, M1, D1
    EXPECT_EQ("InvalidInput", NextDate(-1, 6, 14));
    // Class6: Y1, M4, D1
    EXPECT_EQ("InvalidInput", NextDate(2000, -1, 14));
    // Class7: Y1, M5, D1
    EXPECT_EQ("InvalidInput", NextDate(2000, 15, 14));
    // Class8: Y1, M1, D5
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, -1));
    // Class9: Y1, M1, D6
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, 33));
}

TEST(ECTest, StrongNormal) {
    // Class10: Y1, M1, D2
    EXPECT_EQ("2000.6.30", NextDate(2000, 6, 29));
    // Class11: Y1, M1, D3
    EXPECT_EQ("2000.7.1", NextDate(2000, 6, 30));
    // Class12: Y1, M1, D4
    EXPECT_EQ("InvalidInput", NextDate(2000, 6, 31));
    // Class13: Y1, M2, D1
    EXPECT_EQ("2000.7.15", NextDate(2000, 7, 14));
    // Class14: Y1, M2, D2
    EXPECT_EQ("2000.7.30", NextDate(2000, 7, 29));
    // Class15: Y1, M2, D3
    EXPECT_EQ("2000.7.31", NextDate(2000, 7, 30));
    // Class16: Y1, M2, D4
    EXPECT_EQ("2000.8.1", NextDate(2000, 7, 31));
    // Class17: Y1, M3, D1
    EXPECT_EQ("2000.2.15", NextDate(2000, 2, 14));
    // Class18: Y1, M3, D2
    EXPECT_EQ("2000.3.1", NextDate(2000, 2, 29));
    // Class19: Y1, M3, D4
    EXPECT_EQ("InvalidInput", NextDate(2000, 2, 31));
    // Class20: Y2, M1, D1
    EXPECT_EQ("1994.6.15", NextDate(1994, 6, 14));
    // Class21: Y2, M1, D2
    EXPECT_EQ("1994.6.30", NextDate(1994, 6, 29));
    // Class22: Y2, M1, D3
    EXPECT_EQ("1994.7.1", NextDate(1994, 6, 30));
    // Class23: Y2, M2, D1
    EXPECT_EQ("1994.7.15", NextDate(1994, 7, 14));
    // Class24: Y2, M2, D3
    EXPECT_EQ("1994.7.31", NextDate(1994, 7, 30));
    // Class25: Y2, M2, D4
    EXPECT_EQ("1994.8.1", NextDate(1994, 7, 31));
    // Class26: Y2, M3, D1
    EXPECT_EQ("1994.2.15", NextDate(1994, 2, 14));
    // Class27: Y2, M3, D2
    EXPECT_EQ("InvalidInput", NextDate(1994, 2, 29));
    // Class28: Y2, M3, D3
    EXPECT_EQ("InvalidInput", NextDate(1994, 2, 30));
    // Class29: Y2, M3, D4
    EXPECT_EQ("InvalidInput", NextDate(1994, 2, 31));
}

TEST(ECTest, StrongRobust) {
    // Class30: Y3, M4, D1
    EXPECT_EQ("InvalidInput", NextDate(-1, -1, 14));
    // Class31: Y3, M5, D1
    EXPECT_EQ("InvalidInput", NextDate(-1, 15, 14));
    // Class32: Y3, M1, D5
    EXPECT_EQ("InvalidInput", NextDate(-1, 6, -1));
    // Class33: Y3, M1, D6
    EXPECT_EQ("InvalidInput", NextDate(-1, 6, 33));
    // Class34: Y1, M4, D5
    EXPECT_EQ("InvalidInput", NextDate(2000, -1, -1));
    // Class35: Y1, M4, D6
    EXPECT_EQ("InvalidInput", NextDate(2000, -1, 33));
    // Class36: Y1, M5, D5
    EXPECT_EQ("InvalidInput", NextDate(2000, 15, -1));
    // Class37: Y1, M5, D6
    EXPECT_EQ("InvalidInput", NextDate(2000, 15, 33));
    // Class38: Y3, M4, D5
    EXPECT_EQ("InvalidInput", NextDate(-1, -1, -1));
    // Class39: Y3, M4, D6
    EXPECT_EQ("InvalidInput", NextDate(-1, -1, 33));
    // Class40: Y3, M5, D5
    EXPECT_EQ("InvalidInput", NextDate(-1, 15, -1));
    // Class41: Y3, M5, D6
    EXPECT_EQ("InvalidInput", NextDate(-1, 15, 33));
}

// Edge Test
TEST(EdgeTest, WeakNormal) {
    // Class1: Y1, M1, D1
    EXPECT_EQ("4.4.2", NextDate(4, 4, 1));
    // Class2: Y2, M2, D2
    EXPECT_EQ("1.1.30", NextDate(1, 1, 29));
    // Class3: Y1, M3, D3
    EXPECT_EQ("InvalidInput", NextDate(4, 2, 30));
    // Class4: Y2, M1, D4
    EXPECT_EQ("InvalidInput", NextDate(1, 4, 31));
}

TEST(EdgeTest, WeakRobust) {
    // Class5: Y3, M1, D1
    EXPECT_EQ("InvalidInput", NextDate(0, 4, 1));
    // Class6: Y1, M4, D1
    EXPECT_EQ("InvalidInput", NextDate(4, 0, 1));
    // Class7: Y1, M5, D1
    EXPECT_EQ("InvalidInput", NextDate(4, 13, 1));
    // Class8: Y1, M1, D5
    EXPECT_EQ("InvalidInput", NextDate(4, 4, 0));
    // Class9: Y1, M1, D6
    EXPECT_EQ("InvalidInput", NextDate(4, 4, 32));
}

TEST(EdgeTest, StrongNormal) {
    // Class10: Y1, M1, D2
    EXPECT_EQ("4.4.30", NextDate(4, 4, 29));
    // Class11: Y1, M1, D3
    EXPECT_EQ("4.5.1", NextDate(4, 4, 30));
    // Class12: Y1, M1, D4
    EXPECT_EQ("InvalidInput", NextDate(4, 4, 31));
    // Class13: Y1, M2, D1
    EXPECT_EQ("4.1.2", NextDate(4, 1, 1));
    // Class14: Y1, M2, D2
    EXPECT_EQ("4.1.30", NextDate(4, 1, 29));
    // Class15: Y1, M2, D3
    EXPECT_EQ("4.1.31", NextDate(4, 1, 30));
    // Class16: Y1, M2, D4
    EXPECT_EQ("4.2.1", NextDate(4, 1, 31));
    // Class17: Y1, M3, D1
    EXPECT_EQ("4.2.2", NextDate(4, 2, 1));
    // Class18: Y1, M3, D2
    EXPECT_EQ("4.3.1", NextDate(4, 2, 29));
    // Class19: Y1, M3, D4
    EXPECT_EQ("InvalidInput", NextDate(4, 2, 31));
    // Class20: Y2, M1, D1
    EXPECT_EQ("1.4.2", NextDate(1, 4, 1));
    // Class21: Y2, M1, D2
    EXPECT_EQ("1.4.30", NextDate(1, 4, 29));
    // Class22: Y2, M1, D3
    EXPECT_EQ("1.5.1", NextDate(1, 4, 30));
    // Class23: Y2, M2, D1
    EXPECT_EQ("1.1.2", NextDate(1, 1, 1));
    // Class24: Y2, M2, D3
    EXPECT_EQ("1.1.31", NextDate(1, 1, 30));
    // Class25: Y2, M2, D4
    EXPECT_EQ("1.2.1", NextDate(1, 1, 31));
    // Class26: Y2, M3, D1
    EXPECT_EQ("1.2.2", NextDate(1, 2, 1));
    // Class27: Y2, M3, D2
    EXPECT_EQ("InvalidInput", NextDate(1, 2, 29));
    // Class28: Y2, M3, D3
    EXPECT_EQ("InvalidInput", NextDate(1, 2, 30));
    // Class29: Y2, M3, D4
    EXPECT_EQ("InvalidInput", NextDate(1, 2, 31));
}

TEST(EdgeTest, StrongRobust) {
    // Class30: Y3, M4, D1
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 1));
    // Class31: Y3, M5, D1
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 1));
    // Class32: Y3, M1, D5
    EXPECT_EQ("InvalidInput", NextDate(0, 4, 0));
    // Class33: Y3, M1, D6
    EXPECT_EQ("InvalidInput", NextDate(0, 4, 32));
    // Class34: Y1, M4, D5
    EXPECT_EQ("InvalidInput", NextDate(4, 0, 0));
    // Class35: Y1, M4, D6
    EXPECT_EQ("InvalidInput", NextDate(4, 0, 32));
    // Class36: Y1, M5, D5
    EXPECT_EQ("InvalidInput", NextDate(4, 13, 0));
    // Class37: Y1, M5, D6
    EXPECT_EQ("InvalidInput", NextDate(4, 13, 32));
    // Class38: Y3, M4, D5
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 0));
    // Class39: Y3, M4, D6
    EXPECT_EQ("InvalidInput", NextDate(0, 0, 32));
    // Class40: Y3, M5, D5
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 0));
    // Class41: Y3, M5, D6
    EXPECT_EQ("InvalidInput", NextDate(0, 13, 32));
}
