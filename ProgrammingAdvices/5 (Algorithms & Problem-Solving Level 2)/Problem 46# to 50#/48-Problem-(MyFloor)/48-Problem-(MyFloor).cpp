#include <iostream>
using namespace std;

float GetFraction(float Number)
{
    return Number - (int)Number;
}


float MyFloor(float Number)
{

    int IntPart;
    IntPart = int(Number);
    if (GetFraction(Number) >= 0)
        return IntPart;
    else
        return --IntPart;

}

float ReadNumber()
{
    cout << "Please Enter the Number: ";
    float Number = 0;
    cin >> Number;
    return Number;
}

int main()
{

    float Number = ReadNumber();
    cout << "My floor Result : " << MyFloor(Number) << endl;
    cout << "C++ floor Result: " << floor(Number) << endl;



}

