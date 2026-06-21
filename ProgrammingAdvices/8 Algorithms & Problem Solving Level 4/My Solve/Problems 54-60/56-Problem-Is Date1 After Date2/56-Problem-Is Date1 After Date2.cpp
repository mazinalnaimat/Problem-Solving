#include <iostream>
#include <iomanip>
using namespace std;


struct stDate
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


bool IstDate1EqualstDate2(stDate Date1, stDate Date2)
{
    return((Date1.Year == Date2.Year) && (Date1.Month == Date2.Month) && (Date1.Day == Date2.Day) ? true : false);
}

bool IstDate1BeforeDate2(stDate Date1, stDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : ((Date1.Year == Date2.Year) ? (Date1.Month < Date2.Month ? true : (Date1.Month ==  Date2.Month ? Date1.Day < Date2.Day : false)) : false);
}

bool IstDate1AfterDate2(stDate Date1, stDate Date2)
{
    return (!IstDate1BeforeDate2(Date1, Date2) && !IstDate1EqualstDate2(Date1, Date2)) ? true : false;
}

int main()
{
    cout << "Enter Date1:\n";
    stDate Date1 = ReadFullDate();
 
        cout << "\nEnter Date2:\n";
    stDate Date2 = ReadFullDate();

    if (IstDate1AfterDate2(Date1, Date2))
        cout << "\n Yes, Date 1 is After Date2.";
    else
        cout << "\n NO, Date 1 is NOT After Date2.";

    system("pause>0");
    return 0;
}

