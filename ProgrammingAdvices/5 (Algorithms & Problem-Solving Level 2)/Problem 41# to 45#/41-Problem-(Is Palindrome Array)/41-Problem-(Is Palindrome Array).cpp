#include <iostream>
using namespace std;


void FillArray(int arr[100], int& arrLength)
{
    arrLength = 9;

    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;
    arr[4] = 50;
    arr[5] = 40;
    arr[6] = 30;
    arr[7] = 20;
    arr[8] = 10;
    
}

void PrintArray(int arr[100], int arrLength)
{
    for (int i = 0; i < arrLength; i++)
    {

        cout << arr[i] << " ";

    }
    cout << endl;
}

bool IsPalindromeArray(int arr[100], int arrLength)
{
    for (int i = 0; i < arrLength; i++)
    {
        if (arr[i] != arr[arrLength - 1 - i])
        {
            return false;
        }
    }
    return true;
}

int main()
{
    srand((unsigned)time(NULL));

    int arr[100],arrLength;
      FillArray(arr, arrLength);

   
    cout << "Array Elements:\n";
    PrintArray(arr, arrLength);

    if (IsPalindromeArray(arr,  arrLength))
    {
        cout << "\nYes Array is Palindrome.\n";
    }
    else
    {
        cout << "\nNo Array is not Palindrome.\n";
    }



    return 0;
}
