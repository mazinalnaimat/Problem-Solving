
#include <iostream>
using namespace std;

int ReadNumber()
{
	int Number = 0;
	do
	{
		cout << "Please Enter The Number?" << endl;
		cin >> Number;
	} while (Number < 1);
	return Number;
}

int SumNumbersFromNTo1_UsingFor(int Number)
{
	int Sum = 0;
	cout << endl;
	for (int Counter = 1; Counter <= Number; Counter=Counter+2)
	{
		Sum = Sum + Counter;
	}
	return Sum;
}

void PrintResult(int Number)
{
	cout << "The Sum Of Odd Numer From 1 To N: " << SumNumbersFromNTo1_UsingFor(Number) << endl;
}




int main()
{
	int N = ReadNumber();

	PrintResult(N);


	return 0;
}

