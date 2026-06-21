#include<iostream>
#include<string>

using namespace std;

char ReadString()
{
	char C1;

	cout << "Please Enter a Character?" << endl;
	cin >> C1;
	return C1;
}

char InvertCharacter(char C1)
{
	bool IsUpperLetter = true;


		IsUpperLetter = (char(C1) > 64 && char(C1) < 91 ? true : false);

		if (IsUpperLetter)
		{
			int NumLetter = char(C1);
			C1 = char(NumLetter + 32);
		}

		else if (!IsUpperLetter)
		{
			int NumLetter = char(C1);
			C1 = char(NumLetter - 32);
		}
	

	return  C1;
}


int main()
{
	char C1 = ReadString();
	cout << "Char after inverting\n";
	C1= InvertCharacter(C1);
	cout << C1;

	system("pause>0");
}
