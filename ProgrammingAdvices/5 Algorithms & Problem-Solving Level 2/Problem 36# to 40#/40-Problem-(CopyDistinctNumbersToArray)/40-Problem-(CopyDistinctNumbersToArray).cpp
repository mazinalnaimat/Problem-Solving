#include <iostream>
using namespace std;


void FillArray(int arr[100], int& arrLegnth)
{
    arrLegnth = 10;

    arr[0] = 10;
    arr[1] = 10;
    arr[2] = 10;
    arr[3] = 50;
    arr[4] = 50;
    arr[5] = 70;
    arr[6] = 70;
    arr[7] = 70;
    arr[8] = 70;
    arr[9] = 90;


}

void PrintArray(int arr[100], int arrLegnth)
{
    for (int i = 0; i < arrLegnth; i++)
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

bool IsNumberInArray( int Number, int arr[100], int arrLength)
{
    return FindNumberPositionInArray(Number,arr,arrLength) != -1;
}

void AddArrayElement(int Number, int arr[100], int& arrLength)
{
    //its a new element so we need to add the length by 1
    arrLength++;
    arr[arrLength - 1] = Number;
}

void CopyDistincNumbers(int arrSource[100], int arrDestination[100], int arrLength, int& arrDestinationLength)
{

    for (int i = 0; i < arrLength; i++)
    {                                                                                                                            
        if (!IsNumberInArray(arrSource[i], arrDestination, arrDestinationLength))
            AddArrayElement(arrSource[i], arrDestination, arrDestinationLength);

    }

}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength = 0, arr2[100], arr2Length = 0;

    FillArray(arr, arrLength);

 
    CopyDistincNumbers(arr, arr2, arrLength, arr2Length);

    cout << "\nArray 1 Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\nArray 2 Distinc numbers:\n";
    PrintArray(arr2, arr2Length);



    return 0;
}
