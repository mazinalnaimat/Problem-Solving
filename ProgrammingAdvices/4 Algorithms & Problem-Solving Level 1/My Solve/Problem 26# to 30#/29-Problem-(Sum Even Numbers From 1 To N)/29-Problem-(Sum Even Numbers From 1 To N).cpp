#include<iostream>
using namespace std;

enum enOddOrEven { Odd = 1, Even = 2 };
int ReadNumber()
{
	int Number = 0;

	do
	{
		cout << "Enter The Number ?" << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

enOddOrEven CheckOddOrEven(int Number)
{
	if (Number % 2 == 0)
		return 	enOddOrEven::Even;
	else
		return enOddOrEven::Odd;
}

int SumEvenNumbersFrom1ToN_UsingWhile(int Number)
{
	int Sum = 0;
	int Counter = 0;
	while (Counter <Number)
	{
		Counter++;
		if (CheckOddOrEven(Counter) == enOddOrEven::Even)
			Sum = Sum + Counter;
	}
	return Sum;
}

int SumEvenNumbersFrom1ToN_UsingDoWhile(int Number)
{
	int Sum = 0;
	int Counter = 0;
	do
	{
		Counter++;
		if (CheckOddOrEven(Counter) == enOddOrEven::Even)
			Sum = Sum + Counter;
	} while (Counter < Number);
	return Sum;
}

int SumEvenNumbersFrom1ToN_UsingFor(int Number)
{
	int Sum = 0;
	int Counter = 1;
	for (Counter; Counter <=Number; Counter++)
	{
		if (CheckOddOrEven(Counter) == enOddOrEven::Even)
			Sum = Sum + Counter;
	}

	return Sum;
}

void PrintResult(int Sum)
{
	cout << "The Sum of even Numbers From 1 To N : " << Sum << endl;
}




int main()
{

	PrintResult(SumEvenNumbersFrom1ToN_UsingWhile(ReadNumber()));

	PrintResult(SumEvenNumbersFrom1ToN_UsingDoWhile(ReadNumber()));

	PrintResult(SumEvenNumbersFrom1ToN_UsingFor(ReadNumber()));




	return 0;
}
