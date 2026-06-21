

#include <iostream>
using namespace std;

bool IsLeapYear(short Year)
{
    return ((Year % 400 == 0) || (Year % 4 == 0 && Year % 100 != 0));
}

short ReadYear()
{
    short Year;
    cout << "Please Enter A Year To Check? ";
    cin >> Year;
    return  Year;
}

short ReadMonth()
{
    short Month;
   
        do
        {
            cout << "Please Enter A Month To Check? ";
            cin >> Month;
        } while (Month > 12 || Month < 1);
    return  Month;
}

short NumberOfDaysInAMonth(short Year, short Month)
{
    if(Month == 2)
    return Month = IsLeapYear(Year) ? 29 : 28;

    else if(Month == 11 || Month == 9 || Month == 6 || Month == 4 )
    return Month = IsLeapYear(Month) ? 30 : 31;
}

short NumberOfHoursInMonth(short Year, short Month)
{
    return NumberOfDaysInAMonth(Year, Month) * 24;
}

int NumberOfMinutessInMonth(short Year, short Month)
{
    return NumberOfHoursInMonth( Year, Month) * 60;
}

int NumberOfSecondsInMonth(short Year, short Month)
{
    return NumberOfMinutessInMonth(Year, Month) * 60;
}

int main()
{
    short Year = ReadYear();
    cout << endl;
    
    short Month = ReadMonth();

 
    cout << endl;
    cout << "Number of Days    in Month [" << Month << "] is " << NumberOfDaysInAMonth(Year, Month) << endl;
    cout << "Number of Hours   in Month [" << Month << "] is " << NumberOfHoursInMonth(Year, Month) << endl;
    cout << "Number of Minutes in Month [" << Month << "] is " << NumberOfMinutessInMonth(Year, Month) << endl;
    cout << "Number of Seconds in Month [" << Month << "] is " << NumberOfSecondsInMonth(Year, Month) << endl;


}

