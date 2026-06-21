

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


void PrintClientRecord(sClient ClientData)
{

    cout << "| " << left << setw(15) << ClientData.AccountNumber;
    cout << "| " << left << setw(10) << ClientData.Phone;
    cout << "| " << left << setw(40) << ClientData.Name;
    cout << "| " << left << setw(12) << ClientData.Phone;
    cout << "| " << left << setw(12) << ClientData.AccountBalance;
}
  

void PrintAllClientsData(vector<sClient> vClient)
{
   
    system("cls");
    cout << "\n\t\t\t\t\tClient List (" << vClient.size() << ") Client(s).";
    cout << "\n-------------------------------------------------------------";
    cout << "------------------------------------\n" << endl;
    cout << "| " << left << setw(15) << "Account Number";
    cout << "| " << left << setw(10) << "Pin Code";
    cout << "| " << left << setw(40) << "Client Name";
    cout << "| " << left << setw(12) << "Phone";
    cout << "| " << left << setw(12) << "Balance";
    cout << "\n-------------------------------------------------------------";
    cout << "------------------------------------\n" << endl;

    for (sClient Cleint : vClient)
    {
        PrintClientRecord(Cleint);
        cout << endl;
    }
    cout << "\n-------------------------------------------------------------";
    cout << "------------------------------------\n" << endl;

}

int main()
{
    vector <sClient> vClient = LoadClientsDataFromFile(ClientsFileName);
    PrintAllClientsData(vClient);


    system("pause>0");
    return 0;
}







