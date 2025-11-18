
#include <iostream>
using namespace std;

float ReadPositiveNumber(string Message)
{
	float Number = 0;
	cout << Message << endl;
	cin >> Number;
	return Number;
}

float CalcuateRemainder(float TotalBill, float TotalCashPaid)
{
	return TotalCashPaid - TotalBill;

}

int main()
{
   
	float TotalBill = ReadPositiveNumber("Please Enter Total Bill?");
	float TotalCashPaid = ReadPositiveNumber("Please Enter Total Cash Paid?");

	cout << endl;
	cout << "Total Bill = " << TotalBill << endl;
	cout << "Total Cash Paid = " << TotalCashPaid << endl;

	cout << "*********************************\n";
	cout << "Remainder = " << CalcuateRemainder(TotalBill, TotalCashPaid) << endl;











	return 0;
}
