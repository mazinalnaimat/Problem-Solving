#include<iostream>
using namespace std;

int ReadAge()
{
	int Age;
	cout << "Enter Your Age?" << endl;
	cin >> Age;
	return Age;
}

bool ValidateNumberInRamge(int Number, int From, int To)
{
	return(Number >= From && Number <= To);
}

void PrintResult(float Age)
{
   if(ValidateNumberInRamge(Age,18,28 ))
	   cout << Age<<" is a valid" <<endl;
	   else
	   cout << Age <<" is a unvalid" << endl;
}

int main()
{
	PrintResult(ReadAge());
	return 0;
}


