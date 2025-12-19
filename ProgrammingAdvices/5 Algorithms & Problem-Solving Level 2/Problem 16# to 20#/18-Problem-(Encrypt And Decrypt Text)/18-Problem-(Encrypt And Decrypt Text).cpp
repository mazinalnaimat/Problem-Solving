#include <iostream>
#include<string>
using namespace std;

string ReadText()
{
	string Text = "";
	cout << "Plesae Enter the Text" << endl;
	getline(cin, Text);
	return Text;
}

string EncryptionText(string Text, short EncryptionKey)
{
	for (int i = 0; i <= Text[i]; i++)
	{
		Text[i] = char((int)Text[i] + EncryptionKey);
	}

	return 	 Text;
}
string DecryptionText(string Text, short EncryptionKey)
 {
	
		for (int i = 0; i <= Text[i]; i++)
		{
			Text[i] = char((int)Text[i] - EncryptionKey);
		}

		return 	 Text;
}


	int main() {
	const short EncryptionKey = 2;

	string Text = ReadText();
	string 	TextAfterEncryption = EncryptionText(Text, EncryptionKey);
	string 	TextAfterDecryption = DecryptionText(TextAfterEncryption, EncryptionKey);

	cout << "\nText Before Encryption : " << Text << endl;
	cout << "\nText After Encryption : " << TextAfterEncryption << endl;
	cout << "\nText After Deryption : " << TextAfterDecryption << endl;


	return 0;
}

