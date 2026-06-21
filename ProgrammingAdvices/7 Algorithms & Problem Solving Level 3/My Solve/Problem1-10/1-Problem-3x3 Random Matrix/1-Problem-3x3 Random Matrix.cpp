
#include <iostream>
using namespace std;

int  RandomNumbere(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;

    return randNum;
}

void FillTheRAndNumberTo3x3Matrix(int  arr[3][3], short Rows, short Cols )
{
   
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            arr[i][j] = RandomNumbere(1, 100);
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


int main()
{
    srand((unsigned)time(NULL));

    int arr[3][3];

    FillTheRAndNumberTo3x3Matrix(arr, 3, 3);
    cout << "The following is a 3x3 random matrix:" << endl;
    Print3x3RandomMatrix(arr, 3, 3);

    system("pause>0");

}
