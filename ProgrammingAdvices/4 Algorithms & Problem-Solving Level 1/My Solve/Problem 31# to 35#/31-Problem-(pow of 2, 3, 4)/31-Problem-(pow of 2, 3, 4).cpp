#include<iostream>
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

int ThePowerIs(int Number)
{
	int Power = 0 ;
	int NumberAfterPower = 1;
	do {
		cout << "The Power Between 2 to 4 of Number :" << endl;
		cin >> Power;
		for (int Counter = 1; Counter <= Power; Counter++)
		{
			NumberAfterPower *= Number;
		}
	} while (Power <= 1 || Power > 4);
		return NumberAfterPower;
}


void PrintResult(int NumberAfterPower)
{
	cout << "The Result is  : " << NumberAfterPower << endl;
}




int main()
{

	PrintResult(ThePowerIs(ReadPositiveNumber("Please Enter The Number?")));
	return 0;
}
