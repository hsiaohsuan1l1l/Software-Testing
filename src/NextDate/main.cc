#include <iostream>
#include "nextdate.h"

using namespace std;

int main(void) {
    int y, m, d;
    cin >> y >> m >> d;
    cout << NextDate(y, m, d) << endl;

    return 0;
}
