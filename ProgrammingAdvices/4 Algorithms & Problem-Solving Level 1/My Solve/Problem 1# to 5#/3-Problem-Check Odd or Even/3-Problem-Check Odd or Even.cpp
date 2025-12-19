#include <iostream>
using namespace std;

int PrintNumber()
{
	int Number;
	cout << "Please Enter the Number?" << endl;
	cin >> Number;
	return Number;
}
void PrintNumber(int Number)
{
	if (Number % 2 == 0)
		cout << Number << " is Even.";
	else
		cout << Number << " is Odd.";

}


int main()
{
	PrintNumber(PrintNumber());
	return 0;

}

