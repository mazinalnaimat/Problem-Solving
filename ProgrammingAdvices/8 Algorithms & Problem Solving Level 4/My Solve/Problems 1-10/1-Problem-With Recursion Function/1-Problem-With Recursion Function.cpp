
#include <iostream>
using namespace std;

int ReadNumber()
{
    int Number; 

    cout << "Please Enter The Number? ";
    cin >> Number;
    return Number;

}

string NumberToText(int Number)
{
    string NumberString;

     if ( Number < 20)
    {
        string arr[] = {"", "One " , "Tow ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine ", "Ten " , "Eleven " , "Twelve ",
            "Thirteen ", "Fourteen ", "Felse ifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen " };
        NumberString += arr[Number ];

    }

     else if (Number < 100)
    {
        string arr[] ={"Townty ", "Thirty ", "Fourty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety " };
        int Remainder = Number;
        Number = Number / 10;
        NumberString += arr[Number - 2];
        Number = Remainder - Number * 10;
        NumberString +=  NumberToText(Number);
    }

    else if (Number < 1000)
    {
         int Remainder = Number;
         Number = Number / 100;
         NumberString += NumberToText(Number);
         Number = Number * 100;
         if(Number < 200)
        NumberString += "Hundred ";
        else
        NumberString += "Hundreds ";
         Number = Remainder - Number;
         NumberString += NumberToText(Number);
    }

    else  if (Number < 1000000)
    {  
       int Remainder = Number;
       Number = Number / 1000;
       NumberString += NumberToText(Number);
       Number = Number * 1000;
       if (Number < 2000)
           NumberString += "Thousand ";
       else
           NumberString += "Thousands ";
       Number = Remainder - Number;
       NumberString += NumberToText(Number);
    }

    else if (Number < 1000000000)
    {

        int Remainder = Number;
        Number = Number / 1000000;
        NumberString += NumberToText(Number);
        Number = Number * 1000000;
        if (Number < 2000000)
            NumberString += "Million ";
        else
            NumberString += "Millions ";
        Number = Remainder - Number;
        NumberString += NumberToText(Number);
    }

    else if (Number < 10000000000)
    {
         int Remainder = Number;
         Number = Number / 1000000000;
         NumberString += NumberToText(Number);
         Number = Number * 1000000000;
         if (Number < 2000000000)
             NumberString += "Billion ";
         else
             NumberString += "Billions ";
         Number = Remainder - Number;
         NumberString += NumberToText(Number);

    }

     return NumberString;
}

int main()
{

    int Number = ReadNumber();

    cout << NumberToText(Number);

   system("pause>0");
   return 0;
}

