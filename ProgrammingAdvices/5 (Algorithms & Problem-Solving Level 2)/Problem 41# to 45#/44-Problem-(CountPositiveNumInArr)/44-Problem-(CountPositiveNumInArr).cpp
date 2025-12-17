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
    arrLength = ReadPositiveNumber("Please Enter The Number?");
    for (int i = 0; i < arrLength; i++)
    {
        arr[i] = RandomNumber(-100, 100);
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

short PositiveCount(int arr[100], int arrLength)
{
    int Count = 0;
    for (int i = 0; i < arrLength; i++)
    {
        if (arr[i] >= 0)
        {
            Count++;
        }

    } return  Count;
}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength = 0;



    FillArrayWithRandomNumbers(arr, arrLength);



    cout << "\nArray Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\nEven Numbers count is :";
    cout << PositiveCount(arr, arrLength) << endl;



    return 0;
}
