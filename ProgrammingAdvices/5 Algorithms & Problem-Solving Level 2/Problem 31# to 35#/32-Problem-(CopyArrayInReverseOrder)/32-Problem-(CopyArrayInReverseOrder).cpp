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

void CopyArrayInReverseOrder(int arrSource[100], int arrDestination[100], int arrLegnth)
{
    
   
    for (int i = 0; i < arrLegnth; i++)
    {               
            
            arrDestination[i] = arrSource[arrLegnth-1-i];
                                   
    }
   

}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength ;
    arrLength = ReadPositiveNumber("Enter The Number Of Elements:");

    FillArrayWithRandomNumbers(arr, arrLength);

    int arr2[100];
    CopyArrayInReverseOrder(arr, arr2, arrLength);

    cout << "Array 1 Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\n Array 2 Elements After Copy:\n";
    PrintArray(arr2, arrLength);



    return 0;
}
