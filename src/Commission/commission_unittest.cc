#include "commission.h"
#include "gtest/gtest.h"

// Boundary Value Test
    // Boundary of output from sales: min, 1000, 1800, max
    // 1 <= l <= 70 $45    1000 10%
    // 1 <= s <= 80 $30    800  15%
    // 1 <= b <= 90 $25    ~    20%
TEST(BVTest, WeakNormal) {
    // No Boundary
    EXPECT_EQ("$50", Commission(5, 5, 5));        // sales=500
    EXPECT_EQ("$160", Commission(14, 14, 14));    // sales=1400
    EXPECT_EQ("$820", Commission(48, 48, 48));    // sales=4800
    // Valid Single/Multiple Near Boundary
    EXPECT_EQ("$12.5", Commission(1, 1, 2));      // sales=125
    EXPECT_EQ("$13", Commission(1, 2, 1));        // sales=130
    EXPECT_EQ("$14.5", Commission(2, 1, 1));      // sales=145
    EXPECT_EQ("$95.5", Commission(9, 10, 10));    // sales=955
    EXPECT_EQ("$97", Commission(10, 9, 10));      // sales=970
    EXPECT_EQ("$97.5", Commission(10, 10, 9));    // sales=975
    EXPECT_EQ("$103.75", Commission(10, 10, 11)); // sales=1025
    EXPECT_EQ("$104.5", Commission(10, 11, 10));  // sales=1030
    EXPECT_EQ("$106.75", Commission(11, 10, 10)); // sales=1045
    EXPECT_EQ("$213.25", Commission(17, 18, 18)); // sales=1755
    EXPECT_EQ("$215.5", Commission(18, 17, 18));  // sales=1770
    EXPECT_EQ("$216.25", Commission(18, 18, 17)); // sales=1775
    EXPECT_EQ("$225", Commission(18, 18, 19));    // sales=1825
    EXPECT_EQ("$226", Commission(18, 19, 18));    // sales=1830
    EXPECT_EQ("$229", Commission(19, 18, 18));    // sales=1845
    EXPECT_EQ("$1411", Commission(69, 80, 90));   // sales=7755
    EXPECT_EQ("$1414", Commission(70, 79, 90));   // sales=7770
    EXPECT_EQ("$1415", Commission(70, 80, 89));   // sales=7775
}

TEST(BVTest, WeakRobust) {
    // Invalid Single Near Boundary
    EXPECT_EQ("InvalidInput", Commission(0, 40, 45));
    EXPECT_EQ("InvalidInput", Commission(71, 40, 45));
    EXPECT_EQ("InvalidInput", Commission(35, 0, 45));
    EXPECT_EQ("InvalidInput", Commission(35, 81, 45));
    EXPECT_EQ("InvalidInput", Commission(35, 40, 0));
    EXPECT_EQ("InvalidInput", Commission(35, 40, 91));
}

TEST(BVTest, StrongNormal) {
    // Valid Multiple Boundary
    EXPECT_EQ("$10", Commission(1, 1, 1));      // sales=100
    EXPECT_EQ("$100", Commission(10, 10, 10));  // sales=1000
    EXPECT_EQ("$220", Commission(18, 18, 18));  // sales=1800
    EXPECT_EQ("$1420", Commission(70, 80, 90)); // sales=7800
}

TEST(BVTest, StrongRobust) {
    // Invalid Multiple Near Boundary
    EXPECT_EQ("InvalidInput", Commission(0, 0, 45));
    EXPECT_EQ("InvalidInput", Commission(0, 81, 45));
    EXPECT_EQ("InvalidInput", Commission(71, 0, 45));
    EXPECT_EQ("InvalidInput", Commission(71, 81, 45));
    EXPECT_EQ("InvalidInput", Commission(0, 40, 0));
    EXPECT_EQ("InvalidInput", Commission(0, 40, 91));
    EXPECT_EQ("InvalidInput", Commission(71, 40, 0));
    EXPECT_EQ("InvalidInput", Commission(71, 40, 91));
    EXPECT_EQ("InvalidInput", Commission(35, 0, 0));
    EXPECT_EQ("InvalidInput", Commission(35, 0, 91));
    EXPECT_EQ("InvalidInput", Commission(35, 81, 0));
    EXPECT_EQ("InvalidInput", Commission(35, 81, 91));
    EXPECT_EQ("InvalidInput", Commission(0, 0, 0));
    EXPECT_EQ("InvalidInput", Commission(0, 0, 91));
    EXPECT_EQ("InvalidInput", Commission(0, 81, 0));
    EXPECT_EQ("InvalidInput", Commission(0, 81, 91));
    EXPECT_EQ("InvalidInput", Commission(71, 0, 0));
    EXPECT_EQ("InvalidInput", Commission(71, 0, 91));
    EXPECT_EQ("InvalidInput", Commission(71, 81, 0));
    EXPECT_EQ("InvalidInput", Commission(71, 81, 91));
}

// Equivalence Class Test
    // L1: 1 <= l <= 70
    // L2: l = -1
    // L3: l = 0 or l < -1 (invalid)
    // L4: l > 70 (invalid)
    // S1: 1 <= s <= 80
    // S2: s < 1 (invalid)
    // S3: s > 80 (invalid)
    // B1: 1 <= b <= 90
    // B2: b < 1 (invalid)
    // B3: b > 90 (invalid)
TEST(ECTest, WeakNormal) {
    // Class1: L1, S1, B1
    EXPECT_EQ("$640", Commission(35, 40, 45));
    // Class2: L2, S1, B1
    EXPECT_EQ("ProgramTerminates", Commission(-1, 40, 45));
}

TEST(ECTest, WeakRobust) {
    // Class3: L3, S1, B1
    EXPECT_EQ("InvalidInput", Commission(-2, 40, 45));
    // Class4: L4, S1, B1
    EXPECT_EQ("InvalidInput", Commission(71, 40, 45));
    // Class5: L1, S2, B1
    EXPECT_EQ("InvalidInput", Commission(35, -1, 45));
    // Class6: L1, S3, B1
    EXPECT_EQ("InvalidInput", Commission(35, 81, 45));
    // Class7: L1, S1, B2
    EXPECT_EQ("InvalidInput", Commission(35, 40, -1));
    // Class8: L1, S1, B3
    EXPECT_EQ("InvalidInput", Commission(35, 40, 91));
}

TEST(ECTest, StrongNormal) {
    // No valid subintervals exist, strong normal = weak normal
}

TEST(ECTest, StrongRobust) {
    // Class9: L3, S2, B1
    EXPECT_EQ("InvalidInput", Commission(-2, -1, 45));
    // Class10: L3, S3, B1
    EXPECT_EQ("InvalidInput", Commission(-2, 81, 45));
    // Class11: L4, S2, B1
    EXPECT_EQ("InvalidInput", Commission(71, -1, 45));
    // Class12: L4, S3, B1
    EXPECT_EQ("InvalidInput", Commission(71, 81, 45));
    // Class13: L3, S1, B2
    EXPECT_EQ("InvalidInput", Commission(-2, 40, -1));
    // Class14: L3, S1, B3
    EXPECT_EQ("InvalidInput", Commission(-2, 40, 91));
    // Class15: L4, S1, B2
    EXPECT_EQ("InvalidInput", Commission(71, 40, -1));
    // Class16: L4, S1, B3
    EXPECT_EQ("InvalidInput", Commission(71, 40, 91));
    // Class17: L1, S2, B2
    EXPECT_EQ("InvalidInput", Commission(35, -1, -1));
    // Class18: L1, S2, B3
    EXPECT_EQ("InvalidInput", Commission(35, -1, 91));
    // Class19: L1, S3, B2
    EXPECT_EQ("InvalidInput", Commission(35, 81, -1));
    // Class20: L1, S3, B3
    EXPECT_EQ("InvalidInput", Commission(35, 81, 91));
    // Class21: L3, S2, B2
    EXPECT_EQ("InvalidInput", Commission(-2, -1, -1));
    // Class22: L3, S2, B3
    EXPECT_EQ("InvalidInput", Commission(-2, -1, 91));
    // Class23: L3, S3, B2
    EXPECT_EQ("InvalidInput", Commission(-2, 81, -1));
    // Class24: L3, S3, B3
    EXPECT_EQ("InvalidInput", Commission(-2, 81, 91));
    // Class25: L4, S2, B2
    EXPECT_EQ("InvalidInput", Commission(71, -1, -1));
    // Class26: L4, S2, B3
    EXPECT_EQ("InvalidInput", Commission(71, -1, 91));
    // Class27: L4, S3, B2
    EXPECT_EQ("InvalidInput", Commission(71, 81, -1));
    // Class28: L4, S3, B3
    EXPECT_EQ("InvalidInput", Commission(71, 81, 91));
}
