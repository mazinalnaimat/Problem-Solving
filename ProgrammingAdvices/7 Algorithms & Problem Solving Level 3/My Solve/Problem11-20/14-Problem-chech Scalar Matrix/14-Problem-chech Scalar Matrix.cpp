
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

void FillScalarMatrix(int  Matrix1[3][3], short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            Matrix1[i][i] = 5;
            if (i != j)
            {
                Matrix1[i][j] = 0;
            }

        }
    }

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

bool IsScalarMatrices(int Matrix1[3][3], short Rows, short Cols)
{
   // The 1st Way

    for (int i = 0; i < Rows; i++)
    {
        int FirstDiagElenment = Matrix1[0][0];
   

        for (int j = 0; j < Cols; j++)
        {
            if (Matrix1[i][i] != FirstDiagElenment || Matrix1[i][j] != 0)
            {
                if (i == j )
                    continue;
                return 0;
            }
        }
    }
    return(1);

    /*

  // The 2nd Way

     for (int i = 0; i < Rows; i++)
     {
         int FirstDiagElenment = Matrix1[0][0];
      
         for (int j = 0; j < Cols; j++)
         {
             if (i == j && Matrix1[i][j] != FirstDiagElenment)
             {
                 return false;
             }
             else if (i != j && Matrix1[i][j] != 0)
             {
                 return false;
             }
         }
     }
     return(1);*/
}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3];

    //FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    FillScalarMatrix(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    
    Matrix1[2][2] = 4;

    PrintMatrix(Matrix1, 3, 3);

    if (IsScalarMatrices(Matrix1, 3, 3))
    {
        cout << "\n Yes: The matrix is Scalar.\n";
    }
    else
        cout << "\n No: The matrix is NOT Scalar.\n";

    system("pause>0");

}


