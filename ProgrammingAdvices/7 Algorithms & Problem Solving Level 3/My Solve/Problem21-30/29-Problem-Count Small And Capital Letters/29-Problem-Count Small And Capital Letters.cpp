/*
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

short CountCapitalLetters(string S1)
{
	short Count = 0;
	bool IsUpperLetter = true;


	for (int i = 0; i < S1.length(); i++)
	{
		IsUpperLetter = (char(S1[i]) > 64 && char(S1[i]) < 91 ? true : false);

		if (IsUpperLetter)
		{
			Count++;

		}
	}
	return Count;
}

short CountSmallLetters(string S1)
{
	short Count = 0;
	bool IsLowerLetter = true;


	for (int i = 0; i < S1.length(); i++)
	{
		IsLowerLetter = (char(S1[i]) > 96 && char(S1[i]) < 123 ? true : false);

		if (IsLowerLetter)
		{
			Count++;

		}
	}
		return Count;
}


int main()
{
	string S1;

	S1 = ReadString();

	cout << "\nString Length:" << S1.length();
	cout << "\nCapital Letters Count:" << CountCapitalLetters(S1);
	cout << "\nSmall Letters Count:" << CountSmallLetters(S1);



	system("pause>0");
}
*/

//Solve with Enum

#include<iostream>
#include<string>

enum enWhatToCount { SmallLetter=0 ,CapitalLetters=1 ,All = 2};
using namespace std;

string ReadString()
{
	string s1;

	cout << "Please Enter your Sting ? " << endl;
	getline(cin, s1);
	return s1;
}

short CountLetters(string S1, enWhatToCount WhatToCount = enWhatToCount::All)
{
	if (WhatToCount == enWhatToCount::All)
	{
		return S1.length();
	}

	short Count = 0;
	bool IsUpperLetter = true;
	bool IsLowerLetter = true;


		for (int i = 0; i < S1.length(); i++)
		{
			IsUpperLetter = (char(S1[i]) > 64 && char(S1[i]) < 91 ? true : false);
			IsLowerLetter = (char(S1[i]) > 96 && char(S1[i]) < 123 ? true : false);


			if (IsUpperLetter && WhatToCount == enWhatToCount::CapitalLetters)
			{
				Count++;

			}
			else if (WhatToCount == enWhatToCount::SmallLetter  && IsLowerLetter)
			{
				Count++;

			}
		
		}
	


	return Count;
}


int main()
{
	string S1;

	S1 = ReadString();

	cout << "\nString Length:" << CountLetters(S1);
	cout << "\nCapital Letters Count:" << CountLetters(S1,enWhatToCount::CapitalLetters);
	cout << "\nSmall Letters Count:" << CountLetters(S1, enWhatToCount::SmallLetter);



	system("pause>0");
}
