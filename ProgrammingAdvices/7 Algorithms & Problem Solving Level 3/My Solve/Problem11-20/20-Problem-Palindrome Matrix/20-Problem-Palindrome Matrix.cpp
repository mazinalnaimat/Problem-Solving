
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

bool IsPalindromeMatrix(int Matrix1[3][3], short Rows, short Cols)
{
    if (Cols % 2 == 0)
    {
        for (int i = 0; i < Rows; i++)
        {
            for (int j = 0; j < Cols/2; j++)
            {
                if (Matrix1 [i][j] != Matrix1[i][Cols-j-1])
                {
                    return 0;
                }

            }
        }
    }

    if (Cols % 2 != 0)
    {
        for (int i = 0; i < Rows; i++)
        {
            for (int j = 0; j < Cols / 2; j++)
            {
                if (Matrix1[i][j] != Matrix1[i][Cols - j - 1])
                {
                    return 0;
                }

            }
        }
    }
    return 1;
}





int main()
{
    srand((unsigned)time(NULL));

    //int Matrix1[3][3];

    int Matrix1[3][3] = { {1,2,1 }, {4, 5, 4} ,{ 7, 8, 3} };

   // int Matrix1[3][3] = { {1,2,1 }, {4, 5, 4} ,{ 7, 8, 3} };


    //FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);


    if (IsPalindromeMatrix(Matrix1, 3, 3))
    {
        cout <<"\nYes: Matrix is Palindrome";
    }
    else

      cout << "\nNO: Matrix is NOT Palindrome";


    system("pause>0");



}