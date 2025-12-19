

#include <iostream>
#include<string>
using namespace std;

enum enCheckNumber {Yes = 1, No =2};

float ReadNumbers(string Message)
{
    float Number = 0;
    cout << Message << endl;
    cin >> Number;


    return Number;
}

enCheckNumber CheckMinus99(float Number)
{
    if (Number == -99)
        return   enCheckNumber::Yes;
    else
        return   enCheckNumber::No;
}

float SumTheNumberWithoutMinus99()
{
    float Sum = 0, Number = 0;
    int Counter = 1;
    do
    {
        Number = ReadNumbers("Enter The Number " + to_string(Counter));
        if (CheckMinus99(Number) == enCheckNumber::Yes)
            break;
        Sum += Number;
        Counter++;
    } while(Number != -99);
    return Sum;
}


int main()
{
    cout << "\nThe sum of Numbers : " << SumTheNumberWithoutMinus99();
}

