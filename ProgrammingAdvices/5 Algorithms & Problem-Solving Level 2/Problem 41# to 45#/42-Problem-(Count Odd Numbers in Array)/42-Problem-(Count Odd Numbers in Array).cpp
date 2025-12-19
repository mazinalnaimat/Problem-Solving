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


}

void PrintArray(int arr[100], int arrLegnth)
{
    for (int i = 0; i < arrLegnth; i++)
    {

        cout << arr[i] << " ";

    }
    cout << endl;
}

short OddCount(int arr[100], int arrLength)
{
    int Count = 0;
    for (int i = 0; i < arrLength; i++)
    {
        if (arr[i] % 2 != 0)
        {
            Count++;
        }

    } return  Count;
}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength = 0;

    arrLength = ReadPositiveNumber("Please Enter The Number?");

    FillArrayWithRandomNumbers(arr, arrLength);



    cout << "\nArray 1 Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\nOdd Numbers count is :";
   cout << OddCount(arr, arrLength);



    return 0;
}
