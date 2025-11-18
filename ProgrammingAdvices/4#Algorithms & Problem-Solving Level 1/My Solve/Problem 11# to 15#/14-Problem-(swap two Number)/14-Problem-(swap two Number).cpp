
#include <iostream>
using namespace std;

void ReadNumbers(int& Num1, int& Num2)
{
	cout << "Enter The First Number : " << endl;
	cin >> Num1;

	cout << "Enter The Second Number : " << endl;
	cin >> Num2;

}

void SwapNumbers(int &Num1, int &Num2)
{
	int toggle = 0;
	toggle = Num1;
	Num1 = Num2;
	Num2 = toggle;
	
}

void PrintNumbers(int Num1, int Num2)
{
	cout << "\n The First Number: " << Num1<<endl;
	cout << " The Second Number: " << Num2<< endl;
}


int main()
{
	int Num1, Num2;
	ReadNumbers(Num1, Num2);
	PrintNumbers(Num1, Num2);
	SwapNumbers(Num1, Num2);
	PrintNumbers(Num1, Num2);




	return 0;
}
