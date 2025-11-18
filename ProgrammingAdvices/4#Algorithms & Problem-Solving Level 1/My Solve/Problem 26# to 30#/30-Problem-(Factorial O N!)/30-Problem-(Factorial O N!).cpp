#include<iostream>
using namespace std;


int ReadPositiveNumber(string Message)
{
	int Number = 0;
	do
	{
	cout << Message<< endl;
	cin >> Number;
	} while (Number <= 0);
	return Number;
}


int FactorialOf(int Number)
{
	int Factorial = 1;
	for (int Counter = 1; Counter <= Number; Counter++)
	{
		Factorial = Factorial * Counter;
	}	return Factorial;
} 


void PrintResult(int Factorial)
{
	cout << "The Factoiar Of The Number is: " << Factorial << endl;
}


int main()
{

	PrintResult(FactorialOf(ReadPositiveNumber("Enter The Positive Number?")));

	return 0;
}
