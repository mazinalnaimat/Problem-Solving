#include <iostream>
using namespace std;

int ReadPositiveNumber(string Meassage)
{
	int Number = 0;
	do
	{
		cout << Meassage << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

int SumOfDigits(int Number)
{
	int Sum = 0;
	int Remainder = 0;

	while (Number > 0)
	{
		Remainder = Number % 10;
		Number = Number / 10;
		Sum += Remainder;
		
	}
		return Sum;
}

void PrintResult(int Sum) 
{
	cout << "The Sum of Digits  = " << Sum << endl;
}


int main()
{
  
	PrintResult(SumOfDigits(ReadPositiveNumber("Please Enter The Positive Number?")));







	return 0;
}
