#include "commission.h"

// Return the sales value
string Commission(int l, int s, int b) {
    stringstream ss;
    string comm_str;
    double sales, comm;
    
    // Validate the input
    if (l < 1 | l > 70 | s < 1 | s > 80 | b < 1 | b > 90)
        return "InvalidInput";

    // Calculate the sales
    sales = l * 45 + s * 30 + b * 25;

    // Calculate the commission
    if (sales >= 1800)
        comm = 0.1 * 1000 + 0.15 * 800 + 0.2 * (sales - 1800);
    else if (sales >= 1000)
        comm = 0.1 * 1000 + 0.15 * (sales - 1000);
    else
        comm = 0.1 * sales;

    // Format the answer
    ss << fixed << setprecision(2) << comm;
    ss >> comm_str;
    ss.str("");
    ss.clear();
    comm_str = "$" + comm_str;

    return comm_str;
}
