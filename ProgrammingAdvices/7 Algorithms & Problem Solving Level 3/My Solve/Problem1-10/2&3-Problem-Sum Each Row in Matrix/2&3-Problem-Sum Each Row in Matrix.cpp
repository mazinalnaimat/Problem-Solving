
#include <iostream>
using namespace std;

int  RandomNumbere(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;

    return randNum;
}

void FillTheRAndNumberTo3x3Matrix(int  arr[3][3], short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            arr[i][j] = RandomNumbere(1, 100);
        }
    }

}

void SumOfRowsInMatrix(int  arrSum[3], int  arr[3][3], short Rows, short Cols)
{
   
    for (int i = 0; i < Rows; i++)
    {
        arrSum[i] = { 0 };
        for (int j = 0; j < Cols; j++)
        {
           arrSum[i]+= arr[i][j] ;
        }
    }

}

void Print3x3RandomMatrix(int  arr[3][3], short Rows, short Cols)
{


    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            cout << arr[i][j] << "\t";
        }
        cout << endl;
    }

}

void PrintSumOfRowsInMatrix(int  arrSum[3], short Rows )
{


    for (int i = 0; i < Rows; i++)
    {
       
        
            cout <<"Row "<<i+1<<" Sum = " << arrSum[i] << "\n";
       
      
    }

}


int main()
{
    srand((unsigned)time(NULL));

    int arr[3][3];
    int arrSum[3];

    FillTheRAndNumberTo3x3Matrix(arr, 3, 3);
    cout << "\nThe following is a 3x3 random matrix:" << "\n";
    Print3x3RandomMatrix(arr, 3, 3);

    SumOfRowsInMatrix(arrSum, arr, 3, 3);
    cout << "\nThe following are the sum of each row in the matrix:" << "\n";
    PrintSumOfRowsInMatrix(arrSum, 3);

    system("pause>0");

}
