#include "nextdate.h"

// Return the next date of input date
string NextDate(int y, int m, int d) {
    stringstream ss;
    string nextdate, year, month, day;

    // Generate next date
    d++;

    // Convert int to string
    ss << y;
    ss >> year;
    ss.str("");
    ss.clear();
    ss << m;
    ss >> month;
    ss.str("");
    ss.clear();
    ss << d;
    ss >> day;
    ss.str("");
    ss.clear();

    // Format the answer
    nextdate = year + "." + month + "." + day;

    return nextdate;
}
