
#include <iostream>

using namespace std;


void PrintFibonacciUsingLoop( short Number )
{
    int  FibNum = 0;
    int Prev2 = 0, Prev1 = 1;
    cout << "1\t";

    for (int i = 2; i <= Number; i++)
    {
    
        FibNum = Prev1 + Prev2;
        cout << FibNum << "\t";
        Prev2 = Prev1;
        Prev1 = FibNum;
    }

}




int main()
{
    PrintFibonacciUsingLoop(15);
    system("pause>0");



}