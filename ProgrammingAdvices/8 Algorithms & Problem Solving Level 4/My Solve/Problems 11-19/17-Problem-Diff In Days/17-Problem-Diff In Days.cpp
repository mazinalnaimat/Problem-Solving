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

bool IsDate1BeforeDate2(sDate Date1, sDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : (Date1.Month < Date2.Month) ? true : (Date1.Day < Date2.Day ? true : false);
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

int GetDifferenceInDays(sDate Date1, sDate Date2,bool IncludeEndDay = false)
{
    int NumDays = 0;
    while (IsDate1BeforeDate2(Date1, Date2))
    {
        Date1 = IncreaseDateByOneDay(Date1);
        NumDays++;
    } 
    return IncludeEndDay ? ++NumDays : NumDays;
}

int main()
{
    sDate Date1 = ReadFullDate();
    sDate Date2 = ReadFullDate();
    int NumDays = GetDifferenceInDays(Date1, Date2);
    int NumDaysWithEndDay = GetDifferenceInDays(Date1, Date2 ,true);

 
    cout << "\n Difference is: " << NumDays << " Day(s).";
    cout << "\n Difference (Including End Day) is: " << NumDaysWithEndDay  << " Day(s).";

    system("pause>0");
    return 0;
}

