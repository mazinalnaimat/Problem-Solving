#include<iostream>
using namespace std;


int ReadNumber(string Message)
{
	int Number = 0;
	cout << Message << endl;
	cin >> Number;

	return Number;
}

float ThePowerIs(int Number)
{
	int Power = 0;
	cout << "Please Enter The Power: " << endl;
	cin >> Power;
	float NumberAfterPower = 1;
	
	if (Power >= 0)
	{
		for (int Counter = 1; Counter <= Power; Counter++)
		{
			NumberAfterPower = NumberAfterPower * Number;
		} return 	 1 / NumberAfterPower;
     }
	else
	{
	for (int Counter = Power; Counter < 0; Counter++)
	{
		NumberAfterPower = NumberAfterPower * Number;
	}
	return 	1 / NumberAfterPower;
	}
	
	
}

void PrintResult(float NumberAfterPower)
{
	cout << "The Result is : " << NumberAfterPower << endl;
}



int main()
{

	PrintResult(ThePowerIs(ReadNumber("Please Enter The Number?")));
	return 0;
}
