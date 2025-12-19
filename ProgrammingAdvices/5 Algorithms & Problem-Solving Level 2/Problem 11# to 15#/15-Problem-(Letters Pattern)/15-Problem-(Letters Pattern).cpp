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

void PrintLettersPattern(int Number)
{
	cout << "\n";

	for (int i = 65; i <= Number + 64; i++)
	{
		for (int j = 1; j <= i - 64; j++)
		{

			cout << char(i);
		}
		cout << "\n";
	}
}

int main()
{


	PrintLettersPattern(ReadPositiveNumber("Please Enter The Positive Number?"));






	return 0;
}
