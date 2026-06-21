
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

bool IsVowel(char C1)
{
	string VowelLetters = "aeuioAEIUO";

	for (int i = 0; i < VowelLetters.length(); i++)
	{

		if (C1 == VowelLetters[i])
		{
			return true;
		}
	}
	return 0;
}

void PrintAllVowelInSring(string S1)
{
	
	cout << "\nVowels in string are: ";
	for (int i = 0; i < S1.length(); i++)
	{
	
		if (IsVowel(S1[i]))
		{
			cout <<  S1[i] <<"   ";

		}
	}
}




int main()
{

	string S1 = ReadString();

	PrintAllVowelInSring(S1);

	system("pause>0");
}


