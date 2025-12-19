

#include <iostream>
using namespace std;

void RaedNumners(int& Num1, int& Num2, int& Num3)
{
	cout << "Enter The First Number : " << endl;
	cin >> Num1;

	cout << "Enter The Second Number : " << endl;
	cin >> Num2;
	cout << "Enter The Second Number : " << endl;
	cin >> Num3;
}

int CheckMAxNumber(int Num1, int Num2, int Num3)
{

	if (Num1 > Num2)
		Num1 = Num1;
	else
		Num1 = Num2;

	if (Num1 > Num3)
		Num1 = Num1;
	else
		Num1 = Num3;

	return Num1;

}

void PrinMaxNumber(int maxNumber)
{
	cout << "The Max Number is : " << maxNumber << endl;
}


int main()
{
	int Num1, Num2, Num3;
	RaedNumners(Num1, Num2, Num3);
	PrinMaxNumber(CheckMAxNumber(Num1, Num2, Num3));

	return 0;
}

