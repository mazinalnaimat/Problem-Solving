
#include <iostream>
using namespace std;

int ReadNumber()
{
	int Number =0;
	do
	{
		cout << "Please Enter The Number?" << endl;
		cin >> Number;
	} while (Number < 1);
	return Number;
}

void PrintNumbersFrom1ToN_UsingFor(int Number)
{

	cout << endl;
	for (int i = 1; i <= Number; i++)
	{
		cout << i <<endl ;
    }
}

void PrintNumbersFrom1ToN_UsingWhile(int Number)
{
	int Counter = 0;
	cout << endl;
	while (Counter <= Number)
	{
		Counter += 1;
		cout << Counter << endl;
	}
}

void PrintNumbersFrom1ToN_UsingDo(int Number)
{

	int Counter = 0;
	cout << endl;
	do 
	{
		Counter += 1;
		cout << Counter << endl;
	} while (Counter <= Number);
}


int main()
{
	int N = ReadNumber();

	PrintNumbersFrom1ToN_UsingFor(N);
	PrintNumbersFrom1ToN_UsingWhile(N);
	PrintNumbersFrom1ToN_UsingDo(N);

	return 0;
}

