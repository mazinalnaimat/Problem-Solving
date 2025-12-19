
#include <iostream>
using namespace std;

int ReadPositveNumber(string Message)
{
	int Number= 0;
	do
	{
		cout << Message << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

bool checkPrimeNumber(int Number)
{
	int M = round(Number) / 2;
	for (int Counter = 2;Counter <= M; Counter++)
	{
		if (Number % Counter == 0)
			return true;
	}
	return false;
}

void PrintResult(int Number)
{
	if (checkPrimeNumber(Number))
		cout << Number << " Is Not A Prime Number." << endl;
	else
		cout << Number << " Is A Prime Number." << endl;
}


int main()
{
	PrintResult(ReadPositveNumber("Enter The Positive Number?"));


}

