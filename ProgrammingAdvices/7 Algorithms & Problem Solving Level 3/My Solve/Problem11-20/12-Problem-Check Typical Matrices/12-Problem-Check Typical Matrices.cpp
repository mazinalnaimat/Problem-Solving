
#include <iostream>
//#include <cstdio>
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

            arr[i][j] = RandomNumbere(1, 10);
        }
    }

}

int SumOfElementsOfMatix(int  arr[3][3], short Rows, short Cols)
{
    int SumOfElements = 0;
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            SumOfElements += arr[i][j];
        }
    }
    return SumOfElements;
}

void PrintMatrix(int  arr[3][3], short Rows, short Cols)
{


    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            printf("%0*d", 2, arr[i][j]);
            cout << "\t";
        }
        cout << endl;
    }

}\

bool AreTypicalMatrices(int Matrix1[3][3], int Matrix2[3][3], short Rows, short Cols)
{

  
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            if(Matrix1[i][j] != Matrix2[i][j])
            return 0;
        }
    }
    return(1);

}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3], Matrix2[3][3];


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    FillMatrixWithRandomNumbers(Matrix2, 3, 3);
    cout << "\nMatrix2:" << "\n";
    PrintMatrix(Matrix2, 3, 3);

    if (AreTypicalMatrices(Matrix1, Matrix2, 3, 3))
    {
        cout << "\n Yes: both matrices are Typical.\n";
    }
    else
        cout << "\n No: matrices are NOT Typical.\n";

    system("pause>0");

}


