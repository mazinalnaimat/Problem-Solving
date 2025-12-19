#include <iostream>
using namespace std;

float GetFractionPart(float Number)
{
    return Number - (int)Number;
}

float MyRound(float Number)
{

    int IntPart;
    IntPart = int(Number);
   
    float Fractiospart = GetFractionPart(Number);

    if (abs(Fractiospart) >= 0.5)
    {
        if (Number > 0)
        {
            return ++IntPart;
        }
        else
        {
            return --IntPart;
        }
    }
    else
        return IntPart;
}

float ReadNumber()
{
    cout << "Please Enter the Numner: ";
    float Number = 0;
    cin >> Number;
    return Number;
}

int main()
{
     
     float Number = ReadNumber();
     float Num = Number;
    cout << "My round Result : " << MyRound(Number) << endl;
    cout << "C++ round Result: " << round(Num) << endl;
   

  
}

