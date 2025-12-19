
#include <iostream>
using namespace std;

int ReadNumber(string Message)
{
    int Number = 0;
    cout << Message ;
    cin >> Number;
    cout << endl;
    return Number;
}

int ReadNumberInRange(int From  ,int To, string Message)
{
    int Number = 0;
    do
    {
        cout << Message;
        cin >> Number;
        cout << endl;
    } while (Number < From || Number > To);
 
  
    return Number;
}

void AddArrayElement(int Number ,int arr[100], int& arrLength)
{
     
         arrLength++;
        arr[arrLength-1] = Number;
       
}
     
void InputUserNumbersInArray(int arr[100], int &arrLength)
{

    string Message = "Please enter a number? ";

    bool AddMore = true;

    do
    {
        AddArrayElement(ReadNumber(Message), arr, arrLength);
        string Message2 = "Do you want to add more munbers? [0]:No,[1]yes? ";
        AddMore = ReadNumberInRange(0, 1, Message2);
    } while (AddMore == true);

}
    
void PrintArray(int arr[100], int arrLength)
{
    for (int i = 0; i < arrLength; i++)
    {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main()
{
    int arr[100], arrLength;
    arrLength = 0;
          
    InputUserNumbersInArray( arr, arrLength);
    cout << endl;
    cout << "Array Length:" << arrLength << endl;
    cout << "Array elements:";
    PrintArray(arr, arrLength);

    return 0;

}
