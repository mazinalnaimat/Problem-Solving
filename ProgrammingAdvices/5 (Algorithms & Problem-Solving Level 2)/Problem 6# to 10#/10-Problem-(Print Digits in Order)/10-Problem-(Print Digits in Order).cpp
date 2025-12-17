
#include <iostream>
#include<string>
using namespace std;

int	ReadPositiveNumber(string message)
{
	int Number = 0;
	do
	{
		cout << message << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}
void FlipTheNumbers(int Number)
{
	int   MainNumber = Number;
	int TheFirstNumber = 0;
	int Counter = to_string(Number).length();

	while (Number > 0 && Counter > 0 )
	{
		Number = MainNumber;
		Number = Number / (pow(10 , Counter-1));
		TheFirstNumber = Number % 10;
	   	cout << TheFirstNumber << endl;
	  	Counter--;
	}
}


int main()
{
	FlipTheNumbers(ReadPositiveNumber("Enter your Number:"));
	return 0;
}
