
#include <iostream>
using namespace std;

void ReadRadius(float radius)
{
	cout << "Enter The Raduis Of Circle: " << endl;
	cin >> radius;
}

float CalculateCircleArea(float radius)
{
	float const PI = 3.14;
	return PI * pow(radius,2);
}

void PrintResult(float area)
{
	cout << "The Area Of Circle: " << area << endl;
}



int main()
{
	float radius;

	ReadRadius(radius);
	PrintResult(CalculateCircleArea(radius));
	return 0;

}
