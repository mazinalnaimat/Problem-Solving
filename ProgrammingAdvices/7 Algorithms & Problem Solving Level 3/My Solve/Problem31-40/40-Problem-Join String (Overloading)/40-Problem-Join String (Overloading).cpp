

#include <iostream>
#include<string>
#include<vector>
using namespace std;


vector <string> ReadWords()
{
    string Word;
    string Check;
    vector <string> vWord;

    cout << "Please Enter The Word?" << endl;
    do
    {
        cin >> Word;
        vWord.push_back(Word);
        cout << "Do You need Add More?Y:Yes, N:No ";
        cin >> Check;
        if (Check == "N" || Check == "n")
            break;
    } while (Check == "Y" || Check == "y");

    return vWord;

}


string JoinString(vector <string>ReadWords, string Delim)
{
    string S1;

    for (string& Word : ReadWords)
    {
        S1 += Word + Delim;
    }

    return  S1.substr(0, S1.length() - Delim.length());
}

string JoinString(string arrWords[100], short Length, string Delim)
{
    string S1;

    for (int i = 0 ; i < Length ; i++)
    {
        S1 += arrWords[i] + Delim;
    }

    return  S1.substr(0, S1.length() - Delim.length());
}

int main()
{
    string S1 = JoinString(ReadWords(), "***");
    cout << endl << "Vector after join:\n" << S1;

    string arr1[4] = { "Mohammad","Fadi","Ali","Maher" };
      string S2 = JoinString(arr1, 4, "***");
    cout << endl << "\nArray after join:\n" <<S2;

    system("pause>0");
}

