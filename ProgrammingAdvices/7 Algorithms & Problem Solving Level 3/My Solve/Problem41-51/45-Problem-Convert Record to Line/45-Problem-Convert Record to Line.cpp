

#include <iostream>
#include <string>
#include<vector>

using namespace std;

struct stClientData
{
	string AccountNumber;
	string pincode;
	string Name;
	string Phone;
	double AccountBalance;

};

stClientData ReadNewClient()
{
	cout << "Please Enter Client Data:\n\n";

	stClientData ClientData;


	cout << "Enter Account Number? ";
	getline(cin, ClientData.AccountNumber);
	
	cout << "Enter pincode? ";
	getline(cin, ClientData.pincode);
	
	cout << "Enter Name ? ";
	getline(cin ,ClientData.Name);	
	
	cout << "Enter Phone? ";
	getline(cin, ClientData.Phone);
	
	cout << "Enter Account Balance? ";
    cin >> ClientData.AccountBalance;

	return ClientData;
}

string ConvertRecordToLine(stClientData ClientData, string Seperator = "#//#")
{
	string stClientRecord;

	
		stClientRecord += ClientData.AccountNumber + Seperator; ;
		stClientRecord +=(ClientData.pincode) + Seperator; ;
		stClientRecord += ClientData.Name + Seperator; ;
		stClientRecord += ClientData.Phone + Seperator; 
		stClientRecord += to_string(ClientData.AccountBalance);
	
	return stClientRecord;
}

int main()
{


	stClientData ClientData = ReadNewClient();

	cout << "\n\nClient Record for Saving is:\n";
	cout << ConvertRecordToLine(ClientData,"#//#");




	system("pause>0");
}

