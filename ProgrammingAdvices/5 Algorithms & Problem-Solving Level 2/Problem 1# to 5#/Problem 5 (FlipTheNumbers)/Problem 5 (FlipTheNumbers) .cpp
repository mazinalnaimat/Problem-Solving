
#include <iostream>
using namespace std;

int	ReadPositiveNumber(string message)
{
	int Number = 0;
	do
	{
		cout << message << endl;
		cin >> Number;
	} while (Number <=0);
	return Number;
}
void FlipTheNumbers(int Number)
{
	
	int theLastNumber = 0;

	while (Number > 0)
	{
		 theLastNumber = Number % 10;
		Number = Number / 10;
		cout << theLastNumber << endl;

	} 
}


int main()
{
	FlipTheNumbers(ReadPositiveNumber("Enter your Number:"));
	return 0;
}
