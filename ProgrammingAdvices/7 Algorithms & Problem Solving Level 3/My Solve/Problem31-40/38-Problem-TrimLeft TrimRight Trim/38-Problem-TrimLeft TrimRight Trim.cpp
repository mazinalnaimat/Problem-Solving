

#include <iostream>
#include<vector>
#include<string>
using namespace std;

string ReadString()
{
	string S1;

	cout << "Please Enter your String ? " << endl;
	getline(cin, S1);
	return S1;
}

string TrimLeft(string S1)
{
	for (short i = 0; i < S1.length(); i++)
	{
		if (S1[i] != ' ')
		{
			return S1.substr(i, S1.length() - i);
		}
    }
	return "";
}

string TrimRight(string S1)
{/*
	string TrimRightString;

	int pos = 0;

	if (S1[S1.length() - 1] != ' ')
	{
		return TrimRightString = S1;
	}


	while (pos < S1.length())
	{
		if (S1[pos] == ' ')
		{
			for (int i = pos; i < S1.length(); i++)
			{
				if (S1[i] != ' ')
					break;
				if (i == S1.length() - 1)
				{
					return TrimRightString = S1.erase(pos, S1.length() - 1);
				}
			}
		}
		pos++;
	}*/

	for (short i = S1.length(); i >= 0; i--)
	{
		if (S1[i] != ' ')
		{
			return S1.substr(0, i+1);
		}
	}
	return "";
}

string Trim(string S1)
{
	return TrimRight(TrimLeft(S1));
}



int main()
{
	
	
	string S1 = ReadString();
	cout << "\nTrim Left  =" << TrimLeft(S1) ;
	cout << "\nTrim Right =" << TrimRight(S1);
	cout << "\nTrim       =" << Trim (S1);
	



	system("pause>0");
}
