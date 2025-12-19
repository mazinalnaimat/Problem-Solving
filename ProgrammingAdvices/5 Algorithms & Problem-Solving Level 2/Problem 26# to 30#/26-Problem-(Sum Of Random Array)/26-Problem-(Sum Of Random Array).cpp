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

int SumNumbersInArray(int arr[100], int arrLegnth)
{
    int Sum = 0;
    for (int i = 0; i < arrLegnth; i++)
    {
        Sum += arr[i];

    }
    return Sum;
}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength;

    FillArrayWithRandomNumbers(arr, arrLength);

    cout << "\Array Elements: ";
    PrintArray(arr, arrLength);

    cout << "\nThe Sum Of All Random Numbers In Array is :" << SumNumbersInArray(arr, arrLength) << endl;





    return 0;
}
