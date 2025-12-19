#include <iostream>
using namespace std;

float MyABS(float Number)
{
    if (Number > 0)
           return Number;
       else
           return Number * -1;
}

float ReadNumber()
{
    cout << "Please Enter the Numner: ";
    int Number = 0;
    cin >> Number;
    return Number;
}

int main()
{
 
    float Number = ReadNumber();
    cout << "My abs Result : " << MyABS(Number) << endl;
    cout << "C++ abs Result: " << abs(Number) << endl;
}

