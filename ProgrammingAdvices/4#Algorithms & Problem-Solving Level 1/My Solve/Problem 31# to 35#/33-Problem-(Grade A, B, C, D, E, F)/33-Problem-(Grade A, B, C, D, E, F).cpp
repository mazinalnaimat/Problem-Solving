#include<iostream>
using namespace std;

enum enStatusOfMArk { A=1, B=2, C=3, D=4, E=5, F=6 };

int ReadMark()
{
	int Mark = 0;
	do
	{

		cout << "Please Enter The Mark?" << endl;
		cin >> Mark;
	} while (Mark <0 || Mark > 100);
	return Mark;
}

enStatusOfMArk CheckTheMarks(int Mark)
{
	if (Mark <= 100 && Mark >= 90)
	return 	enStatusOfMArk::A;
	else if (Mark < 90 && Mark >= 80)
		return 	enStatusOfMArk::B;

	else if (Mark < 80 && Mark >= 70)
		return 	enStatusOfMArk::C;

	else if (Mark < 70 && Mark >= 60)
		return 	enStatusOfMArk::D;

	else if (Mark < 60 && Mark >= 50)
 		return 	enStatusOfMArk::E;
   	else
		return 	enStatusOfMArk::F;
}

void PrintResult(int Mark)
{
	if (CheckTheMarks(Mark) == enStatusOfMArk::A)
		cout << "Your Grade is A " << endl;
	else if (CheckTheMarks(Mark) == enStatusOfMArk::B)
		cout << "Your Grade is B " << endl;

	else if  (CheckTheMarks(Mark) == enStatusOfMArk::C)
		cout << "Your Grade is C " << endl;

	else if (CheckTheMarks(Mark) == enStatusOfMArk::D)
		cout << "Your Grade is D " << endl;

	else if (CheckTheMarks(Mark) == enStatusOfMArk::E)
		cout << "Your Grade is E " << endl;
	else
		cout << "Your Grade is F " << endl;

 }


int main()
{
	PrintResult(ReadMark());



;
	return 0;
}
