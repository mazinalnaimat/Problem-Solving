

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
        cout << "Please Enter A Day? ";
        cin >> Day;
    } while (Day > 31 || Day < 1);
    cout << endl;
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

struct sDate
{
    short Year;
    short Month;
    short Day;

};

sDate GetDateFromDayOrderInYear(short DaysNumber, short Year)
{
    sDate Date;
    short DaysNum = DaysNumber;
    short Month;
    short Day;

    for (int i = 1; i <= 12; i++)
    {
        if (NumberOfDaysInMonth(i, Year) < DaysNumber)
        {
            DaysNumber -= NumberOfDaysInMonth(i, Year);
        }
        else
        {
            Month = i;
            Day = DaysNumber;
            break;
        }
    }

    
    Date.Day = Day;
    Date.Month = Month;
    Date.Year = Year;

    return Date;
}


int main()
{
    short Day = ReadDay();
    short Month = ReadMonth();
    short Year = ReadYear();
    short DaysOrederInYear = NumbersOfDaysFromTheBeginningOfTheYear(Day, Month, Year);
 
    cout << "Number of days from the beginning of the year is " << DaysOrederInYear << "\n\n";
 

    sDate Date;
    Date = GetDateFromDayOrderInYear(DaysOrederInYear, Year);
    cout << "Date for [" << DaysOrederInYear << "] is: ";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    system("pause>0");
    return 0;
}

