
#include <iostream>
#include "clsBankClient.h"
#include "clsInputValidate.h"

using namespace std;

void ReadClinetInfo(clsBankClient & Client)
{
	cout << "\nEnter First Name: ";
	Client.FirstName = clsInputValidate::ReadString();

	cout << "\nEnter Last Name: ";
	Client.LastName = clsInputValidate::ReadString();

	cout << "\nEnter Email: ";
	Client.Email = clsInputValidate::ReadString();

	cout << "\nEnter  Phone: ";
	Client.Phone = clsInputValidate::ReadString();

	cout << "\nEnter PinCode : ";
	Client.PinCode = clsInputValidate::ReadString();

	cout << "\nEnter AccountBalance : ";
	Client.AccountBalance = clsInputValidate::ReadFloatNumber();



}

void UpdateClient()
{
	string AccountNumber = "";

	cout << "\nPlease Enter Cleint Account Number: ";
	AccountNumber = clsInputValidate::ReadString();
	while (!clsBankClient::IsClientExist(AccountNumber))
	{
		cout << "\nAccount number is not found, choose another one: ";
		AccountNumber = clsInputValidate::ReadString();
	}

	clsBankClient Client1 = clsBankClient::Find(AccountNumber);
	Client1.Print();

	cout << "\nUpdate Client Info: ";
	cout << "\nـــــــــــــــــــــــ\n";

	ReadClinetInfo(Client1);

	clsBankClient::enSaveResults SaveResult;

	SaveResult = Client1.Save();

	switch (SaveResult)

	{
		case clsBankClient::enSaveResults::svSucceeded:
		{
			cout << "\nAccount Updated Successfully :-)\n";
			Client1.Print();
			break;
		}
		case clsBankClient::enSaveResults::svFaildEmptyObject:
		{
			cout << "\Error account was not saved because it is Empty";
			break;
		}
	}

}

int main()
{
	UpdateClient();
	system("pause>0");
	return 0;
}

