#include <iostream>

using namespace std;


int ReadPositvieNumber(string Message)
{
    int Number = 0;
    do
    {
    cout << Message << endl;
    cin >> Number;
    }while (Number <= 0);
    return Number;
}

int ReverseDigits(int Number)
{
    
    int Remainder = 0;
    int Number2 = 0;

    while (Number > 0)
    {
        Remainder = Number % 10;
        Number = Number / 10;
        Number2 = Number2 * 10 + Remainder;
    
    }
    return Number2;
}

void PrintResult(int Remainder)
{
    cout << "\nReverse is:\n" << Remainder << "\n";
}

int main()
{
    PrintResult(ReverseDigits(ReadPositvieNumber("Please Enter The Positive Number?")));

    return 0;
}

