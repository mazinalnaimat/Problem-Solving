
#include <iostream>
using namespace std;

void ReadNumbres(float& height, float& base)
{
	cout << "Enter The Height Of Triangle: " << endl;
	cin >> height;

	cout << "Enter The Base of Triangle: " << endl;
	cin >> base;
}

float CalculateTriangleArea(float height, float base)
{
	return 0.5 * base * height;
}

void PrintResult(float area)
{
	cout << "The Area Of Triangle: " << area << endl;
}



int main()
{
	float height, base;
	ReadNumbres(height, base);
	PrintResult(CalculateTriangleArea(height, base));
	return 0;

}
