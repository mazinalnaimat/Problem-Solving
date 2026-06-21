

#include <iostream>
#include<string>
#include<vector>
#include<fstream>
#include<iomanip>

using namespace std;
const string ClientsFileName = "Clients.txt";

struct sClient
{
    string AccountNumber;
    string PinCode;
    string Name;
    string Phone;
    double AccountBalance;
    bool MarkForDelete = false;

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

        while (getline(ClientDataFile >>ws, Line))
        {
            Client = ConvertLineToRecord(Line);
            vClients.push_back(Client);
        }
        ClientDataFile.close();

    }
    return vClients;
}

void PrintCleintCard(sClient Client)
{
    cout << "\nThe follwoing are the client details:\n";

    cout <<"\nAccount Number :" << Client.AccountNumber << endl;
    cout << "pincode        :" << Client.PinCode << endl;
    cout << "Name           :" << Client.Name << endl;
    cout << "Phone          :" << Client.Phone << endl;
    cout << "Account Balance:" << Client.AccountBalance << endl;

}

bool FindClientByAccountNumber(string AccountNumber, vector <sClient> vClient,sClient & Client)
{

    for (sClient C : vClient)
    {
        if (C.AccountNumber == AccountNumber)
        {
            Client = C;
            return true;
        }
    }

    return false;
}

bool MarkCkientForDeleteByAccountNumber(string AccountNumber , vector <sClient> & vClient)
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

vector <sClient> SaveClientsDataToFile(vector <sClient>vClient , string FileName)
{
 
    fstream ClientDataFile;
    ClientDataFile.open(FileName, ios::out);

    string DataLine;

    if (ClientDataFile.is_open())
    {
        for (sClient & C : vClient)
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

bool DelteClientByAccountNumber(string AccountNumber , vector <sClient> & vClients)
{
    char Check;
    sClient Client;


    if (FindClientByAccountNumber(AccountNumber, vClients , Client))
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
            else
            {
                cout << "\n\n Client is Not Deleted Successfully" << endl;
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



int main()
{
    vector <sClient> vClients = LoadClientsDataFromFile(ClientsFileName);
    string AccountNumber = ReadClientAccountNumber();

    DelteClientByAccountNumber(AccountNumber, vClients);

    system("pause>0");
    return 0;
}







