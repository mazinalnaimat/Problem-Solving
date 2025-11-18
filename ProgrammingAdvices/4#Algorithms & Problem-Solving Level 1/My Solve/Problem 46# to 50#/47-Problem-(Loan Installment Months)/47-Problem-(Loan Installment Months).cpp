
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

float TotalMonths(float LoanAmount, float MonthlyIsntallment)
{
	return 	(LoanAmount / MonthlyIsntallment);
}




int main()
{
	float LoanAmount = ReadPositiveNumber("Please Enter Loan Amount?");
	float MonthlyIsntallment = ReadPositiveNumber("Please Enter Monthly Isntallment?");

	cout << "\nTotal Months to pay = " << TotalMonths(LoanAmount, MonthlyIsntallment);
	cout << endl;




	return 0;
}

