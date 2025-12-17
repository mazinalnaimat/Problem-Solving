
#include <iostream>
using namespace std;

enum enCharType { SmallLetters = 1, CapitalLettres = 2, SpecialCarracters = 3, Digits = 4 };

int RandomNumber(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;
    return randNum;
}

char GetRandomCharacter(enCharType CharType)
{
    switch (CharType)
    {
    case enCharType::CapitalLettres:
    {
        return  (char)RandomNumber(65, 90);
        break;
    }
    case enCharType::SmallLetters:
    {
        return   (char)RandomNumber(97, 122);
        break;
    }
    case enCharType::SpecialCarracters:
    {
        return (char)RandomNumber(65, 90);
        break;
    }
    case enCharType::Digits:
    {
        return (char)RandomNumber(48, 57);
        break;
    }
    } return 0;

}

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

string GenerateWord(enCharType CharType, short Length)
{
    string word = "";
    for (int i = 1; i <= Length; i++)
    {
        word += GetRandomCharacter(CharType);
    }
    return word;
}

string GenerateKey()
{
    string Key = "";
    for (int i = 1; i <= 4; i++)
    {
        Key += GenerateWord(enCharType::CapitalLettres, 4);

        if (i != 4)
            Key += "-";

    }
    return Key;
}

void FillArrayWithKeys(string arr[100], int arrLength)
{
    for (int Counter = 0; Counter <= arrLength; Counter++)
    arr[Counter] = GenerateKey();   
}

void PrintStringArray(string arr[100], int arrLength)
{
    cout << "\nArray Elements: \n\n";
    for (int i = 0; i < arrLength; i++)
    {
        cout << "Array [" << i << "]: ";
        cout << arr[i];
        cout << endl;
    }
}

int main()
{
    srand((unsigned)time(NULL));

    string arr[100];
    int arrLength = ReadPositiveNumber("Please Enter The Number Of Keys to Generate?\n");

   
    FillArrayWithKeys(arr, arrLength);

    PrintStringArray(arr, arrLength);

    return 0;
}

