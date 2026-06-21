
#include <iostream>

using namespace std;


int  RandomNumbere(int From, int To)
{
    int randNum = rand() % (To - From + 1) + From;
    return randNum;
}

void FillMatrixWithRandomNumbers(int  Matrix[3][3], short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {

            Matrix[i][j] = RandomNumbere(-100, 100);
        }
    }

}

void PrintMatrix(int  Matrix[3][3], short Rows, short Cols)
{


    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            printf("%0*d", 1, Matrix[i][j]);
            cout << "\t";
        }
        cout << endl;
    }

}

int MinNumberInMatrix(int Matrix1[3][3], short Rows, short Cols)
{
    int MinNumber = Matrix1[0][0];
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            if (MinNumber < Matrix1[i][j])
            {
                MinNumber = Matrix1[i][j];
            }
        }
    }
    return MinNumber;
}

int MaxNumberInMatrix(int Matrix1[3][3], short Rows, short Cols)
{
    int MaxNumber = Matrix1[0][0];
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            if (MaxNumber > Matrix1[i][j])
            {
                MaxNumber = Matrix1[i][j];
            }
        }
    }
    return MaxNumber;
}



int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3];

    //int Matrix1[3][3] = { {1,2,3 }, {4, 5, 6} ,{ 7, 8, 9} };


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    cout << "\nThe Min Number in Matrix: " << MinNumberInMatrix(Matrix1, 3, 3);

    cout << "\nThe Max Number in Matrix: " << MaxNumberInMatrix(Matrix1, 3, 3);







    system("pause>0");



}