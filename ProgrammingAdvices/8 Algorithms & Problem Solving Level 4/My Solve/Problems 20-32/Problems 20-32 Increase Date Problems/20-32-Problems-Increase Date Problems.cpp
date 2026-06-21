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

void SwapDates(sDate& Date1, sDate& Date2)
{
    sDate TempDate = Date1;
    Date1 = Date2;
    Date2 = TempDate;
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

sDate IncreaseDateByXDay(int Days,sDate Date)
{
    for (int i = 1; i <= Days; i++)
    {
        Date = IncreaseDateByOneDay(Date);
    }
   
    return Date;
}

sDate IncreaseDateByOneWeek(sDate Date)
{
    for (int i = 1; i <= 7; i++)
    {
        Date = IncreaseDateByOneDay(Date);
    }

    return Date;
}

sDate IncreaseDateByXWeeks(int Weeks, sDate Date)
{
    for (int i = 1; i <= Weeks; i++)
    {
        Date = IncreaseDateByOneWeek(Date);
    }

    return Date;
}

sDate IncreaseDateByOneMonth(sDate Date)
{
   
        Date.Month++;
        if (Date.Month > 12)
        {
            Date.Month = 1;
            Date.Year++;
        }

    return Date;
}

sDate IncreaseDateByXMonths(int Months, sDate Date)
{

    for(int i =1 ; i  <= Months; i++)
    Date = IncreaseDateByOneMonth(Date);
    return Date;
}

sDate IncreaseDateByOneYear(sDate Date)
{
    Date.Year++;
       return Date;
}

sDate IncreaseDateByXYears(int Years, sDate Date)
{
    for (int i = 1; i <= Years; i++)
        Date = IncreaseDateByOneYear(Date);
    return Date;
}

sDate IncreaseDateByXYearsFaster(int Years, sDate Date)
{
    Date.Year += Years;
    return Date;
}

sDate IncreaseDateByOneDecade(sDate Date)
{
    Date.Year +=10;
    return Date;
}

sDate IncreaseDateByXDecades(int Decades, sDate Date)
{
    for (int i = 1; i <= 10 * Decades; i++)
        Date = IncreaseDateByOneYear(Date);
    return Date;
}

sDate IncreaseDateByXDecadesFaster(int Decades, sDate Date)
{
        Date.Year += Decades * 10;
    return Date;
}

sDate IncreaseDateByOneCentury(sDate Date)
{
    Date.Year +=100;
    return Date;
}

sDate IncreaseDateByOneMillennium(sDate Date)
{
    Date.Year +=1000;
    return Date;
}

int main()
{
    sDate Date = ReadFullDate();

    cout << "\n Date After:\n";

    Date = IncreaseDateByOneDay(Date);
    cout << "\n01-Adding one day is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXDay(10, Date);
    cout << "\n02-Adding 10 days is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByOneWeek(Date);
    cout << "\n03-Adding one week is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXWeeks(10,Date);
    cout << "\n04-Adding 10 weeks is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;
    
    Date = IncreaseDateByOneMonth(Date);
    cout << "\n05-Adding one month is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXMonths(5, Date);
    cout << "\n06-Adding 5 months is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByOneYear(Date);
    cout << "\n07-Adding one year is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXYears(10, Date);
    cout << "\n08-Adding 10 years is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;
   
    Date = IncreaseDateByXYearsFaster(10, Date);
    cout << "\n09-Adding 10 years (faster) is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByOneDecade(Date);
    cout << "\n10-Adding one Decade is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXDecades(10, Date);
    cout << "\n11-Adding 10 Decades is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByXDecadesFaster(10 ,Date);
    cout << "\n12-Adding 10 Decates (faster) is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByOneCentury(Date);
    cout << "\n13-Adding one Century is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;

    Date = IncreaseDateByOneMillennium(Date);
    cout << "\n14-Adding one Millennium is:";
    cout << Date.Day << "/" << Date.Month << "/" << Date.Year;


    system("pause>0");
    return 0;
}

