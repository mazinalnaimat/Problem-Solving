#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string s1;

	cout << "Please Enter your Sting?" << endl;
	getline(cin, s1);
	return s1;
}

string LowerAllLettersOfString(string s1)
{
	bool IsUpperLetter = true;

	for (int i = 0; i < s1.length(); i++)
	{
		IsUpperLetter = (char(s1[i]) > 64 && char(s1[i]) < 91 ? true : false);

		if (s1[i] != ' ' && IsUpperLetter)
		{
			int NumLetter = char(s1[i]);
			s1[i] = char(NumLetter + 32);
		}
	}

	return  s1;
}


string UpperAllLettersOfString(string s1)

{
;
	bool IsUpperLetter = true;

	for (int i = 0; i < s1.length(); i++)
	{
		IsUpperLetter = (char(s1[i]) > 64 && char(s1[i]) < 91 ? true : false);

		if (s1[i] != ' '  && !IsUpperLetter)
		{
			int NumLetter = char(s1[i]);
			s1[i] = char(NumLetter - 32);
		}


	}

	return  s1;
}

int main()
{
	string s1;

	s1 = ReadString();

	s1 = UpperAllLettersOfString(s1);
	cout << "\nString after Upper:" << endl;
	cout << s1 << endl;

	s1 = LowerAllLettersOfString(s1);
	cout << "\nString after Lower:" << endl;
	cout << s1 << endl;

	system("pause>0");
}
