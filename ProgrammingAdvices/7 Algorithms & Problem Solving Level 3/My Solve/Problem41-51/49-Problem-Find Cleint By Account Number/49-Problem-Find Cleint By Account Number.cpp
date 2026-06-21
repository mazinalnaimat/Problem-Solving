

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

sClient ConvertLineToRecord(string NewLine, string Seperator = "#//#")
{
    vector <string> vNewClient = SplitString(NewLine, Seperator);
    sClient ClientData;

    for (int i = 0; i < vNewClient.size(); i++)
    {
        ClientData.AccountNumber = vNewClient[0];
        ClientData.PinCode = vNewClient[1];
        ClientData.Name = vNewClient[2];
        ClientData.Phone = vNewClient[3];
        (ClientData.AccountBalance) = stod(vNewClient[4]);
    }

    return ClientData;
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

        while (getline(ClientDataFile, Line))
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

    cout << "\nAccount Number:" << Client.AccountNumber << endl;
    cout << "pincode        :" << Client.PinCode << endl;
    cout << "Name           :" << Client.Name << endl;
    cout << "Phone          :" << Client.Phone << endl;
    cout << "Account Balance:" << Client.AccountBalance << endl;

}

bool FindClientByAccountNumber(string AcouuntNumber , sClient & Client)
{
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);

    for (sClient C : vClient)
    {
        if (C.AccountNumber == AcouuntNumber)
        {
            Client = C;
            return true;
        }
    }
   
    return false;
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
    sClient Client;
    string AccountNumber = ReadClientAccountNumber();


    if (FindClientByAccountNumber(AccountNumber, Client))
    {
        PrintCleintCard(Client);
    }
    else
        cout << "\nClient with Accounr Number (" << AccountNumber << ") Is Not Found!";

    system("pause>0");
    return 0;
}







