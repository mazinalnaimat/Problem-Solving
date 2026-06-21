
#include<iostream>
#include<string>

using namespace std;

char ReadChar()
{
	char Ch1;
	cout << "\nPlease Enter a Character?\n";
	cin >> Ch1;
	return Ch1;
}

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


short CountlLetter(string S1, char Letter, bool MatchCase = true)
{
	short Count = 0;

	for (int i = 0; i < S1.length(); i++)
	{

		if (MatchCase  && Letter == S1[i])
		{
			Count++;
		}
		else if (!MatchCase && (Letter == S1[i] || S1[i] == InvertCharacter(Letter)))
			Count++;
	}
	return Count;
}


int main()
{

	string S1 = ReadString();
	char Ch1 = ReadChar();

	cout << "\nLetter '" << Ch1 << "' Count = " << CountlLetter(S1, Ch1);
	cout << "\nLetter '" << Ch1 <<"' Or '" <<InvertCharacter(Ch1) << "' Count = " << CountlLetter(S1, Ch1,false);


	system("pause>0");
}


