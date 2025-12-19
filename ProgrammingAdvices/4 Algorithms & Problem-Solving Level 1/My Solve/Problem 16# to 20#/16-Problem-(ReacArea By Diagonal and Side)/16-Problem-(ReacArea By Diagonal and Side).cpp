

#include <iostream>

using namespace std;

void ReadNumbers(float& side, float& diagonal)
{
	cout << "Enter Length of One Side:" << endl;
	cin >> side;

	cout << "Enter The Length Of Diagonal: " << endl;
	cin >> diagonal;
}

float CalculateAreaRectangleBySideAndDiagonal(int side, int diagonal)
{
	return side * sqrt(pow(diagonal,2) - pow(side,2));
}

void PrintResult(float area)
{
	cout << "The Area Of Rectangle: "<<area << endl;
}

int main()
{
	float side, diagonal;
	ReadNumbers(side, diagonal);
	PrintResult(CalculateAreaRectangleBySideAndDiagonal(side, diagonal));





	return 0;
}

