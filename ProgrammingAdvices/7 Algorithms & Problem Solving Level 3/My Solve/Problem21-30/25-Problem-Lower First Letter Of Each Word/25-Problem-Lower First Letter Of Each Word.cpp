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

string LowerFirstLetterOfEachWord(string s1)
{

	

	bool IsFirstLetter = true;
	bool IsUpperLetter = true;

	for (int i = 0; i < s1.length(); i++)
	{
		IsUpperLetter = (char(s1[i]) > 64 && char(s1[i]) < 91 ? true : false);

		if (s1[i] != ' ' && IsFirstLetter && IsUpperLetter)
		{
			int NumLetter = char(s1[i]);
			s1[i] = char(NumLetter + 32);
		}
		IsFirstLetter = (s1[i] == ' ' ? true : false);

	}
	/*
	bool IsFirstLetter = true;


	for (int i = 0; i < s1.length(); i++)
	{
		if (s1[i] != ' ' && IsFirstLetter)
		{
			s1[i] = tolower(s1[i]);
		}
		IsFirstLetter = (s1[i] == ' ' ? true : false);

	}
	*/
	return  s1;
}

int main()
{
	string s1;

	s1 =LowerFirstLetterOfEachWord(ReadString());
	cout << "\nString after conversion :" << endl;
	cout << s1 << endl;

	system("pause>0");
}
