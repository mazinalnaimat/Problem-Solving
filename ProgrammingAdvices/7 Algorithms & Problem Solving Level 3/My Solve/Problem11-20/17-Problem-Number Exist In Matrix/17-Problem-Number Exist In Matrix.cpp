
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

            Matrix[i][j] = RandomNumbere(1, 100);
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

bool IsNumberInMatrix(int Matrix[3][3], int Number, short Rows, short Cols)
{

    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            if (Matrix[i][j] == Number)
            {
                return 1;
            }
        }
    }
    return 0;
}


int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3];
    //int Matrix1[3][3] = { {0,0,0 }, {0, 1, 1} ,{ 2, 3, 1} };


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    int Number = 0;
    cout << "\nPLease Enter The Number To lock for  In Matrix? ";
    cin >> Number;

    if (IsNumberInMatrix(Matrix1, Number, 3, 3))
    {
        cout << "\nYes it is there\n";
    }
    else
        cout << "\nNo it is NOT there\n";


    system("pause>0");



}


