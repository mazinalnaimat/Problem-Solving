#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string s1 ;

	cout << "Please Enter your Sting?" << endl;
	getline(cin, s1);
	return s1;
}

void PrintFirstLetterOfEachWord(string s1)
{
	cout << "The First Letter Each of this string:" << endl;
	cout << endl;

	bool isFirstLetter = true;
	for (int i = 0; i < s1.length(); i++)
	{
		if (s1[i] != ' ' && isFirstLetter)
		{
			cout << s1[i] << endl;
		}
		isFirstLetter = (s1[i] == ' ' ? true : false);
	}
}

int main()
{


	PrintFirstLetterOfEachWord(ReadString());

	system("pause>0");
}
