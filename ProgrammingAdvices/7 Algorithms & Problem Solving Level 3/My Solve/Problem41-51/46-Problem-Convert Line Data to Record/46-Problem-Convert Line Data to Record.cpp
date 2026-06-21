

#include <iostream>
#include <string>
#include<vector>

using namespace std;

struct stClient
{
	string AccountNumber;
	string PinCode;
	string Name;
	string Phone;
	double AccountBalance;

};

vector <string> SplitString(string S1, string Delim)
{
	vector <string> vString;

	string sWord;
	int pos;

	while ((pos = S1.find(Delim)) != string::npos)
	{
		sWord = S1.substr(0, pos);
		if (sWord != " ")
			vString.push_back(sWord);
		S1.erase(0, pos + Delim.length());
	}
	if (S1 != " ")
	{
		vString.push_back(S1);

	}
	return vString;


}

string ReadNewLine()
{
	
	string NewLine;
	cout << "Please Enter The Line:\n\n";

	getline(cin, NewLine);

	return NewLine;
}

stClient ConvertLineToRecord(string NewLine, string Seperator = "#//#")
{
	vector <string> vNewClient = SplitString(NewLine , Seperator);
	stClient ClientData;

	for (int i = 0; i < vNewClient.size(); i++)
	{
	 ClientData.AccountNumber =vNewClient[0];
     ClientData.PinCode = vNewClient[1];
	ClientData.Name = vNewClient[2];
     ClientData.Phone = vNewClient[3];
    (ClientData.AccountBalance) = stod(vNewClient[4]);
	}




	return ClientData;
}

void printCleintData(string NewLine)
{
	cout << "\nThe follwoing is the extracted Client record:\n";

	cout <<"\nAccount Number:" << ConvertLineToRecord(NewLine).AccountNumber << endl;
	cout << "pincode        :" << ConvertLineToRecord(NewLine).PinCode << endl;
	cout << "Name           :" << ConvertLineToRecord(NewLine).Name << endl;
	cout << "Phone          :" << ConvertLineToRecord(NewLine).Phone << endl;
	cout << "Account Balance:" << ConvertLineToRecord(NewLine).AccountBalance << endl;

}

int main()
{


	string NewLine = ReadNewLine();

	printCleintData(NewLine);


	system("pause>0");
}

