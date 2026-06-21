

#include <iostream>

using namespace std;


    enum enNumber1To9 { One = 1, Tow = 2, Three = 3, Four = 4, Five = 5, Six = 6, Seven = 7, Eight = 8, Nine = 9 };
    enum enNumber10To19 { Ten = 10, Eleven = 11, Twelve = 12, Thirteen = 13, Fourteen = 14, Fifteen = 15, Sixteen = 16, Seventeen = 17, Eighteen = 18, Nineteen = 19 };
    enum enNumber20To90 {  Townty = 20, Thirty = 30, Fourty = 40, Fifty = 50, Sixty = 60, Seventy = 70, Eighty = 80, Ninety = 90 };

int ReadNumber()
{
    int Number;
    cout << "Enter a Number? ";
    cin >> Number;
    return Number;
}

string ConvertNumberToString(int Number)
{
    string NumberString = "";

    while (Number > 0)
    {

        if (Number < 10)
        {
            switch ((enNumber1To9)Number)
            {

            case One:
                NumberString += "One ";
                Number = Number / 10;
                break;
            case Tow:NumberString += "Tow ";
                Number = Number / 10;
                break;
            case Three:NumberString += "Three ";
                Number = Number / 10;
                break;

            case Four:NumberString += "Four ";
                Number = Number / 10;
                break;
            case Five:NumberString += "Five ";
                Number = Number / 10;
                break;
            case Six:NumberString += "Six ";
                Number = Number / 10;
                break;
            case Seven:NumberString += "Seven ";
                Number = Number / 10;
                break;
            case Eight:NumberString += "Eight ";
                Number = Number / 10;
                break;
            case Nine:NumberString += "Nine ";
                Number = Number / 10;
                break;
            }

        }

        else if (Number < 20)
        {

            switch ((enNumber10To19)Number)
            {
            case Ten:NumberString += "Ten ";
                Number = Number / 100;
                break;
            case Eleven:NumberString += "Eleven ";
                Number = Number / 100;
                break;
            case Twelve:NumberString += "Twelve ";
                Number = Number / 100;
                break;
            case Thirteen:NumberString += "Thirteen ";
                Number = Number / 100;
                break;
            case Fourteen:NumberString += "Fourteen ";
                Number = Number / 100;
                break;
            case Fifteen:NumberString += "Fifteen ";
                Number = Number / 100;
                break;
            case Sixteen:NumberString += "Sixteen ";
                Number = Number / 100;
                break;
            case Seventeen:NumberString += "Seventeen ";
                Number = Number / 100;
                break;
            case Eighteen:NumberString += "Eightteen ";
                Number = Number / 100;
                break;
            case Nineteen:NumberString += "Nineteen ";
                Number = Number / 100;
                break;

            }

        }

        else if (Number < 100)
        {
            int Remainder = Number;
            Number = Number / 10;
            Number = Number * 10;

            switch ((enNumber20To90)Number)
            {

            case Townty:NumberString += "Townty ";
                Number = Remainder - Number;
                break;
            case Thirty:NumberString += "Thirty ";
                Number = Remainder - Number;
                break;
            case Fourty:NumberString += "Fourty ";
                Number = Remainder - Number;
                break;
            case Fifty:NumberString += "Fifty ";
                Number = Remainder - Number;
                break;
            case Sixty:NumberString += "Sixty ";
                Number = Remainder - Number;
                break;
            case Seventy:NumberString += "Seventy ";
                Number = Remainder - Number;
                break;
            case Eighty:NumberString += "Eighty ";
                Number = Remainder - Number;
                break;
            case Ninety:NumberString += "Ninety ";
                Number = Remainder - Number;
                break;
            default:
                break;
            }
        }

        else if (Number < 1000)
        {
            int Remainder = Number;
            Number = Number / 100;

            if (Number < 10)
            {
                switch ((enNumber1To9)Number)
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

            Number = Number * 100;

            if (Number == 1)
            {
                NumberString += "Hundred ";
                Number = Remainder - Number;
            }
            else
            {
                NumberString += "Hundreds ";
                Number = Remainder - Number;
            }
        }

        else if (Number < 10000)
        {
            int Remainder = Number;
            Number = Number / 1000;




            if (Number < 10)
            {
                switch ((enNumber1To9)Number)
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

            if (Number == 1)
                NumberString += "Thousand ";
            else
                NumberString += "Thousands ";

            Number = Number * 1000;
            Number = Remainder - Number;
        }

        else if (Number < 20000)
        {
            int Remainder = Number;
            Number = Number / 1000;

            if (Number < 20)
            {

                switch ((enNumber10To19)Number)
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

            Number = Number * 1000;
            Number = Remainder - Number;
        }

        else if (Number < 100000)
        {
            int Remainder = Number;
            Number = Number / 1000;

            if (Number < 100)
            {
                int Remainder = Number;
                Number = Number / 10;
                Number = Number * 10;

                switch ((enNumber20To90)Number)
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


            int Remainder2 = Remainder % 10000;
            if (Remainder2 == 0)
            {
                NumberString += "Thousands ";
            }
            Number = Number * 1000;
            Number = Remainder - Number;
        }

        else if (Number < 1000000)
        {
            int Remainder = Number;
            Number = Number / 1000;

            if (Number < 1000)
            {
                int Remainder = Number;
                Number = Number / 100;

                if (Number < 10)
                {
                    switch ((enNumber1To9)Number)
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

                Number = Number * 100;

                if (Number == 100)
                {
                    NumberString += "Hundred ";

                }
                else
                {
                    NumberString += "Hundreds ";

                }
            }


            int Remainder2 = Remainder % 100000;
            if (Remainder2 < 1000)
            {
                NumberString += "Thousands ";
            }
            Number = Number * 1000;
            Number = Remainder - Number;
        }

        else if (Number < 10000000)
        {
            int Remainder = Number;
            Number = Number / 1000000;

            if (Number < 10)
            {
                switch ((enNumber1To9)Number)
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



            if (Number == 1)
            {
                NumberString += "Million ";
            }
            else
                NumberString += "Millions ";
            Number = Number * 1000000;
            Number = Remainder - Number;
        }

        else if (Number < 20000000)
        {
            int Remainder = Number;
            Number = Number / 1000000;

            if (Number < 20)
            {

                switch ((enNumber10To19)Number)
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

            Number = Number * 1000000;
            Number = Remainder - Number;
        }

        else if (Number < 100000000)
        {
            int Remainder = Number;
            Number = Number / 1000000;

            if (Number < 100)
            {
                int Remainder = Number;
                Number = Number / 10;
                Number = Number * 10;

                switch ((enNumber20To90)Number)
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



            if (Remainder % 10000000 == 0)
            {
                NumberString += "Millions ";
            }
            Number = Number * 1000000;
            Number = Remainder - Number;
        }

        else if (Number < 1000000000)
        {
            int Remainder = Number;
            Number = Number / 1000000;

            if (Number < 1000)
            {
                int Remainder = Number;
                Number = Number / 100;

                if (Number < 10)
                {
                    switch ((enNumber1To9)Number)
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

                Number = Number * 100;

                if (Number == 100)
                {
                    NumberString += "Hundred ";

                }
                else
                {
                    NumberString += "Hundreds ";

                }
            }


            int Remainder2 = Remainder % 100000000;
            if (Remainder2 < 1000)
            {
                NumberString += "Thousands ";
            }
            Number = Number * 1000000;
            Number = Remainder - Number;
        }

        else if (Number < 10000000000)
        {
            int Remainder = Number;
            Number = Number / 1000000000;

            if (Number < 10)
            {
                switch ((enNumber1To9)Number)
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



            if (Number == 1)
            {
                NumberString += "Billion ";
            }
            else
                NumberString += "Billions ";
            Number = Number * 1000000000;
            Number = Remainder - Number;
        }


    }
    return NumberString;
}

int main()
{
   
    int Number = ReadNumber();

    string NumberString = ConvertNumberToString(Number);
    

    cout << NumberString << endl;
    system("pause>0");

}
