
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

bool AreEqualMatrices(int Matrix1[3][3], int Matrix2[3][3], short Rows, short Cols)

{
    return(SumOfElementsOfMatix(Matrix1, Rows, Cols) == SumOfElementsOfMatix(Matrix2, Rows, Cols));

}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3],Matrix2[3][3];


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    FillMatrixWithRandomNumbers(Matrix2, 3, 3);
    cout << "\nMatrix2:" << "\n";
    PrintMatrix(Matrix2, 3, 3);

    if (AreEqualMatrices(Matrix1, Matrix2, 3, 3))
    {
        cout << "\n Yes: both matrices are equal.\n";
    }
    else
        cout << "\n No: matrices are NOT equal.\n";

   ;


    system("pause>0");

}


