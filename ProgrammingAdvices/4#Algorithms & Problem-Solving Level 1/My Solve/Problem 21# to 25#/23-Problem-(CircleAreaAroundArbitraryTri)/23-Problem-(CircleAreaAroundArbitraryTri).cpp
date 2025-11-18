#include<iostream>
using namespace std;

void ReadSides(float& A, float& B, float& C)
{

	cout << "Enter The First Side Of Triangle: " << endl;
	cin >> A;

	cout << "Enter The Second Side Triangle: " << endl;
	cin >> B;

	cout << "Enter The Third Side Triangle: " << endl;
	cin >> C;



}

float CircleAreaAroundArbitraryTri(float A, float B, float C)
{
	const float PI = 3.141592653589793238;
	float P = (A + B + C) / 2;
	return PI * pow(((A * B * C) / (4 * sqrt(P * (P - A) * (P - B) * (P - C)))), 2);
}

void PrintResult(float Area)
{
	cout << "\nThe Area Of Circle: " << Area << endl;
}

int main()
{
	float A, B, C;
	ReadSides(A, B, C);
	PrintResult(CircleAreaAroundArbitraryTri(A, B, C));
	return 0;
}


