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

void FillArrayWithRandomNumbers(int arr[100], int& arrLegnth)
{
    arrLegnth = ReadPositiveNumber("Enter The Number Of Elements:");

    for (int i = 0; i < arrLegnth; i++)
    {
        arr[i] = RandomNumber(1, 100);
    }
    cout << endl;

}

void PrintArray(int arr[100], int arrLegnth)
{
    for (int i = 0; i < arrLegnth; i++)
    {

        cout << arr[i] << " ";

    }
    cout << endl;
}

int MinNumberInArray(int arr[100], int arrLegnth)
{
    int MinNumber = arr[0];
    for (int i = 0; i < arrLegnth; i++)
    {
        if (MinNumber > arr[i])
            MinNumber = arr[i];

    }
    return MinNumber;
}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength;

    FillArrayWithRandomNumbers(arr, arrLength);

    cout << "\Array Elements: ";
    PrintArray(arr, arrLength);

    cout << "\nThe Max Random Number In Array is :" << MinNumberInArray(arr, arrLength) << endl;





    return 0;
}
