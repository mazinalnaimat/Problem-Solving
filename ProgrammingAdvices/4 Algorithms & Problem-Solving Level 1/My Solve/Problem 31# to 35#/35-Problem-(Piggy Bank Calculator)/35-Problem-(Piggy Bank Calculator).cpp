#include <iostream>
using namespace std;



struct stPiggyBankContant
{
	int  Pennies, Nickels, Dimes, Quarters, Dollars;
};


stPiggyBankContant ReadPiggyBankContant()
{
	stPiggyBankContant PiggyBankContant;

	cout << "Please Enter A Total Pennies? " << endl;
	cin >> PiggyBankContant.Pennies;
	cout << "Please Enter A Total Nickels? " << endl;
	cin >> PiggyBankContant.Nickels;
	cout << "Please Enter A Total Dimes? " << endl;
	cin >> PiggyBankContant.Dimes;
	cout << "Please Enter A Total Quarters? " << endl;
	cin >> PiggyBankContant.Quarters;
	cout << "Please Enter A Total Dollars? " << endl;
	cin >> PiggyBankContant.Dollars;

	return PiggyBankContant;
}


int CalculateTotalPennies(stPiggyBankContant ReadPiggyBankContant)
{
	int TotalPennies = 0;

	TotalPennies = ReadPiggyBankContant.Pennies * 1 + ReadPiggyBankContant.Nickels * 5
		+ ReadPiggyBankContant.Dimes * 10 + ReadPiggyBankContant.Quarters * 25
		+ ReadPiggyBankContant.Dollars * 100;

	return TotalPennies;
}




int main()
{
	int TotalPennies = CalculateTotalPennies(ReadPiggyBankContant());
	cout << endl << "Total Pennies : " << TotalPennies << endl;
	cout << endl << "Total Dollars : " << (float)TotalPennies/100 << endl;
 
	return 0;
}

