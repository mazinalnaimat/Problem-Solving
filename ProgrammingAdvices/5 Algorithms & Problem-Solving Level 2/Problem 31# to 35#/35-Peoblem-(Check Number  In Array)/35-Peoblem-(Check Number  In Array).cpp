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

char IsNumberInArray(int NumberPosition,int Number, int arr[100], int arrLength)
{          
          return NumberPosition !=-1;
}

void PrintCheckingNumberInArray(int NumberPosition, int Number, int arr[100], int arrLength)
{
    if (IsNumberInArray(NumberPosition,Number, arr, arrLength))
    {
        cout << "\nNumber you are lookong for is " << Number << endl;
        cout << "Yes, Tne number is found :-) " << endl;
    }
    else
    {
        cout << "\nNumber you are lookong for is " << Number << endl;
        cout << "No, Tne number is not found :-( " << endl;
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

    int Number = ReadPositiveNumber("\nPlease Enter A Number To Search For?");
    int NumberPosition = FindNumberPositionInArray(Number, arr, arrLength);

    PrintCheckingNumberInArray(NumberPosition,Number, arr, arrLength);

    return 0;
}
