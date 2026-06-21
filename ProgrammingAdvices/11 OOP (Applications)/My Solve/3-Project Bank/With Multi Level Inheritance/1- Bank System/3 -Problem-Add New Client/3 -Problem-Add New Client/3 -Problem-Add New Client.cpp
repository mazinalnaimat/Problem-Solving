

#include <iostream>
#include "clsBankClient.h"
#include "clsPerson.h"
#include "clsInputValidate.h"

using namespace std;


void ReadClinetInfo(clsBankClient& Client)
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

void AddNewClient()
{
    string AccountNumber = "";

    cout << "\nPlease Enter Account Number: ";
    AccountNumber = clsInputValidate::ReadString();
    while (clsBankClient::IsClientExist(AccountNumber))
    {
        cout << "\nAccount Number Is Already Used, Choose aonther one: ";
        AccountNumber = clsInputValidate::ReadString();
    }

    clsBankClient NewClient = clsBankClient::GetAddNewClientObject(AccountNumber);


    ReadClinetInfo(NewClient);

    clsBankClient::enSaveResults SaveResult;

    SaveResult = NewClient.Save();

   switch (SaveResult)
    {
   case clsBankClient::enSaveResults::svSucceeded:
        {
            cout << "\nAccout Added Successfully :-)\n";
            NewClient.Print();
            break;
        }
        case clsBankClient::enSaveResults::svFaildEmptyObject:
        {
            cout << "\nError account was not saved beacuse it is Empty";
            break;

        }
        case clsBankClient::enSaveResults::svFaildAccountNumberExists:
        {
            cout << "\nError account was not saved because account number is used!\n";
            break;
        }
    }

}


int main()
{
    AddNewClient();
    system("pause>0");
    return 0;
}

