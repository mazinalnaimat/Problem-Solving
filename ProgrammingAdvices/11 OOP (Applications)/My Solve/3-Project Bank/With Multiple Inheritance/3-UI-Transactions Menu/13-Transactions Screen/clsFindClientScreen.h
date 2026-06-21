#pragma once
#include <iostream>
#include "clsScreen.h"
#include "clsBankClient.h"
#include "clsInputValidate.h"
#include "clsPrintClientInfo.h"
#include "clsPerson.h"

using namespace std;

class clsFindClientScreen  : protected clsScreen, clsPrintClientInfo

{
private:

    /*
    static void _PrintClient(clsBankClient Client)
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

public:

    static void ShowFindClientScreen()
    {
    
        _DrawScreenHeader("\tFind Client Number Screen");
        cout << "\nPleae Enter The Client Account Number : ";
        string AccountNumber = clsInputValidate::ReadString();

        while (!clsBankClient::IsClientExist(AccountNumber))
        {
            cout << "\nThe Client Acounet Number is not found, choose another one: ";
             AccountNumber = clsInputValidate::ReadString();

        }
        
        clsBankClient Client1 = clsBankClient::Find(AccountNumber);

        if (!Client1.IsEmpty())
        {
            cout << "\nClinet Found :-)\n";
        }
        else
        {
            cout << "\n Client Was not found :-(\n";
        }
        PrintClient(Client1);

    }


};

