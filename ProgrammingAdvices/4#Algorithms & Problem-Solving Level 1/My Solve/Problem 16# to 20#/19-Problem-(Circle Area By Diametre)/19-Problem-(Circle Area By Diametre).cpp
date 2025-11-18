#include <iostream>
using namespace std;

int ReadDiameter()
{
	float diameter;
	cout << "Enter The Diameter Of Circle: " << endl;
	cin >> diameter;
	return diameter;
}

float CircleAreaByDiameter(float diameter)
{
	const float  PI = 3.141592653589793238;
	return PI * pow(diameter, 2) / 4;
}

void PrintResult(float area)
{
	cout << "The Area Of Circle: " << area << endl;
}



int main()
{
	PrintResult(CircleAreaByDiameter(ReadDiameter()));
	return 0;

}
