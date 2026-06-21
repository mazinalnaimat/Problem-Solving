

#include <iostream>
#include <iomanip>
using namespace std;



bool IsLeapYear(short Year)
{
    return ((Year % 400 == 0) || (Year % 4 == 0 && Year % 100 != 0));
}

short ReadYear()
{
    short Year;
    cout << "Please Enter A Year? ";
    cin >> Year;
    return  Year;
}

short ReadMonth()
{
    short Month;

    do
    {
        cout << "Please Enter A Month? ";
        cin >> Month;
    } while (Month > 12 || Month < 1);
    return  Month;
}

short ReadDay()
{
    short Day;

    do
    {
        cout << "Please Enter A Day? ";
        cin >> Day;
    } while (Day > 31 || Day < 1);
    return  Day;
}

short NumberOfDaysInMonth(short Month, short Year)
{
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}

short NumbersOfDaysFromTheBeginningOfTheYear(short Day, short Month, short Year)
{
    short NumDays = 0;
    for (int i = 1; i < Month; i++)
    {
        NumDays += NumberOfDaysInMonth(i, Year);
    }
    NumDays += Day;
    return NumDays;
}


int main()
{
    short Day = ReadDay();
    cout << endl;

    short Month = ReadMonth();
    cout << endl;

    short Year = ReadYear();
    cout << endl;

 
  

    cout << "Number of days from the beginning of the year is " << 
        NumbersOfDaysFromTheBeginningOfTheYear(Day, Month, Year);

    system("pause>0");
}

