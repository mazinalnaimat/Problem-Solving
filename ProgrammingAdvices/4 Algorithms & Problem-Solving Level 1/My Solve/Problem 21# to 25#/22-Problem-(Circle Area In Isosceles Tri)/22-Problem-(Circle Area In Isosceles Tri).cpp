#include<iostream>
using namespace std;

void ReadIsoscelesSides(float& Isosceles, float& Base)
{

	cout << "Enter The Isosceles Of Triangle: " << endl;
	cin >> Isosceles;

	cout << "Enter The Base Of Triangle: " << endl;
	cin >> Base;

}

float CircleAreaInIsoscelesTri(float Isosceles, float Base)
{
	const float PI = 3.141592653589793238;
	return PI * pow(Base, 2) / 4 * ((2*Isosceles - Base)/(2*Isosceles+ Base));
}

void PrintResult(float Area)
{
	cout << "\nThe Area Of Circle: " << Area << endl;
}

int main()
{
	float Isosceles, Base;
	ReadIsoscelesSides(Isosceles, Base);
	PrintResult(CircleAreaInIsoscelesTri(Isosceles, Base));
	return 0;
}


