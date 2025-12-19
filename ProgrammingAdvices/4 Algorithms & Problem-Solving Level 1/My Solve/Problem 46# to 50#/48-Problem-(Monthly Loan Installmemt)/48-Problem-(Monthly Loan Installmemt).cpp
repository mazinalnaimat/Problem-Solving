
#include <iostream>
using namespace std;

float ReadPositiveNumber(string Meassage)
{
	float Number = 0;
	do
	{
		cout << Meassage << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

float MonthlyIsntallment(float LoanAmount, float NumberOfMonths)
{
	return 	(LoanAmount / NumberOfMonths);
}




int main()
{
	float LoanAmount = ReadPositiveNumber("Please Enter Loan Amount?");
	float NumberOfMonths = ReadPositiveNumber("Please Enter Number Of Months?");
																	  
	cout << "\Monthly Isntallment  to pay = " << MonthlyIsntallment(LoanAmount, NumberOfMonths);
	cout << endl;



	return 0;
}

