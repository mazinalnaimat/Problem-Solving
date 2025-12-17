
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

int NumberOfDigitsFrequency(short DigitToCheck, int Number)
{


	int Remainder = 0;
	int CounFreq = 0;


	while (Number > 0)
	{

		Remainder = Number % 10;
		Number = Number / 10;
		if (DigitToCheck == Remainder)
			CounFreq++;
	}
	return  CounFreq;
}

void PrintAllDigitsFrequency(int Number)
{
	short DigitToCheck = 0;
	while (DigitToCheck <= 9)
	{
		short DigitFrequency = 0;
		DigitFrequency = NumberOfDigitsFrequency(DigitToCheck, Number);
		if (DigitFrequency >= 1)
		{
			cout << "\nDigit " << DigitToCheck << " Frequency is " << DigitFrequency << " Time(s).";
		}
		DigitToCheck++;
	}
}

int main()
{

	int Number = ReadPositiveNumber("Please Enter The Positive Number?");
	PrintAllDigitsFrequency(Number);

	return 0;

}

