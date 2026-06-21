
#include <iostream>
#include <iomanip>
using namespace std;


struct stDate
{
    short Year;
    short Month;
    short Day;

};

struct stPeriod
{
    stDate DateFrom;
    stDate DateTo;


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

short NumberOfDaysInAYear(short Year)
{
    return Year = IsLeapYear(Year) ? 366 : 365;
}

short NumberOfDaysInAMonth(short Month, short Year)
{
    return Month = Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31;
}

short NumberOfDaysFromTheBeginningOfTheYear(stDate Date)
{
    short NumDays = 0;
    for (int i = 1; i < Date.Month; i++)
    {
        NumDays += NumberOfDaysInAMonth(i, Date.Year);
    }
    NumDays += Date.Day;
    return NumDays;
}

stDate ReadFullDate()
{
    stDate Date;

    Date.Day = ReadDay();
    Date.Month = ReadMonth();
    Date.Year = ReadYear();

    return Date;
}

stPeriod ReadFullPeriod()
{
    stPeriod Period;

    cout << "\nEnter Start Date:\n\n";
    Period.DateFrom = ReadFullDate();
    cout << "\nEnter End Date:\n\n";
    Period.DateTo = ReadFullDate();

    return Period;
}

void SwapPeriods(stPeriod & Period1, stPeriod & Period2)
{
    stPeriod TempPeriod;
    TempPeriod = Period1;
    Period1 = Period2;
    Period2 = TempPeriod;

}

stDate DateAddDays(short Days, stDate Date)
{
    short RemainingDays = Days + NumberOfDaysFromTheBeginningOfTheYear(Date);
    short MonthDays = 0;
    Date.Month = 1;
    while (true)
    {
        MonthDays = NumberOfDaysInAMonth(Date.Month, Date.Year);
        if (RemainingDays > MonthDays)
        {
            RemainingDays -= MonthDays;
            Date.Month++;
            if (Date.Month > 12)
            {
                Date.Month = 1;
                Date.Year++;
            }
        }
        else
        {
            Date.Day = RemainingDays;
            break;
        }
    }
    return Date;
}

bool IsDate1EqualstDate2(stDate Date1, stDate Date2)
{
    return((Date1.Year == Date2.Year) && (Date1.Month == Date2.Month) && (Date1.Day == Date2.Day) ? true : false);
}

bool IsDate1BeforeDate2(stDate Date1, stDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : ((Date1.Year == Date2.Year) ? (Date1.Month < Date2.Month ? true : (Date1.Month == Date2.Month ? Date1.Day < Date2.Day : false)) : false);
}

bool IstDate1AfterDate2(stDate Date1, stDate Date2)
{
    return (!IsDate1BeforeDate2(Date1, Date2) && !IsDate1EqualstDate2(Date1, Date2)) ? true : false;
}

bool IsOverlapPeriods(stPeriod Period1, stPeriod Period2)
{/*

 //My Solve
        if (!IstDate1BeforeDate2(Period2.DateFrom, Period1.DateTo) && IstDate1AfterDate2(Period2.DateTo, Period1.DateFrom))
            SwapPeriods(Period1, Period2);
  
        if ((IstDate1BeforeDate2(Period2.DateFrom, Period1.DateTo) && IstDate1AfterDate2(Period2.DateTo, Period1.DateFrom)) || IstDate1EqualstDate2(Period1.DateFrom, Period2.DateTo) || IstDate1EqualstDate2(Period1.DateTo, Period2.DateFrom))
            return true;
        else
            return false;
   */ 

    return (IstDate1AfterDate2(Period1.DateFrom, Period2.DateTo) || IsDate1BeforeDate2(Period1.DateTo, Period2.DateFrom)) ? false : true;
}



int main()
{
    cout << "Enter Period 1:";
    stPeriod Period1 = ReadFullPeriod();

    cout << "\nEnter Period 2:";
    stPeriod Period2 = ReadFullPeriod();

    if (IsOverlapPeriods(Period1, Period2))
        cout << "\nYes, Periods Overlap";
    else
        cout << "\nNO, Periods do NOT Overlap";

  
    system("pause>0");
    return 0;
}

