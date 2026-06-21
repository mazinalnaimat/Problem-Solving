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


sDate IncreaseDateByXDay(int Days, sDate Date)
{
    for (int i = 1; i <= Days; i++)
    {
        Date = IncreaseDateByOneDay(Date);
    }

    return Date;
}

bool IsDate1BeforeDate2(sDate Date1, sDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : (Date1.Month < Date2.Month) ? true : (Date1.Day < Date2.Day ? true : false);
}

string DayShortName(short Day)
{
    string DaysNames[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    return DaysNames[Day];
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

bool IsItWeekend(sDate Date)
{
    return DayOfWeekOrder(Date) == 6 || DayOfWeekOrder(Date) == 5 ? true : false;
}

bool IsItBusinessDay(sDate Date)
{
    return !IsItWeekend(Date);
}

short CalculateVacationDays(sDate StartDate, sDate EndDate)
{
    short NumbDays = 0;

    while (IsDate1BeforeDate2(StartDate, EndDate))
    {
        if (IsItBusinessDay(StartDate))
            NumbDays++;
        StartDate = IncreaseDateByOneDay(StartDate);
    }
    return NumbDays;
}

sDate ReturnDateAfterVacation(short VacationDays, sDate StartDate)
{/*
 
    //My Solve
        sDate ReturnDate = StartDate;
        for(int i = 1 ; i <= VacationDays;i++)
        {
            if(IsItWeekend(ReturnDate))
                ReturnDate = IncreaseDateByOneDay(ReturnDate);
            ReturnDate = IncreaseDateByOneDay(ReturnDate);
        }

        while  (IsItWeekend(ReturnDate))
        {
            ReturnDate = IncreaseDateByOneDay(ReturnDate);
        }
        return ReturnDate;
        */

    //Teacher solve
    short WeekEndCounter = 0;

     for (short i = 1; i <= VacationDays; i++)
     {

     if (IsItWeekend(StartDate))
     WeekEndCounter++;

     StartDate = IncreaseDateByOneDay(StartDate);

     }

     //to add weekends
     for (short i = 1; i <= WeekEndCounter; i++)
         StartDate = IncreaseDateByOneDay(StartDate);

     return StartDate;
   


}

int main()
{
    cout << "\nVacation Starts:\n";
    sDate StartDate = ReadFullDate();
    short VacationDays;


    cout << "\nPlease enter vacation days? " ;
    cin >> VacationDays;


    sDate EndDate = ReturnDateAfterVacation(VacationDays, StartDate);

    cout << "\nReturn Date: ";
    cout << DayShortName(DayOfWeekOrder(EndDate));
    cout << " , " << EndDate.Day << "/" << EndDate.Month << "/" << EndDate.Year;



    system("pause>0");
    return 0;
}

