#include <iostream>
#include<string>
#include<vector>
#include<fstream>
#include<iomanip>

using namespace std;

const string ClientsFileName = "Clients.txt";
void ShowMainMenuScreen();
void ShowTransactionsScreen();

enum enMainMenueOptions { eShow = 1, eAdd = 2, eDelete = 3, eUpdate = 4, eFind = 5, eTranaction = 6, eExit = 7 };
enum enTransacroinsMenueOptions { eDeposit = 1, ewithdraw = 2, eShowTotalBalances = 3, eShowMainMenue = 4 };

struct sClient
{
    string AccountNumber;
    string PinCode;
    string Name;
    string Phone;
    double AccountBalance;
    bool MarkForDelete = false;

};

sClient ReadNewClient(string AccountNumber)
{
    sClient Client;
    Client.AccountNumber = AccountNumber;


    cout << "Enter Pin Code? ";
    getline(cin >> ws, Client.PinCode);

    cout << "Enter Name? ";
    getline(cin, Client.Name);

    cout << "Enter Phone? ";
    getline(cin, Client.Phone);

    cout << "Enter Account Balance? ";
    cin >> Client.AccountBalance;

    return Client;
}

sClient ChangeClientRecord(string AccountNumber)
{
    sClient Client;

    Client.AccountNumber = AccountNumber;

    cout << "\n\nEnter Pin Code? ";
    getline(cin >> ws, Client.PinCode);

    cout << "Enter Name? ";
    getline(cin, Client.Name);

    cout << "Enter Phone? ";
    getline(cin, Client.Phone);

    cout << "Enter Account Balance? ";
    cin >> Client.AccountBalance;

    return Client;
}

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

sClient ConvertLineToRecord(string Line, string Seperator = "#//#")
{
    sClient Client;
    vector<string> vClientData;
    vClientData = SplitString(Line, Seperator);


    Client.AccountNumber = vClientData[0];
    Client.PinCode = vClientData[1];
    Client.Name = vClientData[2];
    Client.Phone = vClientData[3];
    Client.AccountBalance = stod(vClientData[4]);


    return Client;
}

string ConvertRecordToLine(sClient ClientData, string Seperator = "#//#")
{
    string sClientRecord = "";


    sClientRecord += ClientData.AccountNumber + Seperator; ;
    sClientRecord += (ClientData.PinCode) + Seperator; ;
    sClientRecord += ClientData.Name + Seperator; ;
    sClientRecord += ClientData.Phone + Seperator;
    sClientRecord += to_string(ClientData.AccountBalance);

    return sClientRecord;
}

vector <sClient> LoadClientsDataFromFile(string FileName)
{

    vector <sClient> vClients;
    fstream ClientDataFile;
    ClientDataFile.open(FileName, ios::in);

    if (ClientDataFile.is_open())
    {
        string Line;
        sClient Client;

        while (getline(ClientDataFile >> ws, Line))
        {
            Client = ConvertLineToRecord(Line);
            vClients.push_back(Client);
        }
        ClientDataFile.close();

    }
    return vClients;
}

void PrintClientRecord(sClient ClientData)
{

    cout << "| " << left << setw(15) << ClientData.AccountNumber;
    cout << "| " << left << setw(10) << ClientData.PinCode;
    cout << "| " << left << setw(40) << ClientData.Name;
    cout << "| " << left << setw(12) << ClientData.Phone;
    cout << "| " << left << setw(12) << ClientData.AccountBalance;
}

void PrintClientBalance(sClient ClientData)
{

    cout << "| " << left << setw(15) << ClientData.AccountNumber;
    cout << "| " << left << setw(40) << ClientData.Name;
    cout << "| " << left << setw(12) << ClientData.AccountBalance;
}

void PrintAllClientsData(vector<sClient> vClient)
{

    system("cls");
    cout << "\n\t\t\t\t\tClient List (" << vClient.size() << ") Client(s).";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;
    cout << "| " << left << setw(15) << "Account Number";
    cout << "| " << left << setw(10) << "Pin Code";
    cout << "| " << left << setw(40) << "Client Name";
    cout << "| " << left << setw(12) << "Phone";
    cout << "| " << left << setw(12) << "Balance";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;

    for (sClient Cleint : vClient)
    {
        PrintClientRecord(Cleint);
        cout << endl;
    }
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;

}

void PrintCleintCard(sClient Client)
{
    cout << "\nThe follwoing are the client details:\n";
    cout << "-------------------------------------";
    cout << "\nAccount Number :" << Client.AccountNumber << endl;
    cout << "pincode        :" << Client.PinCode << endl;
    cout << "Name           :" << Client.Name << endl;
    cout << "Phone          :" << Client.Phone << endl;
    cout << "Account Balance:" << Client.AccountBalance << endl;
    cout << "-------------------------------------\n";

}

bool FindClientByAccountNumber(string AccountNumber, sClient& Client)
{
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    for (sClient& C : vClient)
    {
        if (C.AccountNumber == AccountNumber)
        {
            Client = C;
            return true;
        }
    }

    return false;
}

bool FindClientByAccountNumber(string AccountNumber, vector <sClient> vClient, sClient& Client)
{

    for (sClient& C : vClient)
    {
        if (C.AccountNumber == AccountNumber)
        {
            Client = C;
            return true;
        }
    }

    return false;
}

bool MarkCkientForDeleteByAccountNumber(string AccountNumber, vector <sClient>& vClient)
{
    for (sClient& C : vClient)
    {
        if (C.AccountNumber == AccountNumber)
        {
            C.MarkForDelete = true;
            return true;
        }
    }
    return false;
}

vector <sClient> SaveClientsDataToFile(vector <sClient>vClient, string FileName)
{

    fstream ClientDataFile;
    ClientDataFile.open(FileName, ios::out);

    string DataLine;

    if (ClientDataFile.is_open())
    {
        for (sClient& C : vClient)
        {
            if (C.MarkForDelete == false)
            {
                DataLine = ConvertRecordToLine(C);
                ClientDataFile << DataLine << endl;
            }
        }
        ClientDataFile.close();

    }
    return vClient;
}

bool DelteClientByAccountNumber(string AccountNumber, vector <sClient>& vClients)
{
    char Check;
    sClient Client;


    if (FindClientByAccountNumber(AccountNumber, vClients, Client))
    {
        PrintCleintCard(Client);

        cout << "\nAre you Sure you want delete this client? y/n ? ";
        cin >> Check;

        while (tolower(Check) != 'y' && tolower(Check) != 'n')
        {
            cout << "The value is unavailable Try again" << endl;
            cout << "Are you Sure you want delete this client? y/n ? ";
            cin >> Check;
        }
        while (tolower(Check) == 'y' || tolower(Check) == 'n')
        {
            if (tolower(Check) == 'y')
            {

                MarkCkientForDeleteByAccountNumber(AccountNumber, vClients);
                SaveClientsDataToFile(vClients, ClientsFileName);

                vClients = LoadClientsDataFromFile(ClientsFileName);

                cout << "\n\n Client Deleted Successfully" << endl;
                return true;

            }
            /*
            else
            {
                cout << "\n\n Client is Not Deleted Successfully" << endl;
            }*/
            break;
        }

    }
    else
    {
        cout << "\nClient with Account Number (" << AccountNumber << ") Is Not Found!";
        return false;
    }
}

bool UpdateClientByAccountNumber(string AccountNumber, vector <sClient>& vClients)
{
    char Check;
    sClient Client;


    if (FindClientByAccountNumber(AccountNumber, vClients, Client))
    {
        PrintCleintCard(Client);

        cout << "\nAre you Sure you want Update this client? y/n ? ";
        cin >> Check;

        while (tolower(Check) != 'y' && tolower(Check) != 'n')
        {
            cout << "The value is unavailable Try again" << endl;
            cout << "Are you Sure you want Update this client? y/n ? ";
            cin >> Check;
        }
        while (tolower(Check) == 'y' || tolower(Check) == 'n')
        {
            if (tolower(Check) == 'y')
            {

                for (sClient& C : vClients)
                {
                    if (C.AccountNumber == AccountNumber)
                    {
                        C = ChangeClientRecord(AccountNumber);
                        break;
                    }
                }
                SaveClientsDataToFile(vClients, ClientsFileName);


                cout << "\n\n Client Updated Successfully." << endl;
                return true;

            }
            break;
        }

    }
    else
    {
        cout << "\nClient with Account Number (" << AccountNumber << ") Is Not Found!";
        return false;
    }
}

string ReadClientAccountNumber()
{
    string AccountNumber;

    cout << "\nPlease Enter Account Number? ";
    cin >> AccountNumber;

    return AccountNumber;
}

void AddDataLineToFile(string FileName, string stDataLine)
{
    fstream MyFile;
    MyFile.open(FileName, ios::out | ios::app);
    if (MyFile.is_open())
    {
        MyFile << stDataLine << endl;
        MyFile.close();
    }
}

void AddNewClient()
{
    sClient Client;
    bool IsFound = true;
    cout << "\nEnter Account Number? ";
    getline(cin >> ws, Client.AccountNumber);

    string AccountNumber = Client.AccountNumber;

    do {
        if (!FindClientByAccountNumber(AccountNumber, Client))
        {
            IsFound = false;
            Client = ReadNewClient(AccountNumber);
            AddDataLineToFile(ClientsFileName, ConvertRecordToLine(Client));
            break;
        }
        else
        {
            cout << "\nClient with Account Number (" << AccountNumber << ") already exists, Enter another AccountNumber? ";
            getline(cin >> ws, AccountNumber);
        }
    } while (IsFound);
}

void AddClients()
{
    char AddMore = 'Y';
    do
    {

        cout << "Adding New Client:\n";
        AddNewClient();
        cout << "\nClient Added Successfully, do you want to add more clients ? Y / N ? ";
        cin >> AddMore;


    } while (toupper(AddMore) == 'Y');
}

enMainMenueOptions ReadNumberOfMainMenuOptions()
{

    int Number;

    cout << "choose what do you want to do? [1 to 7]? ";
    cin >> Number;

    while (Number <= 0 || Number > 6)
    {
        cout << "The Value is Unavailable\n";
        cout << "choose what do you want to do? [1 to 7]? ";
        cin >> Number;
    }
    return (enMainMenueOptions)Number;
}

enTransacroinsMenueOptions ReadNumberOfTransacrtionsMenueOptions()
{

    int Number;

    cout << "choose what do you want to do? [1to 4]? ";
    cin >> Number;

    while (Number <= 0 || Number > 4)
    {
        cout << "The Value is Unavailable\n";
        cout << "choose what do you want to do? [1to 4]? ";
        cin >> Number;
    }
    return (enTransacroinsMenueOptions)Number;
}

void DepositByAccuontNumber(string AccountNumber, sClient Client, vector <sClient>& vClients)
{
    double Deposit;

    char Check;
    do
    {
        AccountNumber = ReadClientAccountNumber();
        if (FindClientByAccountNumber(AccountNumber, vClients, Client))
        {
            PrintCleintCard(Client);

            cout << "Please Enter Deposit amount? ";
            cin >> Deposit;
            cout << "\nAre you Sure you want perform this transaction? y/n ? ";
            cin >> Check;

            while (tolower(Check) != 'y' && tolower(Check) != 'n')
            {
                cout << "The value is unavailable Try again";
                cout << "\nAre you Sure you want perform this transaction? y/n ? ";
                cin >> Check;
            }
            while (tolower(Check) == 'y' || tolower(Check) == 'n')
            {
                if (tolower(Check) == 'y')
                {
                    for (sClient& C : vClients)
                    {
                        if (C.AccountNumber == AccountNumber)
                        {
                            C.AccountBalance += Deposit;
                            break;
                        }
                    }
                    SaveClientsDataToFile(vClients, ClientsFileName);

                    cout << "\nDone succsssfuly.\n";
                    cout << "New Balance :" << Client.AccountBalance + Deposit;
                    break;
                }
                else
                    break;
            }
        }
        else
        {
            cout << "Clien with [" << AccountNumber << "] does not exist." << endl;
        }
    } while (!FindClientByAccountNumber(AccountNumber, vClients, Client));

}

void WithDrawByAccuontNumber(string AccountNumber, sClient Client, vector <sClient>& vClients)
{
     double WithDraw;

    char Check;
    do
    {
        AccountNumber = ReadClientAccountNumber();
        if (FindClientByAccountNumber(AccountNumber, vClients, Client))
        {
            PrintCleintCard(Client);

            cout << "Please Enter Withdraw amount? ";
            cin >> WithDraw;

            for (sClient& C : vClients)
            {
                if (C.AccountNumber == AccountNumber)
                {
                   do 
                    {
                        if (C.AccountBalance >= WithDraw)
                        {
                            cout << "\nAre you Sure you want perform this transaction? y/n ? ";
                            cin >> Check;

                            while (tolower(Check) != 'y' && tolower(Check) != 'n')
                            {
                                cout << "The value is unavailable Try again";
                                cout << "\nAre you Sure you want perform this transaction? y/n ? ";
                                cin >> Check;
                            }
                            while (tolower(Check) == 'y' || tolower(Check) == 'n')
                            {
                                if (tolower(Check) == 'y')
                                {
                                    C.AccountBalance -= WithDraw;
                                    SaveClientsDataToFile(vClients, ClientsFileName);

                                    cout << "\nDone succsssfuly.\n";
                                    cout << "New Balance :" << Client.AccountBalance - WithDraw;

                                    break;
                                }
                                break;
                            }
                            break;
                        }

                        else
                        {
                            cout << "\nAmount Exceeds the balance, you can withdraw up to :" << Client.AccountBalance << endl;
                            cout << "Please Enter another amount? ";
                            cin >> WithDraw;



                        }

                   } while ( C.AccountBalance != C.AccountBalance - WithDraw);
                }
            }

        }
        else
        {
            cout << "Clien with [" << AccountNumber << "] does not exist." << endl;
        }
    } while (!FindClientByAccountNumber(AccountNumber, vClients, Client));

}

void PrintMainMenue()
{
    cout << "=======================================================\n";
    cout << "\t\tMain Menue Screen\n";
    cout << "=======================================================\n";
    cout << "\t[1] Show Client List.\n";
    cout << "\t[2] Add New CLient.\n";
    cout << "\t[3] Delete Client.\n";
    cout << "\t[4] Update Client Info.\n";
    cout << "\t[5] Find Client.\n";
    cout << "\t[6] Transactions.\n";
    cout << "\t[7] Exit.\n";
    cout << "=======================================================\n";

}

void PrintTransactionsMenue()
{
    cout << "=======================================================\n";
    cout << "\t\tTransactions Menue Screen\n";
    cout << "=======================================================\n";
    cout << "\t[1] Deposit.\n";
    cout << "\t[2] Withdraw.\n";
    cout << "\t[3] Total Balances.\n";
    cout << "\t[4] Main Menue.\n";
    cout << "=======================================================\n";

}

void ShowDepositScreen()
{
    cout << "\n-----------------------------------\n";
    cout << "\tDeposit Screen";
    cout << "\n-----------------------------------\n";


    sClient Client;
    string AccountNumber;
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    DepositByAccuontNumber(AccountNumber, Client, vClients);

}

void ShowWithdrawScreen()
{
    cout << "\n-----------------------------------\n";
    cout << "\tWithdraw Screen";
    cout << "\n-----------------------------------\n";

    int Deposit;
    sClient Client;
    string AccountNumber;
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    WithDrawByAccuontNumber(AccountNumber, Client, vClients);

}

void ShowTotalBalancesScreen()
{
    double TotalBalances = 0;
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    system("cls");
    cout << "\n\t\t\t\t\Balances List (" << vClient.size() << ") Client(s).";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;
    cout << "| " << left << setw(15) << "Account Number";
    cout << "| " << left << setw(40) << "Client Name";
    cout << "| " << left << setw(12) << "Balance";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;

    for (sClient & Client : vClient)
    {
        TotalBalances += Client.AccountBalance;
        PrintClientBalance(Client);
        cout << endl;
    }
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;
    cout << "\n\t\t\t\t\tTotal Balances = " << TotalBalances << endl;


}

void GoBackToTransactionsScreen()
{

    cout << "\nPress any key to go back to Transacrions Menue...";
    system("pause>0");
    ShowTransactionsScreen();

}

void PerfromTransactionsMenueOption()
{
    enTransacroinsMenueOptions TransacrionsMenueOptions = ReadNumberOfTransacrtionsMenueOptions();

    switch (TransacrionsMenueOptions)
    {
    case eDeposit:
        system("cls");
        ShowDepositScreen();
        GoBackToTransactionsScreen();

        break;
    case ewithdraw:
        system("cls");
        ShowWithdrawScreen();
        GoBackToTransactionsScreen();

        break;
    case eShowTotalBalances:
        system("cls");
        ShowTotalBalancesScreen();
        GoBackToTransactionsScreen();

        break;
    case eShowMainMenue:ShowMainMenuScreen();
        break;

    }
}

void ShowAllClientsScreen()
{
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    PrintAllClientsData(vClient);
}

void ShowAddNewClientsScreen()
{
    cout << "\n-----------------------------------\n";
    cout << "\tAdd New Clients Screen";
    cout << "\n-----------------------------------\n";
    AddClients();
}

void ShowDeleteClientScreen()
{
    cout << "\n-----------------------------------\n";
    cout << "\tDelete Clients Screen";
    cout << "\n-----------------------------------\n";

    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    string AccountNumber = ReadClientAccountNumber();
    DelteClientByAccountNumber(AccountNumber, vClients);
}

void ShowUpdateClientScreen()
{
    cout << "\n---------------------------------------------\n";
    cout << "\tUpdate Clients Info Screen";
    cout << "\n---------------------------------------------\n";

    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    string AccountNumber = ReadClientAccountNumber();
    UpdateClientByAccountNumber(AccountNumber, vClients);
}

void ShowFindClientScreen()
{
    sClient Client;
    cout << "\n------------------------------------\n";
    cout << "\Find Client Screen";
    cout << "\n------------------------------------\n";
    if (FindClientByAccountNumber(ReadClientAccountNumber(), Client))
    {
        PrintCleintCard(Client);

    }
    else
        cout << "\nClient with Account Number (" << Client.AccountNumber << ") Is Not Found!";

}

void ShowTransactionsScreen()
{
    system("cls");
    PrintTransactionsMenue();
    PerfromTransactionsMenueOption();
}

void ShowEndScreen()
{
    cout << "\n------------------------------------\n";
    cout << "\tProgram Ends :-)";
    cout << "\n------------------------------------\n";

    system("pause>0");

}

void GoBackToMainScreen()
{

    cout << "\nPress any key to go back to Main Menue...";
    system("pause>0");
    ShowMainMenuScreen();

}

void PerfromMainMenueOption()
{

    enMainMenueOptions MainMenuOptions = ReadNumberOfMainMenuOptions();

    switch (MainMenuOptions)
    {

    case eShow:

        system("cls");
        ShowAllClientsScreen();
        GoBackToMainScreen();

        break;

    case eAdd:

        system("cls");
        ShowAddNewClientsScreen();
        GoBackToMainScreen();

        break;

    case eDelete:

        system("cls");
        ShowDeleteClientScreen();
        GoBackToMainScreen();

        break;

    case eUpdate:

        system("cls");
        ShowUpdateClientScreen();
        GoBackToMainScreen();

        break;

    case eFind:

        system("cls");
        ShowFindClientScreen();
        GoBackToMainScreen();
        break;

    case eTranaction:

        system("cls");
        ShowTransactionsScreen();
        GoBackToMainScreen();

        break;

    case eExit:

        system("cls");
        ShowEndScreen();
        break;
    }

}

void ShowMainMenuScreen()
{
    system("cls");
    PrintMainMenue();
    PerfromMainMenueOption();
}

int main()
{

    ShowMainMenuScreen();
    system("pause>0");
    return 0;
}







