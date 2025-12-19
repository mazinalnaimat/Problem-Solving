
#include <iostream>
using namespace std;

int ReadNumber()
{
    int Number = 0;
    cout << "Please Enter your number :" << endl;
    cin >> Number;
    return Number;
}
float CalculateHalfNum(int Number)
{
    float HalfNumber;
    HalfNumber = (float)Number / 2;
    return HalfNumber;
}
void PrintHalfNumber(float HalfNumber)
{
    cout << "The Half Of Number is:"<< HalfNumber << endl;

}


int main()
{
    

    PrintHalfNumber(CalculateHalfNum(ReadNumber()));






    return 0;

}
