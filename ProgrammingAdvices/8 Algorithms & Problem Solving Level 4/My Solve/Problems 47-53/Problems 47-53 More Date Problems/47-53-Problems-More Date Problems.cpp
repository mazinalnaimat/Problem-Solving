#pragma warning(disable : 4996)

#include <iostream>
#include <iomanip>
#include<ctime>
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

int ReadDaysToAdd()
{
    int Days = 0;
    cout << "How many days to add? ";
    cin >> Days;
    return Days;
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

sDate ReadFullDate()
{
    sDate Date;

    Date.Day = ReadDay();
    Date.Month = ReadMonth();
    Date.Year = ReadYear();

    return Date;
}

short NumberOfDaysInAMonth(short Month, short Year)
{
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}

short NumberOfDaysInAYear(short Year)
{
    return IsLeapYear(Year) ? 366 : 365;
}

short NumberOfDaysFromTheBeginningOfTheYear(sDate Date)
{
    short NumDays = 0;
    for (int i = 1; i < Date.Month; i++)
    {
        NumDays += NumberOfDaysInAMonth(i, Date.Year);
    }
    NumDays += Date.Day;
    return NumDays;
}

sDate IncreaseDateByOneDay(sDate Date)
{
    Date.Day++;
    if (Date.Day > NumberOfDaysInAMonth(Date.Month, Date.Year))
    {
        Date.Day = 1;
        Date.Month++;
    }
    if (Date.Month > 12)
    {

        Date.Month = 1;
        Date.Year++;
    }

    return Date;
}

bool IsDate1BeforeDate2(sDate Date1, sDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : (Date1.Month < Date2.Month) ? true : (Date1.Day < Date2.Day ? true : false);
}

void SwapDates(sDate& Date1, sDate& Date2)
{
    sDate TempDate = Date1;
    Date1 = Date2;
    Date2 = TempDate;
}

short DayOfWeekOrder(short Day, short Month, short Year)
{
    short a = (14 - Month) / 12;
    Year = Year - a;
    Month = Month + 12 * a - 2;
    return(Day + Year + (Year / 4) - (Year / 100) + (Year / 400) + (31 * Month / 12)) % 7;
}

short DayOfWeekOrder(sDate Date)
{
    return DayOfWeekOrder(Date.Day, Date.Month, Date.Year);
}

string DayShortName(short Day)
{
    string DaysNames[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    return DaysNames[Day];
}

sDate GetTodayDate()
{
    sDate Today;

    time_t TodayDate = time(0);

    tm* now = localtime(&TodayDate);

    Today.Day = now->tm_mday;
    Today.Month = now->tm_mon + 1;
    Today.Year = now->tm_year + 1900;
    return Today;
}

bool IsItEndOfWeek(sDate Date)
{
    return DayOfWeekOrder(Date) == 6 ? true : false;
}

bool IsItWeekend(sDate Date)
{
    return DayOfWeekOrder(Date) == 6 || DayOfWeekOrder(Date) == 5 ? true : false;
}

bool IsItBusinessDay(sDate Date)
{
    return !IsItWeekend(Date);
}

short DaysUntilEndOfWeek(sDate Date)
{/*
    short Days = 0;
    while (DayOfWeekOrder(Date) != 6)
    {
        Days++;
        Date = IncreaseDateByOneDay(Date);
    }
    return Days;*/
    return 6 - DayOfWeekOrder(Date);
}


sDate DecreaseDateByOneDay(sDate Date)
{
    Date.Day--;
    if (Date.Day == 0)
    {
        Date.Month--;
        Date.Day = NumberOfDaysInAMonth(Date.Month, Date.Year);

    }
    if (Date.Month == 0)
    {
        Date.Year--;
        Date.Month = 12;

    }

    return Date;
}

int GetDifferenceInDays(sDate Date1, sDate Date2, bool IncludeEndDay = false)
{
    int NumDays = 0;
    short SwapFlagValue = 1;
    if (!IsDate1BeforeDate2(Date1, Date2))
    {
        SwapDates(Date1, Date2);
        SwapFlagValue = -1;

    }


    while (IsDate1BeforeDate2(Date1, Date2))
    {
        Date1 = IncreaseDateByOneDay(Date1);
        NumDays++;
    }
    return IncludeEndDay ? SwapFlagValue * ++NumDays : SwapFlagValue * NumDays;


}

short DaysUntilEndOfMonth(sDate Date)
{/*#1

        short Days = 0;
        short Month = NumberOfDaysInAMonth(Date.Month, Date.Year);
        while (Month  >= Date.Day)
        {
            Days++;
           if( Month != Date.Day)
            Date = IncreaseDateByOneDay(Date);
           else
           return Days;
         }
    */


    /*#2*/

    sDate EndOfMonthDate;
    EndOfMonthDate.Day = NumberOfDaysInAMonth(Date.Month, Date.Year);
    EndOfMonthDate.Month = Date.Month;
    EndOfMonthDate.Year = Date.Year;

    return GetDifferenceInDays(Date, EndOfMonthDate, true);
    /**/

  //#3
    //return  NumberOfDaysInAMonth(Date.Month, Date.Year) - Date.Day;
}

short DaysUntilEndOfYear(sDate Date)
{
    /*#1
        short Days = 0;
        short Year = NumberOfDaysInAYear(Date.Year);
        while (Year >= NumberOfDaysFromTheBeginningOfTheYear(Date))
        {
            Days++;
            if (Year != NumberOfDaysFromTheBeginningOfTheYear(Date))
                Date = IncreaseDateByOneDay(Date);
            else
                return Days;
        }

    return Days;
      */


      //#2
    sDate EndOfYearDate;
    EndOfYearDate.Day = 31;
    EndOfYearDate.Month = 12;
    EndOfYearDate.Year = Date.Year;

    return GetDifferenceInDays(Date, EndOfYearDate, true);


}


int main()
{
    sDate Date = GetTodayDate();


    cout << "Today is " << DayShortName(DayOfWeekOrder(Date)) << " , ";

    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;


    cout << "\n\nIs It End Of Week?";
    if (IsItEndOfWeek(Date))
    {
        cout << "\nYes,it is End Of Week.";
    }
    else
        cout << "\nNO,it is NOt End Of Week.";

    cout << "\n\nIs It Weekend?";
    if (IsItWeekend(Date))
    {
        cout << "\nYes,it is Weekend.";
    }
    else
        cout << "\nNO, it is NOT Weekend.Today is " << DayShortName(DayOfWeekOrder(Date));


    cout << "\n\nIs It Business Day?";
    if (IsItBusinessDay(Date))
    {
        cout << "\nYes,it is Business Day.";
    }
    else
        cout << "\nNO,it is NOt Business Day";


    cout << "\n\n Days Until End Of Week : " << DaysUntilEndOfWeek(Date) << " Days(s).";

    cout << "\n Days Until End Of Month : " << DaysUntilEndOfMonth(Date) << " Days(s).";

    cout << "\n Days Until End Of Year : " << DaysUntilEndOfYear(Date) << " Days(s).";


    system("pause>0");
    return 0;
}

