#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string S1;

	cout <<"Please Enter your String ? " << endl;
	getline(cin, S1);
	return S1;
}

void PrintEachWordInString(string S1)
{
	cout << "\nYour String Words are:" << endl;
	/*

	bool isFirstLetter = true;
	for (int i = 0; i < s1.length(); i++)
	{
		if (s1[i] != ' ' && isFirstLetter)
		{
			for (int j = i; j < s1.length(); j++)
			{
				cout << s1[j];
				if (s1[j] == ' ')
				{
					cout << endl;
					break;
				}
			}
		}
		isFirstLetter = (s1[i] == ' ' ? true : false);
	}*/

	string delim = " ";
	short pos = 0;
	string sWord;

	while ((pos = S1.find(delim)) != std:: string::npos)
	{
		sWord = S1.substr(0, pos);
		if (sWord != " ")
		{
			cout << sWord << endl;
		}
		S1.erase(0, pos + delim.length());
	}


	if(S1 != " ")
	{
		cout << S1 << endl;
	}
}


int main()
{
	
	string S1 = ReadString();
	PrintEachWordInString(S1);


	system("pause>0");
}
