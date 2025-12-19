

#include <iostream>
using namespace std;

void RaedNumners(int& Num1, int& Num2)
{
	cout << "Enter The First Number : " << endl;
	cin >> Num1;

	cout << "Enter The Second Number : " << endl;
	cin >> Num2;
}

int CheckMAxNumber(int Num1, int Num2)
{
	int maxNumber = 0;
	if (Num1 > Num2)
		maxNumber = Num1;
	else
		maxNumber = Num2;
	return maxNumber;
}

void PrinMaxNumber(int maxNumber)
{
	cout << "The Max Number is : " << maxNumber << endl;
}


int main()
{
	int Num1, Num2;
	RaedNumners(Num1, Num2);
	PrinMaxNumber(CheckMAxNumber( Num1, Num2));

	return 0;
}

