#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string S1;

	cout << "Please Enter your String ? " << endl;
	getline(cin, S1);
	return S1;
}

short CounhWordsInString(string S1)
{
	cout << "\nYour String Words are:" << endl;


	string delim = " ";
	short pos = 0;
	string sWord;
	short Counter = 0;

	while ((pos = S1.find(delim)) != std::string::npos)
	{
		sWord = S1.substr(0, pos);
		if (sWord != " ")
		{
			Counter++;
		}
		S1.erase(0, pos + delim.length());
	}


	if (S1 != " ")
	{
		Counter++;
	}
	return Counter;
}


int main()
{

	string S1 = ReadString();
	cout << "The number of words in your string is: " << CounhWordsInString(S1);


	system("pause>0");
}
