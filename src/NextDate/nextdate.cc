#include "nextdate.h"

// Return the next date of input date
string NextDate(int y, int m, int d) {
    stringstream ss;
    string nextdate, year, month, day;
    
    // Validate the input
    if (y < 1 || m < 1 || m > 12 || d < 1 || d > 31)
        return "InvalidInput";

    // Generate next date
    if (d + 1 > 31) {
        if (m + 1 > 12) {
            y++;
            m = d = 1;
        } else {
            m++;
            d = 1;
        }
    } else {
        d++;
    }

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
