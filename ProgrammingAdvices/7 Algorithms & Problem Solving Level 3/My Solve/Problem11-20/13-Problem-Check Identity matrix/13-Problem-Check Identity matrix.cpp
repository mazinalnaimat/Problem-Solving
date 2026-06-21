
#include <iostream>

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

void FillIdentityMatrix(int  Matrix1[3][3], short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            Matrix1[i][i] = 1;
            if (i != j)
            {
                Matrix1[i][j] = 0;
            }
               
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
            printf("%0*d", 1, arr[i][j]);
            cout << "\t";
        }
        cout << endl;
    }

}\

bool IsIdentityMatrices(int Matrix1[3][3], short Rows, short Cols)
{
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            if (Matrix1[i][i] != 1 || Matrix1[i][j] != 0)
            {
                if(i==j)
                continue;
                return 0;
            }
        }
    }
    return(1);
}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3];

    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    //FillIdentityMatrix(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

  

    if (IsIdentityMatrices(Matrix1, 3, 3))
    {
        cout << "\n Yes: The matrix is Identity.\n";
    }
    else
        cout << "\n No: The matrix is NOT Identity.\n";

    system("pause>0");

}


