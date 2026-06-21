#include <iostream>
using namespace std;

bool IsLeapYear(short Year)
{
    if (Year % 400 == 0)
    {
        return true;
    }
    else if(Year % 4 == 0 && Year % 100 !=0)
    {
        return true;
    }
    else
        return false;
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
