#include<iostream>
using namespace std;

float ReadLenghtOfSquareSide()
{
	float Side;
	cout << "Enter The Length Of One Square Side: " << endl;
	cin >> Side;
	return Side;
}

float CircleAreaIsncriedInASquare(float Side)
{
	const float PI = 3.141592653589793238;
	return PI * pow(Side / 2, 2);
}

void PrintResult(float Area)
{
	cout << "\nThe Area Of Circle: " << Area << endl;
}

int main()
{
	PrintResult(CircleAreaIsncriedInASquare(ReadLenghtOfSquareSide()));
	return 0;
}


