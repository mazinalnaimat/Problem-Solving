
#include <iostream>
using namespace std;

void ReadNumbers(float& height, float& width)
{
	cout << "Enter The Hieght Of Rectangle  : " << endl;
	cin >> height;

	cout << "Enter TheWidth Of Rectangle : " << endl;
	cin >> width;

}

float CalculaionRectangleArea(float height, float width)
{
	return height * width;
}

void PrintArea(float area)
{
	cout << "\nThe Area Of Rectangle = " << area << endl;
}



int main()
{
	float height, width;
	ReadNumbers(height, width);
	PrintArea(CalculaionRectangleArea(height, width));



	return 0;
}
