#include <iostream>
#include <iomanip>
using namespace std;


struct sDate
{
    short Year;
    short Month;
    short Day;

};

bool IsLeapYear(short Year)
{
    return ((Year % 400 == 0) || (Year % 4 == 0 && Year % 100 != 0));
}

short ReadYear()
{
    short Year;
    cout << "Please Enter A Year? ";
    cin >> Year;
    cout << endl;
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
    cout << endl;
    return  Month;
}

short ReadDay()
{
    short Day;

    do
    {
        cout << "\nPlease Enter A Day? ";
        cin >> Day;
    } while (Day > 31 || Day < 1);
    cout << endl;
    return  Day;
}

short NumberOfDaysInAMonth(short Month, short Year)
{
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}

sDate ReadFullDate()
{
    sDate Date;

    Date.Day = ReadDay();
    Date.Month = ReadMonth();
    Date.Year = ReadYear();

    return Date;
}

bool IsTheLastDayInAMonth(sDate Date)
{
    return (Date.Day == NumberOfDaysInAMonth(Date.Month, Date.Year));
}

bool IsTheLastMonthInAYear(sDate Date)
{
    return Date.Month == 12;
}

int main()
{
    sDate Date = ReadFullDate();

    if (IsTheLastDayInAMonth(Date))
        cout << "\n Yes, Day is The Last Day in Month.";
    else
        cout << "\n NO, Day is NOT The Last Day in Month.";

    if (IsTheLastMonthInAYear(Date))
        cout << "\n Yes, Month is The Last Month in Year.";
    else
        cout << "\n NO, Month is NOT The Last Month in Year.";

    system("pause>0");
    return 0;
}

