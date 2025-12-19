
#include <iostream>
using namespace std;

void ReadMarks(int& Mark1, int& Mark2, int& Mark3)
{
	cout << "Enter the first number:" << endl;
	cin >> Mark1;

	cout << "Enter the second number:" << endl;
	cin >> Mark2;

	cout << "Enter the third number:" << endl;
	cin >> Mark3;

}
int SumOf3Marks(int Mark1, int Mark2, int Mark3)
{
	int sum;
	return sum = Mark1 + Mark2 + Mark3;
}
float CalculateAverage(int Mark1, int Mark2, int Mark3)
{
	
	return  (float)(SumOf3Marks(Mark1, Mark2 , Mark3)) / 3;
}

void PrintResults(float Average)
{
	cout << "The Averge of Marks : " << Average << endl;
}

int main()
{
	int Mark1, Mark2, Mark3 ;
	ReadMarks(Mark1, Mark2, Mark3);
	PrintResults(CalculateAverage(Mark1, Mark2, Mark3));




	return 0;
}
