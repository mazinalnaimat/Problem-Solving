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

sClient ReadNewClient()
{
    sClient Cleint;

    cout << "\nEnter Account Number? ";
    getline(cin >> ws, Cleint.AccountNumber);

    cout << "Enter Pin Code? ";
    getline(cin, Cleint.PinCode);

    cout << "Enter Name? ";
    getline(cin, Cleint.Name);

    cout << "Enter Phone? ";
    getline(cin, Cleint.Phone);

    cout << "Enter Account Balance? ";
    cin >> Cleint.AccountBalance;

    return Cleint;
}

string ConvertRecordToLine(sClient ClientData, string Seperator = "#//#")
{
    string sClientRecord;


    sClientRecord += ClientData.AccountNumber + Seperator; ;
    sClientRecord += (ClientData.PinCode) + Seperator; ;
    sClientRecord += ClientData.Name + Seperator; ;
    sClientRecord += ClientData.Phone + Seperator;
    sClientRecord += to_string(ClientData.AccountBalance);

    return sClientRecord;
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
    Client = ReadNewClient();
    AddDataLineToFile(ClientsFileName,ConvertRecordToLine(Client));
}

void AddClients()
{
    char AddMore = 'Y';
    do
    {
        system("cls");
        cout << "Adding New Client:\n\n";
        AddNewClient();
        cout << "\nClient Added Successfully, do you want to add more clients ? Y / N ? ";
            cin >> AddMore;
    } while (toupper(AddMore) == 'Y');
}


int main()
{
    AddClients();
    system("pause>0");
    return 0;
}





