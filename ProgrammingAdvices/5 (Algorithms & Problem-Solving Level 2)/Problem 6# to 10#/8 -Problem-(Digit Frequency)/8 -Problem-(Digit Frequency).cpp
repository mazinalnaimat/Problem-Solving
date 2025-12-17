#include <iostream>
using namespace std;

int ReadPositiveNumber(string Message)
{
	int Number = 0;
	do
	{
		cout << Message << endl;
		cin >> Number;		
	} while (Number <= 0);
		return Number;
}

int NumberOfDigitFrequency(short DigitToCheck,int Number)
{
	int Remainder = 0;
	int FrequencyTimes = 0;
	

	while (Number > 0)
	{
		Remainder = Number % 10;
		Number = Number / 10;
		if (Remainder == DigitToCheck)
			FrequencyTimes += 1;
	}
	return FrequencyTimes;
}		   


int main()
{
	int Number = ReadPositiveNumber("Please Enter The Main Number? ");
	short DigitToCheck = ReadPositiveNumber("Please Enter One Digit To Check?");
	
	cout << "\nDigit " << DigitToCheck << " Frequency is " <<
		NumberOfDigitFrequency(DigitToCheck, Number)  << " Time(s)." << endl;



	return 0;
}
