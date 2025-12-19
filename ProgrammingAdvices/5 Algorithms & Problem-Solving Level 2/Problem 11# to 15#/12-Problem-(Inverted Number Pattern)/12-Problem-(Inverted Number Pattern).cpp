#include <iostream>
using namespace std;

int ReadPositiveNumber(string Message)
{
    int Number = 0;
    do
    {
        cout << Message << endl;
        cin >> Number;
    } while (Number <= 0);
    return Number;
}

void PrintInvertedNumberPattern(int Number)
{
    cout << endl;
    for (Number; Number > 0; Number--)
    {
        for (int i = Number; i > 0; i--)
        {
            cout << Number;
        }
       cout <<  endl;
     }
}

int main()
{
    PrintInvertedNumberPattern(ReadPositiveNumber("Pleas Enter The Positive Number?"));

    return 0;
}
