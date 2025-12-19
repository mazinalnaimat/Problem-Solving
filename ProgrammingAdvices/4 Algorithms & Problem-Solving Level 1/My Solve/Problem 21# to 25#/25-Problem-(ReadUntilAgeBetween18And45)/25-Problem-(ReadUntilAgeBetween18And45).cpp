#include<iostream>
using namespace std;

int ReadAge()
{
	int Age;
	cout << "Please Enter Your Age Between 18 and 45?" << endl;
	cin >> Age;
	return Age;
}

bool ValidateNumberInRamge(int Number, int From, int To)
{
	return(Number >= From && Number <= To);
}

int ReadUntilAgeBetween(int From, int To)
{
	int Age = 0;
	do {
		Age = ReadAge();
	} while (!ValidateNumberInRamge(Age, From, To));
	return Age;
}

void PrintResult(float Age)
{
	if (ValidateNumberInRamge(Age, 18, 28))
		cout << Age << " is a valid" << endl;
	else
		cout << Age << " is a unvalid" << endl;

}

int main()
{
	PrintResult(ReadUntilAgeBetween(18, 45));
	return 0;
}


