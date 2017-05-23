#include <iostream>
#include "triangle.h"

using namespace std;

int main(void) {
    int a, b, c;
    cin >> a >> b >> c;
    cout << Triangle(a, b, c) << endl;

    return 0;
}
