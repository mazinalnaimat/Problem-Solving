

#include <iostream>
#include<string>
#include<vector>

using namespace std;

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

string UpperAllString(string S1)
{
    for (short i = 0; i < S1.length(); i++)
    {
        S1[i] = toupper(S1[i]);
    }
    return S1;
}

string JoinString(vector <string> vString, string Delim)
{
    string S1;

    for (string word : vString)
    {
        S1 += word + Delim;
    }
    return S1.substr(0, S1.length() - Delim.length());
}

string ReplaceWordInStringUsingSplit(string S1, string OldWord, string NewWord, bool MatchCase = true)
{
  

    vector <string> vString = SplitString(S1, " ");

    vector <string> ::iterator iter;

   
        for (iter = vString.begin(); iter != vString.end(); iter++)
        {
            if (MatchCase)
            {
                if (*iter == OldWord)
                    *iter = NewWord;
           
            }
            else
            {
                if (UpperAllString(*iter) == UpperAllString(OldWord))
                {
                    *iter = NewWord;
                }
            }
        
  
    }
    return JoinString(vString, " ");

}



int main()
{
    string S1 = "Welcome to Jordan , Jordan is a nice country";

    cout << "\nOrginal String" << endl;
    cout << S1;

    cout << "\n\nRepalce With Match Case" << endl;
    cout << ReplaceWordInStringUsingSplit(S1, "jordan", "USA");

    cout << "\n\nRepalce Without Match Case" << endl;
    cout << ReplaceWordInStringUsingSplit(S1, "jordan", "USA", false);


    system("pause>0");

}

