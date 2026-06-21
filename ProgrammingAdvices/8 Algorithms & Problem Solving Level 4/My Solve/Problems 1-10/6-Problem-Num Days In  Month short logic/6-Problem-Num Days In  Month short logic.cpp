

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

short ReadMonth()
{
    short Month;

    do
    {
        cout << "Please Enter A Month To Check? ";
        cin >> Month;
    } while (Month > 12 || Month < 1);
    return  Month;
}

short NumberOfDaysInMonth(short Year, short Month)
{ 
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 :28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}



int main()
{
    short Year = ReadYear();
    cout << endl;

    short Month = ReadMonth();


    cout << endl;
    cout << "Number of Days    in Month [" << Month << "] is " << NumberOfDaysInMonth(Year, Month) << endl;


}

