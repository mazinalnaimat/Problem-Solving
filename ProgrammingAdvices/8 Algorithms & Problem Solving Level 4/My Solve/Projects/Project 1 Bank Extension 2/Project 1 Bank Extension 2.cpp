#include <iostream>
#include<string>
#include<vector>
#include<fstream>
#include<iomanip>


using namespace std;

const string ClientsFileName = "Clients.txt";
const string UsersFileName = "Users.txt";


enum enMainMenueOptions
{ 
    eShow = 1, eAdd = 2, eDelete = 3, eUpdate = 4, eFind = 5, eTranaction = 6, eManageUsers = 7,eLogout = 8 };

enum enTransacroinsMenueOptions 
{
    eDeposit = 1, ewithdraw = 2, eShowTotalBalances = 3, eShowMainMenue = 4 };

enum  enManageUsersMenueOptions
{ 
    eListUsres = 1, eAddNewUsre = 2, eDeleteUser = 3, eUpdateUser = 4, eFindUser = 5, eShowMainMenueWhenInManageUsers = 6 };

enum enMainMenuePermissions {
    eAll = -1, pListClients = 1, pAddNewClient = 2 , pDeleteClient = 4,
    pUpdateClient = 8, pFindClient = 16 , pTransactions= 32, pManagerUseres =64
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

struct stUser
{
    string Username;
    string Password;
    short Permissions;
    bool MarkForDelete = false;

};

stUser CurrentUser;

void ShowMainMenuScreen();
void GoBackToManageUsersScreen();
void ShowTransactionsScreen( );
void GotoLoginScreen();


long long DecimalToBinary(int n) {
    long long ans = 0;
    int remainder, i = 1;

    // Until the value of n becomes 0.
    while (n != 0) {
        remainder = n % 2;
        ans += remainder * i;
        i = i * 10;
        n = n / 2;
    }

    return ans;
}

int BinaryToDecimal(long long n) {
    int ans = 0, remainder, i = 0;

    // Until the value of n becomes 0.
    while (n != 0) {
        remainder = n % 10;
        ans += remainder * pow(2, i);
        i++;

        // Remove the rightmost digit of n.
        n = n / 10;
    }

    return ans;
}

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

short ReadPermissionsUser()
{
    char Answer ;
    short Pemissions = 0 ;

    cout << "\nDo you want to give full access? y/n? ";
    cin >> Answer;
    if (toupper(Answer) == ('Y'))
        return Pemissions =  -1;
    if (toupper(Answer) == 'N')
    {
        cout << "\nDo you want to give access to:";

        cout << "\n\nShow Client List? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {          
             Pemissions +=  enMainMenuePermissions::pListClients;
        }


        cout << "\nAdd New Client? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
           
            Pemissions += enMainMenuePermissions::pAddNewClient;
        }


        cout << "\nDelete Client? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
            Pemissions += enMainMenuePermissions::pDeleteClient;
        }

        cout << "\nUpdate Client? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
            Pemissions += enMainMenuePermissions::pUpdateClient;
        }

        cout << "\nFind Client? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
            Pemissions += enMainMenuePermissions::pFindClient;
        }

        cout << "\nTransactions? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
            Pemissions += enMainMenuePermissions::pTransactions;
        }

        cout << "\nManage Users? y/n?";
        cin >> Answer;
        if (toupper(Answer) == ('Y'))
        {
            Pemissions += enMainMenuePermissions::pManagerUseres;
        }

        return Pemissions;
    }

}

stUser  ReadNewUser(string Username)
{
    stUser User;
    User.Username = Username;


    cout << "Enter Password? ";
    getline(cin >> ws, User.Password);

    User.Permissions  =  ReadPermissionsUser();

    return User;
}

string ReadUsername()
{
    string Username = "";
    cout << "\nEnter Username? ";
    cin >> Username;
    return Username;
}

string ReadUserPassword()
{
    string Password = "";
    cout << "Enter Password? ";
    cin >> Password;
    return Password;
}

stUser ReadFullUser()
{
    stUser User;
    User.Username = ReadUsername();
    User.Password = ReadUserPassword();
    return User;
}

enManageUsersMenueOptions ReadNumberOfManageUsersMenueOptions()
{
    int Number;

    cout << "choose what do you want to do? [1to 6]? ";
    cin >> Number;

    while (Number <= 0 || Number > 6)
    {
        cout << "The Value is Unavailable\n";
        cout << "choose what do you want to do? [1to 6]? ";
        cin >> Number;
    }
    return (enManageUsersMenueOptions)Number;
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

stUser ChangeUserRecord(string Username)
{
    stUser User;

    User.Username = Username;

    cout << "\n\nEnter Password? ";
    getline(cin >> ws, User.Password);

   
    User.Permissions = ReadPermissionsUser();
    

    return User;
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

stUser ConvertUserLineToRecord(string Line, string Seperator = "#//#")
{
    stUser User;
    vector<string> vUserData;
    vUserData = SplitString(Line, Seperator);


    User.Username = vUserData[0];
    User.Password = vUserData[1];
    User.Permissions = stoi(vUserData[2]);



    return User;
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

string ConvertUserRecordToLine(stUser UserData, string Seperator = "#//#")
{
    string sClientRecord = "";


    sClientRecord += UserData.Username + Seperator; ;
    sClientRecord += UserData.Password + Seperator; ;
    sClientRecord += to_string(UserData.Permissions) + Seperator; ;


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

vector <stUser> LoadUsersDataFromFile(string FileName)
{

    vector <stUser> vUser;
    fstream UserDataFile;
    UserDataFile.open(FileName, ios::in);

    if (UserDataFile.is_open())
    {
        string Line;
        stUser User;

        while (getline(UserDataFile >> ws, Line))
        {
            User = ConvertUserLineToRecord(Line);
            vUser.push_back(User);
        }
        UserDataFile.close();

    }
    return vUser;
}

void PrintClientRecord(sClient ClientData)
{

    cout << "| " << left << setw(15) << ClientData.AccountNumber;
    cout << "| " << left << setw(10) << ClientData.PinCode;
    cout << "| " << left << setw(40) << ClientData.Name;
    cout << "| " << left << setw(12) << ClientData.Phone;
    cout << "| " << left << setw(12) << ClientData.AccountBalance;
}

void PrintUserRecord(stUser UserData)
{

    cout << "| " << left << setw(15) << UserData.Username;
    cout << "| " << left << setw(10) << UserData.Password;
    cout << "| " << left << setw(10) << UserData.Permissions;
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

void PrintAllUsersData(vector<stUser> vUser)
{

    system("cls");
    cout << "\n\t\t\t\t\tClient List (" << vUser.size() << ") User(s).";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;
    cout << "| " << left << setw(15) << "User Name";
    cout << "| " << left << setw(10) << "Password";
    cout << "| " << left << setw(40) << "Permissions";
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;

    for (stUser User : vUser)
    {
        PrintUserRecord(User);
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

void PrintUserCard(stUser User)
{
    cout << "\nThe follwoing are the User details:\n";
    cout << "-------------------------------------";
   cout <<"\nUsername    :" << User.Username << endl;
    cout << "Password    :" << User.Password << endl;
    cout << "Permissions :" << User.Permissions << endl;
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

bool FindUserByUsername(string Username, stUser& User)
{
    vector <stUser> vUser = LoadUsersDataFromFile(UsersFileName);

    for (stUser& U : vUser)
    {
        if (U.Username == Username)
        {
            User = U;
            return true;
        }
    }

    return false;

}

bool FindUserByUsernameAndPassword(string Username, string Password, stUser& User)
{
    vector <stUser> vUser = LoadUsersDataFromFile(UsersFileName);

    for (stUser& U : vUser)
    {
       if (U.Password == Password && U.Username == Username)
        {
            User = U;
            return true;
        }
    }

    return false;

}

bool LoadUserInfo(string Username, string Password)
{
    if (FindUserByUsernameAndPassword(Username, Password, CurrentUser))
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

bool MarkClientForDeleteByAccountNumber(string AccountNumber, vector <sClient>& vClient)
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

bool MarkUserForDeleteByUsername(string Username, vector <stUser>& vUsers)
{
    for (stUser& U : vUsers)
    {
        if (U.Username == Username)
        {
            U.MarkForDelete = true;
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

vector <stUser> SaveUsersDataToFile(vector <stUser> vUsers, string FileName)
{

    fstream UserDataFile;
    UserDataFile.open(FileName, ios::out);

    string DataLine;

    if (UserDataFile.is_open())
    {
        for (stUser& U : vUsers)
        {
            if (U.MarkForDelete == false)
            {
                DataLine = ConvertUserRecordToLine(U);
                UserDataFile << DataLine << endl;
            }
        }
        UserDataFile.close();

    }
    return vUsers;
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

                MarkClientForDeleteByAccountNumber(AccountNumber, vClients);
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

bool DelteUserByUsername(string Username, vector <stUser>& vUsers, stUser User)
{
    char Check;
    stUser DeleteUser;


    if (Username == "Admin" || Username == User.Username)
    {
        cout << "\nYou can Not Delete This User!";

      }
    else if (FindUserByUsername(Username, DeleteUser))
    {

        PrintUserCard(DeleteUser);

        cout << "\nAre you Sure you want delete this user? y/n ? ";
        cin >> Check;

        while (tolower(Check) != 'y' && tolower(Check) != 'n')
        {
            cout << "The value is unavailable Try again" << endl;
            cout << "Are you Sure you want delete this user? y/n ? ";
            cin >> Check;
        }
        while (tolower(Check) == 'y' || tolower(Check) == 'n')
        {
            if (tolower(Check) == 'y')
            {


                MarkUserForDeleteByUsername(Username, vUsers);
                SaveUsersDataToFile(vUsers, UsersFileName);

                vUsers = LoadUsersDataFromFile(UsersFileName);

                cout << "\n\n User Deleted Successfully" << endl;
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
        cout << "\nUser with Username (" << Username << ") Is Not Found!";
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

bool UpdateUserByUsername(string Username, vector <stUser>& vUsers)
{
    char Check;
    stUser User;


    if (FindUserByUsername(Username, User))
    {
        PrintUserCard(User);

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

                for (stUser& U : vUsers)
                {
                    if (U.Username == Username)
                    {
                        U = ChangeUserRecord(Username);
                        break;
                    }
                }
                SaveUsersDataToFile(vUsers, UsersFileName);


                cout << "\n\n User Updated Successfully." << endl;
                return true;

            }
            break;
        }

    }
    else
    {
        cout << "\nUser with Username (" << Username << ") Is Not Found!";
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
            AddDataLineToFile(ClientsFileName, ConvertClientRecordToLine(Client));
            break;
        }
        else
        {
            cout << "\nClient with Account Number (" << AccountNumber << ") already exists, Enter another AccountNumber? ";
            getline(cin >> ws, AccountNumber);
        }
    } while (IsFound);
}

void AddNewUser()
{
    stUser User;
    bool IsFound = true;
    cout << "\nEnter Username? ";
    getline(cin >> ws, User.Username);

    string Username = User.Username;

    do {
        if (!FindUserByUsername(Username, User))
        {
            IsFound = false;
            User = ReadNewUser(Username);
            AddDataLineToFile(UsersFileName, ConvertUserRecordToLine(User));
            break;
        }
        else
        {
            cout << "\nUser with Account Number (" << Username << ") already exists, Enter another username? ";
            getline(cin >> ws, Username);
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

void AddUsers()
{
    char AddMore = 'Y';
    do
    {

        cout << "Adding New User:\n";
        AddNewUser();
        cout << "\nUser Added Successfully, do you want to add more Users ? Y / N ? ";
        cin >> AddMore;


    } while (toupper(AddMore) == 'Y');
}

enMainMenueOptions ReadNumberOfMainMenuOptions()
{

    int Number;

    cout << "choose what do you want to do? [1 to 8]? ";
    cin >> Number;

    while (Number <= 0 || Number > 8)
    {
        cout << "The Value is Unavailable\n";
        cout << "choose what do you want to do? [1 to 8]? ";
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

                    } while (C.AccountBalance != C.AccountBalance - WithDraw);
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
    cout << "\t[7] Manage Users.\n";
    cout << "\t[8] Logout.\n";
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

    for (sClient& Client : vClient)
    {
        TotalBalances += Client.AccountBalance;
        PrintClientBalance(Client);
        cout << endl;
    }
    cout << "\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ";
    cout << "ــــــــــــــــــــــــــــــــــــ\n" << endl;
    cout << "\n\t\t\t\t\tTotal Balances = " << TotalBalances << endl;


}

void GoBackToTransactionsScreen( )
{

    cout << "\nPress any key to go back to Transacrions Menue...";
    system("pause>0");
    ShowTransactionsScreen();

}

void PerfromTransactionsMenueOption(stUser User)
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

void ShowAccessDeniedMessage()
{
    
        system("cls");
        cout << "\n------------------------------------------------------";
        cout << "\nAccess Denied,";
        cout << "\nYou do not have Permission To Do This,";
        cout << "\nPlease Connect your Admin.";
        cout << "\n------------------------------------------------------";
    
}

bool CheckAccessPermission(enMainMenuePermissions Permission)
{
    
    if ((Permission & CurrentUser.Permissions) == Permission || CurrentUser.Permissions == enMainMenuePermissions::eAll)
    {
        return true;
    }
    return false;

 }

void ShowAllClientsScreen()
{
    if (!CheckAccessPermission(enMainMenuePermissions::pListClients))
    {
        ShowAccessDeniedMessage();
        return;
    }
 
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    PrintAllClientsData(vClient);
}

void ShowAddNewClientsScreen()
{
    if (!CheckAccessPermission(enMainMenuePermissions::pAddNewClient))
    {
        ShowAccessDeniedMessage();
        return;
    }
    cout << "\n-----------------------------------\n";
    cout << "\tAdd New Clients Screen";
    cout << "\n-----------------------------------\n";
    AddClients();
}

void ShowAddNewUserScreen()
{
    cout << "\n-----------------------------------\n";
    cout << "\tAdd New User Screen";
    cout << "\n-----------------------------------\n";
    AddUsers();
}

void ShowDeleteClientScreen()
{
    if (!CheckAccessPermission(enMainMenuePermissions::pDeleteClient))
    {
        ShowAccessDeniedMessage();
        return;
    }
    cout << "\n-----------------------------------\n";
    cout << "\tDelete Clients Screen";
    cout << "\n-----------------------------------\n";

    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    string AccountNumber = ReadClientAccountNumber();
    DelteClientByAccountNumber(AccountNumber, vClients);
}

void ShowUpdateClientScreen()
{
    if (!CheckAccessPermission(enMainMenuePermissions::pUpdateClient))
    {
        ShowAccessDeniedMessage();
        return;
    }
    cout << "\n---------------------------------------------\n";
    cout << "\tUpdate Clients Info Screen";
    cout << "\n---------------------------------------------\n";

    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    string AccountNumber = ReadClientAccountNumber();
    UpdateClientByAccountNumber(AccountNumber, vClients);
}

void ShowUpdateUserScreen()
{
    cout << "\n---------------------------------------------\n";
    cout << "\tUpdate Users Info Screen";
    cout << "\n---------------------------------------------\n";

    vector <stUser> vUsers = LoadUsersDataFromFile(UsersFileName);
    string Username = ReadUsername();
    UpdateUserByUsername(Username, vUsers);
}

void ShowFindClientScreen()
{
    if (!CheckAccessPermission(enMainMenuePermissions::pFindClient))
    {
        ShowAccessDeniedMessage();
        return;
    }
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

void ShowFindUserScreen()
{
    stUser User;
    cout << "\n------------------------------------\n";
    cout << "\Find Client Screen";
    cout << "\n------------------------------------\n";
    if (FindUserByUsername(ReadUsername(), User))
    {
        PrintUserCard(User);

    }
    else
        cout << "\nUser with Username (" << User.Username << ") Is Not Found!";

}

void ShowTransactionsScreen( )
{
    if (!CheckAccessPermission(enMainMenuePermissions::pTransactions))
    {
        ShowAccessDeniedMessage();
        return;
    }
    system("cls");
    PrintTransactionsMenue();
    PerfromTransactionsMenueOption(CurrentUser);
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

void PrintManageUsersMenue()
{
    cout << "=======================================================\n";
    cout << "\t\tManage Users Menue Screen\n";
    cout << "=======================================================\n";
    cout << "\t[1] List Users.\n";
    cout << "\t[2] Add New User.\n";
    cout << "\t[3] Delete User.\n";
    cout << "\t[4] Update User.\n";
    cout << "\t[5] Find User.\n";
    cout << "\t[6] Main Menue.\n";
    cout << "=======================================================\n";


}

void ShowListUsers()
{
    vector <stUser> vUser = LoadUsersDataFromFile(UsersFileName);
    PrintAllUsersData(vUser);

}

void ShowDeleteUserScreen(stUser User)
{
    cout << "\n-----------------------------------\n";
    cout << "\tDelete Users Screen";
    cout << "\n-----------------------------------\n";

    vector <stUser> vUsers = LoadUsersDataFromFile(UsersFileName);

    string Username = ReadUsername();
    DelteUserByUsername(Username, vUsers, User);

 }

void PerfromManageUsersMenueOption(stUser User)
{
    enManageUsersMenueOptions ManageUsersMenueOptions = ReadNumberOfManageUsersMenueOptions();
    switch (ManageUsersMenueOptions)
    {
    case eListUsres:
        system("cls");
        ShowListUsers();
        GoBackToManageUsersScreen();
        break;

    case eAddNewUsre:
        system("cls");
        ShowAddNewUserScreen();
        GoBackToManageUsersScreen();
        break;

    case eDeleteUser:
       
        system("cls");
        ShowDeleteUserScreen(User);
        GoBackToManageUsersScreen();
        break;

    case eUpdateUser:  
        system("cls");
        ShowUpdateUserScreen();
        GoBackToManageUsersScreen();
        break;

    case eFindUser:
        system("cls");
        ShowFindUserScreen();
        GoBackToManageUsersScreen();
        break;

    case eShowMainMenueWhenInManageUsers:ShowMainMenuScreen();
        break;
   
    }
}

void ShowManageUsersScreen(stUser User)
{
    if (!CheckAccessPermission(enMainMenuePermissions::pTransactions))
    {
        ShowAccessDeniedMessage();
        return;
    }
    system("cls");
    PrintManageUsersMenue();
    PerfromManageUsersMenueOption( User);
}

void GoBackToManageUsersScreen()
{
    cout << "\nPress any key to go back to Manage Users Menue...";
    system("pause>0");
    ShowManageUsersScreen( CurrentUser);
}

void PerfromMainMenueOption(stUser User)
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

    case eManageUsers:
            
        system("cls");
        ShowManageUsersScreen(User);
        GoBackToMainScreen();
            break;

    case eLogout:

        system("cls");
        GotoLoginScreen();
        break;
    }

}

void ShowMainMenuScreen()
{
    system("cls");
    PrintMainMenue();
   PerfromMainMenueOption(CurrentUser);
}

void PrintLoginView()
{
    cout << "\n-------------------------------------";
    cout << "\n             Login Screen           ";
    cout << "\n-------------------------------------";
}

void Login()
{
 
    stUser User;
    string Username = "", Password = "";
   bool LoginFaild = false;



    do
    {
        system("cls");
        PrintLoginView();
         if (LoginFaild )
        {
            cout << "\nInvalid Username/Password!";
        }
           
        Username = ReadUsername();        
        Password = ReadUserPassword();
        LoginFaild = !LoadUserInfo(Username, Password);
            
       
     
    } while (LoginFaild);

    ShowMainMenuScreen();



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







