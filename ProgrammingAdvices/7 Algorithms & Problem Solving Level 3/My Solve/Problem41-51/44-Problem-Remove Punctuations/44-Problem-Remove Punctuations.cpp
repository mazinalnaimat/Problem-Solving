
#include <iostream>
#include<string>
#include<vector>


using namespace std;

string RemovePunctuation(string S1)
{
    string S2 = "";

    for (short i = 0; i < S1.length(); i++)
    {
     
        if(!ispunct(S1[i]))
        {
              S2+=S1[i];
            
        }
    }
    return S1;
}

int main()
{
    string S1 = "Welcome to Jordan, Jordan is a nice country; it's amazing.";

    cout << "Orginial String:\n";
    cout << S1;

    cout << "\n\nPunctuations Removed:\n";
    cout << RemovePunctuation(S1);
    



    system("pause>0");
}

