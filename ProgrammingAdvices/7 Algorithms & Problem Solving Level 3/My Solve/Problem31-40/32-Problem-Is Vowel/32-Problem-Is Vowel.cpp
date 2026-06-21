
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

bool IsVowel (char C1)
{
	string VowelLetters = "aeuioAEIUO" ;

	for (int i = 0; i < VowelLetters.length(); i++)
	{

		if (C1 == VowelLetters[i])
		{
			return true;
		}
	}
		return 0;

}


int main()
{

	
	char Ch1 = ReadChar();

	if(IsVowel(Ch1) == 1)
		cout << "\nYes Letter '" << Ch1 << "' is a vowel " << endl;
	else
		cout << "\No Letter '" << Ch1 << "' is Not a vowel " << endl;


	system("pause>0");
}


