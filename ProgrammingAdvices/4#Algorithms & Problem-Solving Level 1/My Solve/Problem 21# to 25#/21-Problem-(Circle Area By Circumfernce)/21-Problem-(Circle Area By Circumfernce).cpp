#include<iostream>
using namespace std;

float ReadCircumfernceOfCircle()
{
	float Circumference;
	cout << "Enter The Circumference Of Circle: " << endl;
	cin >> Circumference;
	return Circumference;
}

float CircleAreaByCircumference(float Circumference)
{
	const float PI = 3.141592653589793238;
	float radius = Circumference / (2*PI);
	return PI * pow(radius , 2);
}

void PrintResult(float Area)
{
	cout << "\nThe Area Of Circle: " << Area << endl;
}

int main()
{
	PrintResult(CircleAreaByCircumference(ReadCircumfernceOfCircle()));
	return 0;
}


