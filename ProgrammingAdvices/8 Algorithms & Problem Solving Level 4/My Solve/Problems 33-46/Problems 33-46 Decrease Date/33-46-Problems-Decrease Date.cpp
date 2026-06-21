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

sDate ReadFullDate()
{
    sDate Date;

    Date.Day = ReadDay();
    Date.Month = ReadMonth();
    Date.Year = ReadYear();

    return Date;
}

sDate DecreaseDateByOneDay(sDate Date)
{
    Date.Day--;
    if (Date.Day ==0)
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

void SwapDates(sDate& Date1, sDate& Date2)
{
    sDate TempDate = Date1;
    Date1 = Date2;
    Date2 = TempDate;
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


sDate DecreaseDateByXDay(int Days, sDate Date)
{
    for (int i = 1; i <= Days; i++)
    {
        Date = DecreaseDateByOneDay(Date);
    }

    return Date;
}

sDate DecreaseDateByOneWeek(sDate Date)
{
    for (int i = 1; i <= 7; i++)
    {
        Date = DecreaseDateByOneDay(Date);
    }

    return Date;
}

sDate DecreaseDateByXWeeks(int Weeks, sDate Date)
{
    for (int i = 1; i <= Weeks; i++)
    {
        Date = DecreaseDateByOneWeek(Date);
    }

    return Date;
}

sDate DecreaseDateByOneMonth(sDate Date)
{

    Date.Month--;
    if (Date.Month ==0)
    {
        Date.Year--;
        Date.Month = 12;
    
    }

    return Date;
}

sDate DecreaseDateByXMonths(int Months, sDate Date)
{

    for (int i = 1; i <= Months; i++)
        Date = DecreaseDateByOneMonth(Date);
    return Date;
}

sDate DecreaseDateByOneYear(sDate Date)
{
    Date.Year--;
    return Date;
}

sDate DecreaseDateByXYears(int Years, sDate Date)
{
    for (int i = 1; i <= Years; i++)
        Date = DecreaseDateByOneYear(Date);
    return Date;
}

sDate DecreaseDateByXYearsFaster(int Years, sDate Date)
{
    Date.Year -= Years;
    return Date;
}

sDate DecreaseDateByOneDecade(sDate Date)
{
    Date.Year -= 10;
    return Date;
}

sDate DecreaseDateByXDecades(int Decades, sDate Date)
{
    for (int i = 1; i <= 10 * Decades; i++)
        Date = DecreaseDateByOneYear(Date);
    return Date;
}

sDate DecreaseDateByXDecadesFaster(int Decades, sDate Date)
{
    Date.Year -= Decades * 10;
    return Date;
}

sDate DecreaseDateByOneCentury(sDate Date)
{
    Date.Year -= 100;
    return Date;
}

sDate DecreaseDateByOneMillennium(sDate Date)
{
    Date.Year -= 1000;
    return Date;
}

int main()
{
    sDate Date = ReadFullDate();

    cout << "\n Date After:\n";

    Date = DecreaseDateByOneDay(Date);
    cout << "\n01-Subtracting one day is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXDay(10, Date);
    cout << "\n02-Subtracting 10 days is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneWeek(Date);
    cout << "\n03-Subtracting one week is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXWeeks(10, Date);
    cout << "\n04-Subtracting 10 weeks is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneMonth(Date);
    cout << "\n05-Subtracting one month is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXMonths(5, Date);
    cout << "\n06-Subtracting 5 months is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneYear(Date);
    cout << "\n07-Subtracting one year is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXYears(10, Date);
    cout << "\n08-Subtracting 10 years is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXYearsFaster(10, Date);
    cout << "\n09-Subtracting 10 years (faster) is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneDecade(Date);
    cout << "\n10-Subtracting one Decade is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXDecades(10, Date);
    cout << "\n11-Subtracting 10 Decades is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByXDecadesFaster(10, Date);
    cout << "\n12-Subtracting 10 Decates (faster) is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneCentury(Date);
    cout << "\n13-Subtracting one Century is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = DecreaseDateByOneMillennium(Date);
    cout << "\n14-Subtracting one Millennium is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;


    system("pause>0");
    return 0;
}

