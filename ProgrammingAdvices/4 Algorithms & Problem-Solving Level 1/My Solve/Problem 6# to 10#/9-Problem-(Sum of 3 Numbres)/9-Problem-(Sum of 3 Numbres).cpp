

#include <iostream>

using namespace std;


int ReadPosistveNumber()
{
    int Number = 0;
    do
    {
        cout << "Enter Your Number just 3 digits: " << endl;
        cin >> Number;
    } while (Number <= 100 || Number>=1000);
    return Number;
}
int SumOfNumbers(int Number)
{
    int Sum = 0;
    int divide = 0;
    while (Number > 0)
    {
        divide = Number % 10;
        Number = Number / 10;
        Sum = Sum + divide;

    }   return Sum;
}

void PrintTheSumOfNumbers(int Sum)

{
    cout << "\n The sum  of numbers = "<< Sum << endl;
}


int main()
{
    PrintTheSumOfNumbers(SumOfNumbers(ReadPosistveNumber()));



    return 0;
    }

