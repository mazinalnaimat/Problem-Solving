
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

            Matrix[i][j] = RandomNumbere(1, 10);
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

short CountNumberInMatrix(int Matrix[3][3], int Number, short Rows, short Cols)
{
    short Count = 0;
    for (short i = 0; i < Rows; i++)
    {
        for (short j = 0; j < Cols; j++)
        {

            if (Matrix[i][j] == Number)
            {
                Count++;
            }
        }
    }
    return Count;
}

bool IsMatrixSparse(int Matrix[3][3], short Rows, short Cols)
{
    short MatrixSize = Rows * Cols;

    return (CountNumberInMatrix(Matrix, 0, 3, 3) > MatrixSize/2);
}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3] = { {0,0,0 }, {0, 1, 1} ,{ 2, 3, 1} };
    
 
    //FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    if (IsMatrixSparse(Matrix1, 3, 3))
    {
        cout << "\nYes: IT is Sparse";
    }
    else
        cout << "\nNo: IT is  Not Sparse";


    system("pause>0");

   

}


