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

void AddArrayElement(int Number, int arr[100], int& arrLength)
{
    //its a new element so we need to add the length by 1
    arrLength++;
    arr[arrLength - 1] = Number;
}

void CopyArrayWithAddArrayElement(int arrSource[100], int arrDestination[100], int arrLength, int arrDestinationLength)
{
   
    for (int i = 0; i < arrLength; i++)
    {
        AddArrayElement(arrSource[i], arrDestination, arrDestinationLength);
       
    }

}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength = 0, arr2Length = 0;

    FillArrayWithRandomNumbers(arr, arrLength);

    int arr2[100];
    CopyArrayWithAddArrayElement(arr, arr2, arrLength, arr2Length);

    cout << "\nArray 1 Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\nArray 2 Elements:\n";
    PrintArray(arr2, arrLength);



    return 0;
}
