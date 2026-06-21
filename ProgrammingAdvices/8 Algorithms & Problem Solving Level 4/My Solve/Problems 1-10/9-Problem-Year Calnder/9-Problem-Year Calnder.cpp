

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

short NumberOfDaysInAMonth(short Year, short Month)
{
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}

short DayOrder(short Year, short Month, short Day)
{
    short a = (14 - Month) / 12;
    Year = Year - a;
    Month = Month + 12 * a - 2;
    return(Day + Year + (Year / 4) - (Year / 100) + (Year / 400) + (31 * Month / 12)) % 7;
}

string DayName(short Day)
{
    string DaysNames[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    return DaysNames[Day];
}

string MonthShortName(short Month)
{
    string MonthName[] = { "" , "Jan", "Feb", "Mar", "Apr", "May" ,"Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
    return MonthName[Month];
}

void PrintMonthCalender(short Year, short Month)
{

    printf("\n  _______________%s_______________\n", MonthShortName(Month).c_str());
    cout << "\n  Sun  Mon  Tue  Wed  Thu  Fri  Sat" << endl;
    short DayOre = DayOrder(Year, Month, 1);
    short NumberOfDays = NumberOfDaysInAMonth(Year, Month);

    for (int i = 1; i <= NumberOfDays + DayOre; i++)
    {
        if (i <= DayOre)
            cout << "     ";
        else
            cout << setw(5) << i - DayOre;
        if (i % 7 == 0)
            cout << endl;
    }
    printf("\n  _________________________________\n");



}


void PrintYearCalender(short Year)
{

    printf("\n  _________________________________\n");
    printf("\n          Calnder - %d", Year);
    printf("\n  _________________________________\n");


    for (int i = 1; i <= 12; i++)
    {
        PrintMonthCalender( Year , i);
    }


}


int main()
{
    short Year = ReadYear();
    cout << endl;



    PrintYearCalender(Year);

    system("pause>0");
}

