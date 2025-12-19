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

int ReverseNumber(int Number)
{
    int Remainder = 0, ReverseNumber=0;

    while (Number > 0)
    {
        Remainder = Number % 10;
        Number = Number / 10;
        ReverseNumber = ReverseNumber * 10 + Remainder;
    }
    return ReverseNumber;
}

bool IsPalindromeNumber(int Number)
{
    return ReverseNumber(Number) == Number;
    
}

int main()
{
    
    int Number = ReadPositiveNumber("Please Enter The Positive Number?");

  
   if  (IsPalindromeNumber(Number))
      cout << "\nYes ,it is a Palindrome Number." << endl;
  else
      cout <<"\nNo ,it is Not a Palindrome Number." <<endl;


    return 0;
}

