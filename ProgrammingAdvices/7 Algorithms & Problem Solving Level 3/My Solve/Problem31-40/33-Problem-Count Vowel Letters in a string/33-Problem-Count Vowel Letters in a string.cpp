
#include<iostream>
#include<string>

using namespace std;

string ReadString()
{
	string S1;

	cout << "Please Enter your Sting ? " << endl;
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

short CountVowels(string S1)
{
	short Count = 0;
	string VowelLetters = "aeuioAEIUO";

	for (int i = 0; i < S1.length(); i++)
	{

			if (IsVowel(S1[i]))
			{
				Count++;
			}
		
	}
	return Count;

}


int main()
{

	string S1 = ReadString();
	

	cout << "\nNumber of vowels is: " << CountVowels(S1);


	system("pause>0");
}


