

#include <iostream>
using namespace std;

int ReadPositiveNumber(string Message)
{
	int Number = 0;
	do {
		cout << Message << endl;
		cin >> Number;
	} while (Number <= 0);
		return Number;
}

void IsPerfectNumber(int Number)
{
	int sumDivisors = 0;
	
	for (int i = 1; i < Number; i++)
	{
		if ((Number % i) == 0 && Number != sumDivisors)
		{
			sumDivisors += i;
		}
	}
	if (sumDivisors == Number)
		cout << Number << " is perfect.";
	else
		cout << Number << " is not perfect.";

}


int main()
{



	IsPerfectNumber(ReadPositiveNumber("Enter your number : "));



      





}
