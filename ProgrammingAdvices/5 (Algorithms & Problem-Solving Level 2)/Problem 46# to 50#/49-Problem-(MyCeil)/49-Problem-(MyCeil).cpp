#include <iostream>
using namespace std;

float GetFractionPart(float Number)
{
    return Number - (int)Number;
}


float MyCeil(float Number)
{

    int IntPart;
    IntPart = int(Number);
    if (GetFractionPart(Number) > 0)
        return ++IntPart;
    else
        return IntPart;

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
    cout << "My ceil Result : " << MyCeil(Number) << endl;
    cout << "C++ ceil Result: " << ceil(Number) << endl;



}

