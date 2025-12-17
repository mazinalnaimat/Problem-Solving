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



void SumOfTwoArrays(int arr1[100], int arr2[100], int arrSum[100], int arrLegnth)
{
    
    for (int i = 0; i < arrLegnth; i++)
    {
        arrSum[i] = arr1[i] + arr2[i];
    }       
}

int main()
{
    srand((unsigned)time(NULL));


    int arr1[100], arr2[100], arrSum[100], arrLength;

    arrLength = ReadPositiveNumber("Enter The Number Of Elements:");

    FillArrayWithRandomNumbers(arr1, arrLength);
    FillArrayWithRandomNumbers(arr2, arrLength);

    SumOfTwoArrays(arr1, arr2, arrSum, arrLength);

    cout << "\nArray 1 Elements:\n";
    PrintArray(arr1, arrLength);


    cout << "\nArray 2 Elements:\n";
    PrintArray(arr2, arrLength);

    cout << "\nSum Of Array1 and Array2 Elements:\n";
 
    PrintArray(arrSum, arrLength);



    return 0;
}
