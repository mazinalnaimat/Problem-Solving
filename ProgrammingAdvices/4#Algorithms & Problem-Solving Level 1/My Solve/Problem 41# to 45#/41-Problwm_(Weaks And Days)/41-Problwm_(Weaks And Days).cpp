#include <iostream>
using namespace std;

float ReadPositiveNumber(string Message)
{
	float Number = 0;
	do
	{
		cout << Message << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

float HoursToDays(float NumberOfHuors)
{
	return NumberOfHuors / 24;
}

float HoursToWeaks(float NumberOfHuors)
{
	return NumberOfHuors / (24*7);
}

float DaysToWeaks(float NumberOfDays)
{															  
	return NumberOfDays /  7;
}

int main()
{
	float NumberOfHours = ReadPositiveNumber("Please enter Number Of Huors?");
	float NumberOfDays = HoursToDays(NumberOfHours);
	float NumberOfWeaks = DaysToWeaks(NumberOfDays);

	cout << endl;
	cout << "Total Hours = " << NumberOfHours << endl;
	cout << "Total Days = " << NumberOfDays << endl;
	cout << "Total Weaks = " << NumberOfWeaks << endl;

	return 0;
}

