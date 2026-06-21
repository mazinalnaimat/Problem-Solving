#pragma once

#include <iostream>
#include "clsScreen.h"
#include "clsBankClient.h"
#include "clsInputValidate.h"
#include "clsPrintClientInfo.h"
#include "clsReadClientInfo.h"
#include <iomanip>

class clsUpdateClientScreen : protected clsScreen, clsPrintClientInfo, clsReadClientInfo
{
private:

	/* static void _ReadClientInfo(clsBankClient& Client)
  {
	  cout << "\nEnter FirstName: ";
	  Client.FirstName = clsInputValidate::ReadString();

	  cout << "\nEnter LastName: ";
	  Client.LastName = clsInputValidate::ReadString();

	  cout << "\nEnter Email: ";
	  Client.Email = clsInputValidate::ReadString();

	  cout << "\nEnter Phone: ";
	  Client.Phone = clsInputValidate::ReadString();

	  cout << "\nEnter PinCode: ";
	  Client.PinCode = clsInputValidate::ReadString();

	  cout << "\nEnter Account Balance: ";
	  Client.AccountBalance = clsInputValidate::ReadFloatNumber();
  }
 */
 /*static void _PrintClient(clsBankClient Client)
  {
	  cout << "\nClient Card:";
	  cout << "\n___________________";
	  cout << "\nFirstName   : " << Client.FirstName;
	  cout << "\nLastName    : " << Client.LastName;
	  cout << "\nFull Name   : " << Client.FullName();
	  cout << "\nEmail       : " << Client.Email;
	  cout << "\nPhone       : " << Client.Phone;
	  cout << "\nAcc. Number : " << Client.AccountNumber();
	  cout << "\nPassword    : " << Client.PinCode;
	  cout << "\nBalance     : " << Client.AccountBalance;
	  cout << "\n___________________\n";

  }*/

public : 

	static void ShowUpdateClientScrren()
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
		PrintClient(Client1);

		cout << "\nUpdate Client Info: ";
		cout << "\nـــــــــــــــــــــــ\n";

		ReadClientInfo(Client1);

		clsBankClient::enSaveResults SaveResult;

		SaveResult = Client1.Save();

		switch (SaveResult)

		{
		case clsBankClient::enSaveResults::svSucceeded:
		{
			cout << "\nAccount Updated Successfully :-)\n";
			PrintClient(Client1);
			break;
		}
		case clsBankClient::enSaveResults::svFaildEmptyObject:
		{
			cout << "\Error account was not saved because it is Empty";
			break;
		}
		}
	}
};

