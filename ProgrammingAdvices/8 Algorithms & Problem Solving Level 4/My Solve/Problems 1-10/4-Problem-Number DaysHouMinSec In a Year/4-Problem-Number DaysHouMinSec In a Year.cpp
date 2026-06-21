

#include <iostream>
using namespace std;

bool IsLeapYear(short Year)
{
    return ((Year % 400 == 0) || (Year % 4 == 0 && Year % 100 != 0));
}

short ReadYear()
{
    short Year;
    cout << "Please Enter A Year To Check? ";
    cin >> Year;
    return  Year;
}

short NumberOfDaysInYear(short Year)
{
    return Year = IsLeapYear(Year) ? 366 : 365;
}

short NumberOfHoursInYear(short Year)
{
    return NumberOfDaysInYear(Year) * 24;
}

int NumberOfMinutessInYear(short Year)
{
    return NumberOfHoursInYear(Year) * 60;
}

int NumberOfSecondsInYear(short Year)
{
return NumberOfMinutessInYear(Year) * 60;
}

int main()
{
    short Year = ReadYear();

    cout << "Number of Days    in Year [" << Year << "] is " << NumberOfDaysInYear(Year) << endl;
    cout << "Number of Hours   in Year [" << Year << "] is " << NumberOfHoursInYear(Year) << endl;
    cout << "Number of Minutes in Year [" << Year << "] is " << NumberOfMinutessInYear(Year) << endl;
    cout << "Number of Seconds in Year [" << Year << "] is " << NumberOfSecondsInYear(Year) << endl;


}

