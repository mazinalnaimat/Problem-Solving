

#include <iostream>
using namespace std ;

int ReadMark()
{
	int Mark = 0;
	cout << "Enter your Mark:" << endl;
	cin >> Mark;

	return Mark;
}

bool CheckMark(int Mark)
{
	return (Mark >= 50);
}

void PrintResult(bool CheckMark)
{
	if (CheckMark)
		cout << "You are passed" << endl;
	else
		cout << endl << "You are failed";
}

int main()
{
	PrintResult(CheckMark(ReadMark()));
}

