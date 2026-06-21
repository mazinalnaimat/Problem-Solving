#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string s1;

	cout << "Please Enter your Sting ? " << endl;
	getline(cin, s1);
	return s1;
}

char InvertCharacter(char C1)
{
	bool IsUpperLetter = true;
	bool IsLowerLetter = true;



		IsUpperLetter = (char(C1) > 64 && char(C1) < 91 ? true : false);
		IsLowerLetter = (char(C1) > 96 && char(C1) < 123 ? true : false);

		if (C1 != ' ' && IsUpperLetter)
		{
			int NumLetter = char(C1);
			C1 = char(NumLetter + 32);
		}

		else if (C1 != ' ' && IsLowerLetter)
		{
			int NumLetter = char(C1);
			C1 = char(NumLetter - 32);
		}
	

	return  C1;
}

string InvertAllLettersOfString(string S1)
{
	for (int i = 0; i < S1.length(); i++)
	{		
		S1[i] = InvertCharacter(S1[i]);
	}
	return  S1;
}


int main()
{
	string S1;

	S1 = ReadString();

	S1 = InvertAllLettersOfString(S1);
	cout << "\nString after Invert:" << endl;
	cout << S1 << endl;

	

	system("pause>0");
}
