
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

string ReadString()
{
	string s1;

	cout << "Please Enter your Sting ? " << endl;
	getline(cin, s1);
	return s1;
}

short CountLetter(string S1, char Letter)
{
	short Count = 0;

	for (int i = 0; i < S1.length(); i++)
	{
		if(Letter == S1[i])		
			Count++;		
	}
	return Count;
}


int main()
{

	string S1 = ReadString();
	char Ch1 = ReadChar();

	cout << "\nLetter '"<< Ch1 <<"' Count = " << CountLetter(S1, Ch1);


	system("pause>0");
}


