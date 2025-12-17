#include <iostream>
using namespace std;

float GetFractionPart(float Number)
{
    return Number - (int)Number;
}

float SqrtForGreaterThan1(int Number)
{
    {
        if (Number >= 1 && Number <= 100)
            for (double i = 0; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }
        else if (Number > 100 && Number <= 200)
        {
            for (double i = 100; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 200 && Number <= 300)
        {
            for (double i = 200; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 300 && Number <= 400)
        {
            for (double i = 300; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 400 && Number <= 500)
        {
            for (double i = 400; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 500 && Number <= 600)
        {
            for (double i = 500; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 600 && Number <= 700)
        {
            for (double i = 600; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 700 && Number <= 800)
        {
            for (double i = 700; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 800 && Number <= 900)
        {
            for (double i = 800; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 900 && Number <= 1000)
        {
            for (double i = 900; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 1000 && Number <= 10000)
        {
            for (double i = 1000; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 10000 && Number <= 20000)
        {
            for (double i = 10000; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }
        else if (Number > 20000 && Number <= 100000)
        {
            for (double i = 20000; i <= Number; i = i + 0.00000001)
            {
                if (float(i * i) == Number)
                {
                    return (float)i;
                }
            }

        }


        else return 0;
    }  return 0;

}





float MySqrt(float Number)
{
    if (Number >= 1)
    {
        return  SqrtForGreaterThan1(Number);
    }
    else
    {
        float Up = Number;
        int CountZero = 1;
        while (GetFractionPart(Up) > 0.00000010000000)
        {
             Up = Up * 10;
             CountZero *= 10;
        }
        return  SqrtForGreaterThan1(Up) / SqrtForGreaterThan1(CountZero);
    }
    return 0;
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
    cout << "My sqrt Result : " << MySqrt(Number) << endl;
    cout << "C++ sqrt Result: " << sqrt(Number) << endl;
    system("pause");


}

