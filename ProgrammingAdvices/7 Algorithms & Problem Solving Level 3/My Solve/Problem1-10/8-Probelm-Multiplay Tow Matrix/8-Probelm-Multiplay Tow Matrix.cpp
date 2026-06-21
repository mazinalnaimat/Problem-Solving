
#include <iostream>
#include <cstdio>
using namespace std;


int  RandomNumbere(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;

    return randNum;
}


void FillMatrixWithRandomNumbers(int  arr[3][3], short Rows, short Cols)
{
  
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
           
            arr[i][j] = RandomNumbere(1,10);
        }
    }

}

void MultiplayTowMatrix(int  arr[3][3], int arr2[3][3], int arrMultiplay[3][3], short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            arrMultiplay[i][j] = arr[i][j] * arr2[i][j];
        }
    }

}

void PrintMatrix(int  arr[3][3], short Rows, short Cols)
{


    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            printf("%0*d", 2,arr[i][j]);
            cout<< "\t";
        }
        cout << endl;
    }

}



int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3], Matrix2[3][3], MultiplayMatrix[3][3];


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    FillMatrixWithRandomNumbers(Matrix2, 3, 3);
    cout << "\nMatrix2:" << "\n";
    PrintMatrix(Matrix2, 3, 3);

    MultiplayTowMatrix(Matrix1, Matrix2, MultiplayMatrix, 3, 3);
    cout << "\nResults:" << "\n";
    PrintMatrix(MultiplayMatrix, 3, 3);

    system("pause>0");

}


