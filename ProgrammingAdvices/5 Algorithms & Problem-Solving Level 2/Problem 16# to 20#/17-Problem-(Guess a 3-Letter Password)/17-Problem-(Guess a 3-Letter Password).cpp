#include <iostream>
using namespace std;


string ReadPassword()
{
	string Password = "";
	cout << "Please Enter a 3-Letter Password (all capital)?" << endl;
	cin >> Password;
	return Password;
}


bool GuessPassword(string OriginalPassword)
{
	int Trail = 0;
	for (int i = 65; i <= 90; i++)
	{
		for (int j = 65; j <= 90; j++)
		{
			for (int k = 65; k <= 90; k++)
			{


				string word;
				word = (char)i;
				word += (char)j;
				word += (char)k;
				Trail = Trail + 1;
				cout << "Trail [" << Trail << "]: " << word << endl;
				if (word == OriginalPassword)
				{
					cout << "\nThe Password is: " << word ;
					cout << "\nFound After " << Trail << " Trial(s)" << endl;
					return true;
				}
				word = "";
			}
		}
	}
	return false;
}

int main()
{
	GuessPassword(ReadPassword());


	return 0;
}

