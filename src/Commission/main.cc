#include <iostream>
#include "commission.h"

using namespace std;

int main(void) {
    int l, s, b;
    cin >> l >> s >> b;
    cout << Commission(l, s, b) << endl;

    return 0;
}
