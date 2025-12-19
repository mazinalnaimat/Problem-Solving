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

void ReadArray(int arr[100], int& arrLegnth)
{
    arrLegnth = ReadPositiveNumber("Enter The Number Of Elements:");
    cout << "\nEnter Array Elemnets: \n";
    for (int i = 0; i < arrLegnth; i++)
    {
        cout << "Element [" << i+1 << "]: ";
        cin>> arr[i];
    }
    cout << endl;

}

void PrintArray(int arr[100], int& arrLegnth)
{
    for (int i = 0; i < arrLegnth; i++)
    {
       
        cout << arr[i] <<" ";
     
    }
}

int TimesRepeated(int Number, int arr[100], int arrLength)
{
    int Repeated = 0;
    for (int i = 0; i < arrLength; i++)
    {
        if (arr[i] == Number)
            Repeated += 1;
    }

    return Repeated;
}


int main()
{
    int arr[100], arrLength, NumberToCheck;

    ReadArray(arr, arrLength);

      
  
    NumberToCheck = ReadPositiveNumber("Enter The Numebr you want to check: ");

    
    cout << "\nOriginal array: ";
    PrintArray(arr, arrLength);

    
    cout << "\nNumber " << NumberToCheck;
    cout << " is repeated ";
    cout << TimesRepeated(NumberToCheck, arr, arrLength) << " time(s)\n";
        





    return 0;
}
