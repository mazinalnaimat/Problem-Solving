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

void PrintInvertedLettersPattern(int Number)
{
	cout << "\n";

	for (int i = Number + 64; i >=65; i--)
	{
		for (int j = 1; j <= i-64 ; j++)
		{
			
			cout <<char(i);
		}								   
		cout << "\n";
	}
}

int main()
{


	PrintInvertedLettersPattern(ReadPositiveNumber("Please Enter The Positive Number?"));






	return 0;
}
