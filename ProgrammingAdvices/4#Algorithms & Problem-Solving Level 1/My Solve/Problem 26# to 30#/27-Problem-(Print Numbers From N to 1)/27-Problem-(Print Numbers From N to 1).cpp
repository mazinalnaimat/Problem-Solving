
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

void PrintNumbersFromNTo1_UsingFor(int Number)
{

	cout << endl;
	for (int Counter = Number; Counter >=1;Counter--)
	{
		cout << Counter << endl;
	}
}

void PrintNumbersFromNTo1_UsingWhile(int Number)
{
	int Counter = Number;
	cout << endl;
	while (Counter >= 1)
	{
		
		cout << Counter << endl;
		Counter -= 1;
	}
}

void PrintNumbersFromNTo1_UsingDo(int Number)
{

	int Counter = Number;
	cout << endl;
	do
	{
	
		cout << Counter << endl;
		Counter -= 1;
	} while (Counter >= 1);
}


int main()
{
	int N = ReadNumber();

	PrintNumbersFromNTo1_UsingFor(N);
	PrintNumbersFromNTo1_UsingWhile(N);
	PrintNumbersFromNTo1_UsingDo(N);

	return 0;
}

