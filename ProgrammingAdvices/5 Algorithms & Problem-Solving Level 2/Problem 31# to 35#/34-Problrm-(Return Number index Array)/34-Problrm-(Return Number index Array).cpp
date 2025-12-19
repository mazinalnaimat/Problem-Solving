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

int RandomNumber(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;
    return randNum;

}

void FillArrayWithRandomNumbers(int arr[100], int& arrLength)
{


    for (int i = 0; i < arrLength; i++)
    {
        arr[i] = RandomNumber(1, 100);
    }
    cout << endl;

}

void PrintArray(int arr[100], int arrLength)
{
    for (int i = 0; i < arrLength; i++)
    {

        cout << arr[i] << " ";

    }
    cout << endl;
}

int FindNumberPositionInArray(int Number, int arr[100], int arrLength)
{
   
    for (int i = 0; i < arrLength; i++)
    {           
        if (arr[i] == Number)
        {
            return i;
        }
    }
    return -1;

}

void PrintDetailsOfCheckNumber(short PostionNumber,int Number, int arr[100], int arrLength)
{
    if (FindNumberPositionInArray(Number, arr, arrLength) > -1)
    {
        cout << "\nNumber you are Looking for is: " << Number << endl;
        cout << "The number found at postion: " << PostionNumber << endl;
        cout << "The number found its order: " << PostionNumber + 1 << endl;
    }
    else
    {
        cout << "\nNumber you are Lookinf for is: " << Number << endl;
        cout << "The Number is not found :-(" << endl;
    }
}




int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength;
    arrLength = ReadPositiveNumber("Enter The Number Of Elements:");

    FillArrayWithRandomNumbers(arr, arrLength);
      
    cout << "Array 1 Elements:\n";
    PrintArray(arr, arrLength);

    int Number = ReadPositiveNumber("\nPlease Enter A Number To Search For?\n");
    short PostionNumber = FindNumberPositionInArray(Number, arr, arrLength);

    PrintDetailsOfCheckNumber(PostionNumber, Number, arr, arrLength);

    return 0;
}
