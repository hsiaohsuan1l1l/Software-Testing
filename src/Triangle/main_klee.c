#include <stdio.h>
#include "klee/klee.h"


// Return Equilateral or Isosceles or NotATriangle or Scalene
const char* Triangle(int a, int b, int c) {
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


int main(void) {
    int a, b, c;
    const char* ans;

    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");

    ans = Triangle(a, b, c);
    printf("%s\n", ans);

    return 0;
}
