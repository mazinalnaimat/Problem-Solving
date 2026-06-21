#include <iostream>
using namespace std;

bool IsLeapYear(short Year)
{
     return ((Year % 400 ==0) || (Year % 4 ==0 && Year % 100 !=0));
}

short ReadYear()
{
    short Year;
    cout << "Please Enter The Year? ";
    cin >> Year;
    return  Year;
}

int main()
{
    short Year = ReadYear();

    if (IsLeapYear(Year))

        cout << "\nYes, Year [" << Year << "] is a leap year.\n";
    else
        cout << "\No, Year [" << Year << "] is NOT a leap year.\n";

    system("pause>0");
}
