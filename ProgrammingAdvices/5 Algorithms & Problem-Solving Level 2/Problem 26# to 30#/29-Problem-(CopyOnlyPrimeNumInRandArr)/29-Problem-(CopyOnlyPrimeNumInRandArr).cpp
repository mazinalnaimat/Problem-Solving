#include <iostream>
using namespace std;


enum enPrimeNotPrime{ Prime = 1, NotPrime = 2};

enPrimeNotPrime CheckPrime(int Number)
{
    int M = round(Number / 2);

    for (int Counter = 2; Counter <= M; Counter++)
    {
        if (Number % Counter == 0)
            return enPrimeNotPrime::NotPrime;
    }
    return enPrimeNotPrime::Prime;

}

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



void CopyOnlyPrimeNumberInArray(int arrSource[100], int arrDestination[100], int arrLegnth, int& arr2Length)
{
    int Counter = 0;
    for (int i = 0; i < arrLegnth; i++)
    {
        if (CheckPrime(arrSource[i]) == enPrimeNotPrime::Prime)
        {
            arrDestination[Counter] = arrSource[i];
            Counter++;
        }
    }
    arr2Length = --Counter;

}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100], arrLength, arr2Length;

    FillArrayWithRandomNumbers(arr, arrLength);

    int arr2[100];
    CopyOnlyPrimeNumberInArray(arr, arr2, arrLength, arr2Length);

    cout << "\nArray 1 Elements:\n";
    PrintArray(arr, arrLength);


    cout << "\nPrime Numbers in Array 2:\n";
    PrintArray(arr2, arr2Length);



    return 0;
}
