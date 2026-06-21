


#include <iostream>
#include <vector>

using namespace std;


enum enNumber1To9 { One = 1, Tow = 2, Three = 3, Four = 4, Five = 5, Six = 6, Seven = 7, Eight = 8, Nine = 9 };
enum enNumber10To19 { Ten = 10, Eleven = 11, Twelve = 12, Thirteen = 13, Fourteen = 14, Fifteen = 15, Sixteen = 16, Seventeen = 17, Eighteen = 18, Nineteen = 19 };
enum enNumber20To90 { Townty = 20, Thirty = 30, Fourty = 40, Fifty = 50, Sixty = 60, Seventy = 70, Eighty = 80, Ninety = 90 };

int ReadNumber()
{
    int Number;
    cout << "Enter a Number? ";
    cin >> Number;
    return Number;
}

vector <int> Numbers(int Number)
{
    vector <int> vNumbers;

    int Remainder;
    for (int i = 0; Number > 0; i++)
    {
        Remainder = Number % 100;
        
        

        
            vNumbers.push_back(Remainder * pow(10, i) );
            
        
        Number = Number / 100;
    }
    return vNumbers;
}

string ConvertNumberToString(vector <int> vNumbers)
{
    string NumberString = "";

    vector <int> ::iterator Number = vNumbers.end();

    while (Number != vNumbers.begin())
    {
        --Number;
 

        if (*Number < 10)
        {
            switch ((enNumber1To9)*Number)
            {

            case One:
                NumberString += "One ";

                break;
            case Tow:NumberString += "Tow ";
         
                break;
            case Three:NumberString += "Three ";
      
                break;

            case Four:NumberString += "Four ";
    
                break;
            case Five:NumberString += "Five ";
 
                break;
            case Six:NumberString += "Six ";

                break;
            case Seven:NumberString += "Seven ";
          
                break;
            case Eight:NumberString += "Eight ";
               
                break;
            case Nine:NumberString += "Nine ";
             
                break;
            }

        }

        else if (*Number < 20)
        {

            switch ((enNumber10To19)*Number)
            {
                
            case Ten:
                if(vNumbers[0] ==0)
                NumberString += "Ten ";              
                break;
            case Eleven:NumberString += "Eleven ";
                break;
            case Twelve:NumberString += "Twelve ";

                break;
            case Thirteen:NumberString += "Thirteen ";

                break;
            case Fourteen:NumberString += "Fourteen ";

                break;
            case Fifteen:NumberString += "Fifteen ";

                break;
            case Sixteen:NumberString += "Sixteen ";

                break;
            case Seventeen:NumberString += "Seventeen ";

                break;
            case Eighteen:NumberString += "Eighteen ";

                break;
            case Nineteen:NumberString += "Nineteen ";

                break;

            }

        }

        else if (*Number < 100)
        {
           switch ((enNumber20To90)*Number)
            {

            case Townty:NumberString += "Townty ";
              
                break;
            case Thirty:NumberString += "Thirty ";
                
                break;
            case Fourty:NumberString += "Fourty ";
               
                break;
            case Fifty:NumberString += "Fifty ";

                break;
            case Sixty:NumberString += "Sixty ";
               
                break;
            case Seventy:NumberString += "Seventy ";
              
                break;
            case Eighty:NumberString += "Eighty ";
             
                break;
            case Ninety:NumberString += "Ninety ";
               
                break;
           
            }
        }

        else if (*Number < 1000)
        {
        int TempNumber = *Number / 100;


          if (TempNumber < 10)
            {
                switch ((enNumber1To9)TempNumber)
                {

                case One:
                    NumberString += "One ";

                    break;
                case Tow:NumberString += "Tow ";

                    break;
                case Three:NumberString += "Three ";

                    break;

                case Four:NumberString += "Four ";

                    break;
                case Five:NumberString += "Five ";

                    break;
                case Six:NumberString += "Six ";

                    break;
                case Seven:NumberString += "Seven ";

                    break;
                case Eight:NumberString += "Eight ";

                    break;
                case Nine:NumberString += "Nine ";

                    break;
                }

            }

          if (*Number == 1)
          {
              NumberString += "Hundred ";
          }
            else
            {
                NumberString += "Hundreds ";
               
            }
        }

        else if (*Number < 10000)
        {
        int TempNumber = *Number / 1000;
           
        if (TempNumber < 10)
            {
                switch ((enNumber1To9)TempNumber)
                {

                case One:
                    NumberString += "One ";
                    break;
                case Tow:NumberString += "Tow ";

                    break;
                case Three:NumberString += "Three ";

                    break;

                case Four:NumberString += "Four ";

                    break;
                case Five:NumberString += "Five ";

                    break;
                case Six:NumberString += "Six ";

                    break;
                case Seven:NumberString += "Seven ";

                    break;
                case Eight:NumberString += "Eight ";

                    break;
                case Nine:NumberString += "Nine ";

                    break;
                }

            }

            if (TempNumber == 1)
                NumberString += "Thousand ";
            else
                NumberString += "Thousands ";

            }

        else if (*Number < 20000)
        {
            int TempNumber = *Number / 1000;
             if (*Number < 20)
            {

                switch ((enNumber10To19)*Number)
                {
                case Ten:NumberString += "Ten ";
                    break;
                case Eleven:NumberString += "Eleven ";
                    break;
                case Twelve:NumberString += "Twelve ";
                    break;
                case Thirteen:NumberString += "Thirteen ";
                    break;
                case Fourteen:NumberString += "Fourteen ";
                    break;
                case Fifteen:NumberString += "Fifteen ";
                    break;
                case Sixteen:NumberString += "Sixteen ";
                    break;
                case Seventeen:NumberString += "Seventeen ";
                    break;
                case Eighteen:NumberString += "Eightteen ";
                    break;
                case Nineteen:NumberString += "Nineteen ";
                    break;

                }

            }

            NumberString += "Thousands ";
        }

        else if (*Number < 100000)
        {
        int TempNumber = *Number / 1000;
           

            if (*Number < 100)
            {
                
                switch ((enNumber20To90)*Number)
                {

                case Townty:NumberString += "Townty ";

                    break;
                case Thirty:NumberString += "Thirty ";

                    break;
                case Fourty:NumberString += "Fourty ";

                    break;
                case Fifty:NumberString += "Fifty ";

                    break;
                case Sixty:NumberString += "Sixty ";

                    break;
                case Seventy:NumberString += "Seventy ";

                    break;
                case Eighty:NumberString += "Eighty ";

                    break;
                case Ninety:NumberString += "Ninety ";

                    break;

                }
            }


          if (vNumbers[2] == 0)
            {
                NumberString += "Thousands ";
            }
          
        }

        else if (*Number < 1000000)
        {
            int TempNumber  = *Number / 1000;;
            

            if (TempNumber < 1000)
            {
               


                if (TempNumber < 10)
                {
                    switch ((enNumber1To9)TempNumber)
                    {

                    case One:
                        NumberString += "One ";

                        break;
                    case Tow:NumberString += "Tow ";

                        break;
                    case Three:NumberString += "Three ";

                        break;

                    case Four:NumberString += "Four ";

                        break;
                    case Five:NumberString += "Five ";

                        break;
                    case Six:NumberString += "Six ";

                        break;
                    case Seven:NumberString += "Seven ";

                        break;
                    case Eight:NumberString += "Eight ";

                        break;
                    case Nine:NumberString += "Nine ";

                        break;
                    }

                }
                            

                if (TempNumber == 100)
                {
                    NumberString += "Hundred ";

                }
                else
                {
                    NumberString += "Hundreds ";

                }
            }


            
            if (vNumbers[5] < 1000)
            {
                NumberString += "Thousands ";
            }
           
        }

        else if (*Number < 10000000)
        {
            int TempNumber = *Number / 1000000;
         

            if (TempNumber < 10)
            {
                switch ((enNumber1To9)TempNumber)
                {

                case One:
                    NumberString += "One ";

                    break;
                case Tow:NumberString += "Tow ";

                    break;
                case Three:NumberString += "Three ";

                    break;

                case Four:NumberString += "Four ";

                    break;
                case Five:NumberString += "Five ";

                    break;
                case Six:NumberString += "Six ";

                    break;
                case Seven:NumberString += "Seven ";

                    break;
                case Eight:NumberString += "Eight ";

                    break;
                case Nine:NumberString += "Nine ";

                    break;
                }

            }



            if (TempNumber == 1)
            {
                NumberString += "Million ";
            }
            else
                NumberString += "Millions ";
        }

        else if (*Number < 20000000)
        {
        int TempNumber = *Number / 1000000;

            if (TempNumber < 20)
            {

                switch ((enNumber10To19)TempNumber)
                {
                case Ten:NumberString += "Ten ";
                    break;
                case Eleven:NumberString += "Eleven ";
                    break;
                case Twelve:NumberString += "Twelve ";
                    break;
                case Thirteen:NumberString += "Thirteen ";
                    break;
                case Fourteen:NumberString += "Fourteen ";
                    break;
                case Fifteen:NumberString += "Fifteen ";
                    break;
                case Sixteen:NumberString += "Sixteen ";
                    break;
                case Seventeen:NumberString += "Seventeen ";
                    break;
                case Eighteen:NumberString += "Eightteen ";
                    break;
                case Nineteen:NumberString += "Nineteen ";
                    break;

                }

            }


            NumberString += "Millions ";

        }

        else if (*Number < 100000000)
        {
       int  TempNumber = *Number / 1000000;

            if (TempNumber < 100)
            {
              

                switch ((enNumber20To90)TempNumber)
                {

                case Townty:NumberString += "Townty ";

                    break;
                case Thirty:NumberString += "Thirty ";

                    break;
                case Fourty:NumberString += "Fourty ";

                    break;
                case Fifty:NumberString += "Fifty ";

                    break;
                case Sixty:NumberString += "Sixty ";

                    break;
                case Seventy:NumberString += "Seventy ";

                    break;
                case Eighty:NumberString += "Eighty ";

                    break;
                case Ninety:NumberString += "Ninety ";

                    break;

                }
            }



            if (vNumbers[6] % 10000000 == 0)
            {
                NumberString += "Millions ";
            }
        }

        else if (*Number < 1000000000)
        {
            int TempNumber = *Number / 1000000;

            if (TempNumber < 1000)
            {

                if (TempNumber < 10)
                {
                    switch ((enNumber1To9)TempNumber)
                    {

                    case One:
                        NumberString += "One ";

                        break;
                    case Tow:NumberString += "Tow ";

                        break;
                    case Three:NumberString += "Three ";

                        break;

                    case Four:NumberString += "Four ";

                        break;
                    case Five:NumberString += "Five ";

                        break;
                    case Six:NumberString += "Six ";

                        break;
                    case Seven:NumberString += "Seven ";

                        break;
                    case Eight:NumberString += "Eight ";

                        break;
                    case Nine:NumberString += "Nine ";

                        break;
                    }

                }

             

                if (TempNumber == 100)
                {
                    NumberString += "Hundred ";

                }
                else
                {
                    NumberString += "Hundreds ";

                }
            }


              if (vNumbers[7] < 1000)
            {
                NumberString += "Thousands ";
            }
        
        }

        else if (*Number < 10000000000)
        {
            int TempNumber =  *Number / 1000000000;

            if (TempNumber < 10)
            {
                switch ((enNumber1To9)TempNumber)
                {

                case One:
                    NumberString += "One ";

                    break;
                case Tow:NumberString += "Tow ";

                    break;
                case Three:NumberString += "Three ";

                    break;

                case Four:NumberString += "Four ";

                    break;
                case Five:NumberString += "Five ";

                    break;
                case Six:NumberString += "Six ";

                    break;
                case Seven:NumberString += "Seven ";

                    break;
                case Eight:NumberString += "Eight ";

                    break;
                case Nine:NumberString += "Nine ";

                    break;
                }

            }



            if (TempNumber == 1)
            {
                NumberString += "Billion ";
            }
            else
                NumberString += "Billions ";
        }
    }
    return NumberString;
}

int main()
{
    int Number = ReadNumber();
    vector <int> vNumbers = Numbers(Number);

    string NumberString = ConvertNumberToString(vNumbers);


    cout << NumberString << endl;
    system("pause>0");
}

