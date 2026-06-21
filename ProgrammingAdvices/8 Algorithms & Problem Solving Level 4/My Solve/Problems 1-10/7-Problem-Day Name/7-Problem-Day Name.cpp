

#include <iostream>
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

short DayOrder(short Year, short Month, short Day) 
{
    short a = (14 - Month) / 12;
    Year = Year - a;
    Month = Month + 12 * a - 2;
    return(Day + Year + (Year / 4) - (Year /100) + (Year / 400) + (31 * Month / 12)) % 7;
}

string DayName(short Day)
{
    string DaysNames[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    return DaysNames[Day];
}


int main()
{
    short Year = ReadYear();
    cout << endl;

    short Month = ReadMonth();
    cout << endl;

    short Day = ReadDay();
    cout << endl;

    short DayOre = DayOrder( Year, Month , Day);

    cout << "Date      :" << Day << "/" << Month << "/" << Year << endl;
    cout << "Day Order : " << DayOre << endl;
    cout << "Day Name  : " << DayName(DayOre) << endl;
    system("pause>0");
}

