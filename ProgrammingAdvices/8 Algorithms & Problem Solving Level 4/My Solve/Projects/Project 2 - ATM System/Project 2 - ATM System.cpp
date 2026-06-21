#include <iostream>
#include<string>
#include<vector>
#include<fstream>


using namespace std;

const string ClientsFileName = "Clients.txt";



enum enATM_MainMenueOptions
{
   eQuickWithdraw = 1,  eNormalWithdraw = 2, eDeposit = 3, eShowBalance = 4, eLogout = 5
};

enum enQuickWithdrawOptions
{
    eTwenty = 1, eFifty = 2, eOneHundred = 3, eTowHundreds = 4, eFourHundreds = 5, eSixHundreds = 6, eEightHundreds = 7, eOneThousand = 8, eExit = 9
};

struct sClient
{
    string AccountNumber;
    string PinCode;
    string Name;
    string Phone;
    double AccountBalance;
    bool MarkForDelete = false;

};

sClient CurrentClient;


void GoToNormalWithdrawScreen();
void GoBackToATM_MainMenuScreen();
void  ShowQuickWithdrawScreen();
void ShowATM_MainMenuScreen();
void GotoLoginScreen();

double ReadDepositNumber()
{
    int Number;

    
    cout << "\nEnter a positive Deposit Amount? ";
    cin >> Number;  
    return Number;

}

int ReadNormalWithdraw()
{
    int Number;
  

    do
    {
        cout << "\nEnter an amount multiple of 5's ? ";
        cin >> Number;
        if (Number <= 0 || !(Number % 5 == 0))
        {
            cout << "The Value is wrong Try again.\n";
            
        }

        if (Number > CurrentClient.AccountBalance)
        {
            cout << "\nThe amount exceeds your balance, make another choice.\nPree Any key to continue...";
            system("pause>0");
            GoToNormalWithdrawScreen();
         
        }

      
    } while (Number <=0 || !(Number % 5 == 0) || Number > CurrentClient.AccountBalance);

    return Number;
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

sClient ConvertClientLineToRecord(string Line, string Seperator = "#//#")
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

string ConvertClientRecordToLine(sClient ClientData, string Seperator = "#//#")
{
    string sClientRecord = "";


    sClientRecord += ClientData.AccountNumber + Seperator;
    sClientRecord += (ClientData.PinCode) + Seperator;
    sClientRecord += ClientData.Name + Seperator;
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
            Client = ConvertClientLineToRecord(Line);
            vClients.push_back(Client);
        }
        ClientDataFile.close();

    }
    return vClients;
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

bool FindClientByAccountNumberAndPinCode(string AccountNumber, string PinCode, sClient& Client)
{
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    for (sClient& C : vClient)
    {
        if (C.AccountNumber == AccountNumber &&  C.PinCode== PinCode)
        {
            Client = C;
            return true;
        }
    }
    return false;
}

bool LoadClientInfo(string AccountNumber, string Pincode)
{
    if (FindClientByAccountNumberAndPinCode(AccountNumber, Pincode,CurrentClient))
        return true;
    else
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
                DataLine = ConvertClientRecordToLine(C);
                ClientDataFile << DataLine << endl;
            }
        }
        ClientDataFile.close();

    }
    return vClient;
}

string ReadClientAccountNumber()
{
    string AccountNumber;

    cout << "\nPlease Enter Account Number? ";
    cin >> AccountNumber;

    return AccountNumber;
}

string ReadClientPinCode()
{
    string PinCode;

    cout << "Please Enter Pincode? ";
    cin >> PinCode;

    return PinCode;
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

enATM_MainMenueOptions ReadNumberOfATM_MainMenueOptions()
{

    int Number;

    cout << "Choose what do you want to do? [1to 5]? ";
    cin >> Number;

    while (Number <= 0 || Number > 5)
    {
        cout << "The Value is Unavailable\n";
        cout << "Choose what do you want to do? [1to 5]? ";
        cin >> Number;
    }
    return (enATM_MainMenueOptions)Number;
}

void DepositByAccuontNumber()
{
    double Deposit;
    char Check;
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    Deposit = ReadDepositNumber();

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
                if (C.AccountNumber == CurrentClient.AccountNumber)
                {
                    CurrentClient.AccountBalance += Deposit;
                    C.AccountBalance += Deposit;
                    SaveClientsDataToFile(vClients, ClientsFileName);
                    break;
                }
            }
            cout << "\nDone succsssfuly. New Balance :" << CurrentClient.AccountBalance << "\n\n";

            break;
        }

        break;
    }


}
 
void NormalWithDrawByAccuontNumber( )
{
    double WithDraw;
    char Check;
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    WithDraw = ReadNormalWithdraw();
    
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
                    if (C.AccountNumber == CurrentClient.AccountNumber)
                    {
                         CurrentClient.AccountBalance -= WithDraw;
                        C.AccountBalance -= WithDraw;
                        SaveClientsDataToFile(vClients, ClientsFileName);
                        break;
                    }
                }
                cout << "\nDone succsssfuly. New Balance :" << CurrentClient.AccountBalance  <<"\n\n";

                break;
            }

            break;
        }
    
   
    
}

void ShowDepositScreen()
{
    cout << "\n====================================\n";
    cout << "\tDeposit Screen";
    cout << "\n====================================\n";

    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    DepositByAccuontNumber();

}

void ShowNormalWithdrawScreen()
{
    cout << "\n================================================\n";
    cout << "\t\tNormal Withdraw Screen";
    cout << "\n================================================\n";
    NormalWithDrawByAccuontNumber();
}

void QuickWithdraw(int WithDraw)
{
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    char Check;


    if (CurrentClient.AccountBalance >= WithDraw)
    {
        cout << "\n\nAre you Sure you want perform this transaction? y/n ? ";
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
                    if (C.AccountNumber == CurrentClient.AccountNumber)
                    {
                        CurrentClient.AccountBalance -= WithDraw;
                        C.AccountBalance -= WithDraw;
                        SaveClientsDataToFile(vClients, ClientsFileName);
                    }
                }

                cout << "\nDone succsssfuly. New Balance :" << CurrentClient.AccountBalance; "\n\n";
                  break;
            }

            break;
        }
    }
    else
    {
        cout << "\nThe amount exceeds your balance, make another choice.\nPree Any key to continue...";
        system("pause>0");
        system("cls");
        ShowQuickWithdrawScreen();
    }
    

}

enQuickWithdrawOptions ReadNumberOfQuickWithdrawOptions()
{
    int Number;

    cout << "\nChoose what to Withdraw From [1} to [9]? ";
    cin >> Number;

    while (Number <= 0 || Number > 9)
    {
        cout << "\nThe Value is Unavailable\n";
        cout << "Choose what to Withdraw From [1} to [9]? ";
        cin >> Number;
    }
    return (enQuickWithdrawOptions)Number;
}

void PerfromQuickWithdraw()
{
    enQuickWithdrawOptions QuickWithdrawOptions = ReadNumberOfQuickWithdrawOptions();

    switch (QuickWithdrawOptions)
    {
     
    case eTwenty:
    ;
    QuickWithdraw(20);
        break;
    case eFifty:
        QuickWithdraw(50);
        break;
    case eOneHundred:
        QuickWithdraw(100);
        break;
    case eTowHundreds:
        QuickWithdraw(200);
        break;
    case eFourHundreds:
        QuickWithdraw(400);
        break;
    case eSixHundreds:
        QuickWithdraw(600);
        break;
    case eEightHundreds:
        QuickWithdraw(800);
        break;
    case eOneThousand:
        QuickWithdraw(1000);
        break;
    case eExit:
        ShowATM_MainMenuScreen(); 
        break;
   
    }
}

void ShowQuickWithdrawScreen()
{
    cout << "================================================";
    cout << "\n\t\tQuick Withdraw ";
    cout << "\n================================================";
    cout << "\n\t [1] 20      [2]50";
    cout << "\n\t [3] 100     [4]200";
    cout << "\n\t [5] 400     [6]600";
    cout << "\n\t [7] 800     [8]1000";
    cout << "\n\t [9] Exit";
    cout << "\n================================================";
    cout << "\nYour Balance is " << CurrentClient.AccountBalance;

    string AccountNumber;
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);

    PerfromQuickWithdraw();

}

void ShowBalanceScreen()
{
    cout << "==================================================";
    cout << "\n\t\tCheck Balance Screen";
    cout << "\n==================================================";
    cout << "\nYour Balance is " << CurrentClient.AccountBalance<<"\n\n";
}

void GoBackToATM_MainMenuScreen()
{

    cout << "\nPress any key to go back to Main Menue...";
    system("pause>0");
    ShowATM_MainMenuScreen();

}

void ShowEndScreen()
{
    cout << "\n------------------------------------\n";
    cout << "\tProgram Ends :-)";
    cout << "\n------------------------------------\n";

    system("pause>0");

}

void PrintLoginView()
{
    cout << "\n-------------------------------------";
    cout << "\n             Login Screen           ";
    cout << "\n-------------------------------------";
}

void PerfromATM_MainMenueOptions()

{
    enATM_MainMenueOptions ATM_MainMenueOptions = ReadNumberOfATM_MainMenueOptions();

    switch (ATM_MainMenueOptions)
    {

    case eQuickWithdraw:
        system("cls");
        ShowQuickWithdrawScreen();
        GoBackToATM_MainMenuScreen();
        break;

    case eNormalWithdraw:
        system("cls");
        ShowNormalWithdrawScreen();
        GoBackToATM_MainMenuScreen();
        break;

    case eDeposit:
        system("cls");
        ShowDepositScreen();
        GoBackToATM_MainMenuScreen();
        break;

    case eShowBalance:
        system("cls");
        ShowBalanceScreen();
        GoBackToATM_MainMenuScreen();
        break;

    case eLogout:
        GotoLoginScreen();
        break;
  
    }
 

    
}

void GoToNormalWithdrawScreen()
{
    system("cls");
    ShowNormalWithdrawScreen();
}

void PrintATM_MainMenuScreen()
{
    cout << "=================================================\n";
    cout << "\t\tATM Main Menue Screen\n";
    cout << "=================================================\n";
    cout << "\t[1] Quick Withdraw.\n";
    cout << "\t[2] Normal Withdraw.\n";
    cout << "\t[3] Deposit.\n";
    cout << "\t[4] Check Balance.\n";
    cout << "\t[5] Logout.\n";
    cout << "=================================================\n";
}

void ShowATM_MainMenuScreen()
{
    system("cls");
    PrintATM_MainMenuScreen();
    PerfromATM_MainMenueOptions();
}

void Login()
{
    string AccountNumber = "", PinCode = "";
    bool LoginFaild = false;

    do
    {        system("cls");
        PrintLoginView();
        if (LoginFaild)
          cout << "\nInvalid Account Number/Pin Code!";
      
        AccountNumber = ReadClientAccountNumber();
        PinCode = ReadClientPinCode();
        LoginFaild = !LoadClientInfo(AccountNumber, PinCode);

    } while (LoginFaild);

    ShowATM_MainMenuScreen();
}

void GotoLoginScreen()
{
    Login();
}

int main()
{
    Login();

    system("pause>0");
    return 0;
}







