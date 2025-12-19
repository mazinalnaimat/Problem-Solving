

#include <iostream>
using namespace std;

int ReadTotalSales()
{
	int TotalSales = 0;
	cout << "Enter The Total Sales?" << endl;
	cin >> TotalSales;
	return TotalSales;
}

float GetCommissoinPercentage(float TotalSales)
{

	if (TotalSales > 1000000)
		return 0.05;
	else if (TotalSales >= 500000)
		return 0.02;
	else if (TotalSales >= 100000)
		return 0.03;
	else if (TotalSales >= 50000)
		return 0.05;
	else
		return 0;
}

float CalculateTotaleCommissoin(float TotalSales)
{
	return TotalSales* GetCommissoinPercentage(TotalSales);
} 




int main()
{
	float TotalSales = ReadTotalSales();
	cout << endl << "Commissoin Percentage = " << GetCommissoinPercentage(TotalSales) << endl;
	cout << endl << "Total Commissoin  = " << CalculateTotaleCommissoin(TotalSales) << endl;






	return 0;
}