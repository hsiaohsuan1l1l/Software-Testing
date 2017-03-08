#include "triangle.h"

// Return Equilateral or Isosceles or NotATriangle or Scalene
string Triangle(int a, int b, int c) {
    if (a <= 0 || b <= 0 || c <= 0)
        return "NotATriangle";
    if (a + b <= c || a + c <= b || b + c <= a)
        return "NotATriangle";
    if (a == b && b == c)
        return "Equilateral";
    if (a == b || a == c || b == c)
        return "Isosceles";
    
    return "Scalene";
}
