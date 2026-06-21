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
    cout << endl;
    return  Month;
}

short ReadDay()
{
    short Day;

    do
    {
        cout << "\nPlease Enter A Day? ";
        cin >> Day;
    } while (Day > 31 || Day < 1);
    cout << endl;
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

sDate DateAddDays(short Days, sDate Date)
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

bool IsDate1BeforeDate2(sDate Date1, sDate Date2)
{
    return (Date1.Year < Date2.Year) ? true : ((NumberOfDaysFromTheBeginningOfTheYear(Date1) < NumberOfDaysFromTheBeginningOfTheYear(Date2)) ? true : false);
}


bool IsDate1EqualsDate2(sDate Date1, sDate Date2)
{
    return( ((Date1.Year == Date2.Year) && (NumberOfDaysFromTheBeginningOfTheYear(Date1) == NumberOfDaysFromTheBeginningOfTheYear(Date2)))? true : false);
}
int main()
{
    sDate Date1 = ReadFullDate();
    sDate Date2 = ReadFullDate();



    if (IsDate1EqualsDate2(Date1, Date2))
        cout << "\n Yes, Date 1 is Equal Date2.";
    else
        cout << "\n NO, Date 1 is NOT Equal Date2.";

    system("pause>0");
    return 0;
}

