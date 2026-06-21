
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

void IntersectedNumbersInMatreces(int Matrix1[3][3], int Matrix2[3][3], int IntersecNum[10], int &Count, short Rows, short Cols)
{
     Count = 0;
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            if (IsNumberInMatrix(Matrix1,Matrix2[i][j], 3, 3))
            {
                IntersecNum[Count] = Matrix2[i][j];
                Count++;
            }
        }
    }
}


int main()
{
    srand((unsigned)time(NULL));

        int IntersecNum[10],  Count;

    int Matrix1[3][3] = { {1,2,3 }, {4, 5, 6} ,{ 7, 8, 9} };

    int Matrix2[3][3] = { {1,2,3 }, {4, 5, 6} ,{ 7, 8, 9} };

    //FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

   // FillMatrixWithRandomNumbers(Matrix2, 3, 3);
    cout << "\nMatrix2:" << "\n";
    PrintMatrix(Matrix2, 3, 3);

    IntersectedNumbersInMatreces(Matrix1, Matrix2, IntersecNum, Count, 3, 3);

    cout << "\nIntersected Numbers are:\n";

    for (int i = 0; i <= Count-1; i++)
    {
        cout << IntersecNum [i] << "\t";
    }

    cout << endl;

    system("pause>0");



}

/*

The solve of Teacher

#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

void PrintMatrix(int arr[3][3], short Rows, short Cols)
{
    for (short i = 0; i < Rows; i++)
     {
     for (short j = 0; j < Cols; j++)
     {
     //printf(" %0*d ", 2, arr[i][j]);
     cout << setw(3) << arr[i][j] << " ";
     }
     cout << "\n";
     }
}

bool IsNumberInMatrix(int Matrix1[3][3], int Number, short Rows,short Cols)
{
    short NumberCount = 0;
    for (short i = 0; i < Rows; i++)
     {
     for (short j = 0; j < Cols; j++)
     {
     if (Matrix1[i][j] == Number)
     {
     return true;
     };
     }
     }
    return false;
    }

void PrintIntersectedNumbers(int Matrix1[3][3], int Matrix2[3][3],short Rows, short Cols)
{
    int Number;
    for (short i = 0; i < Rows; i++)
     {
     for (short j = 0; j < Cols; j++)
     {
     Number = Matrix1[i][j];
     if (IsNumberInMatrix(Matrix2, Number, Rows, Cols))
     {
     cout << setw(3) << Number << " ";
     }
     }
     }
}


int main()
{
int Matrix1[3][3] = { {77,5,12},{22,20,1},{1,0,9} };
int Matrix2[3][3] = { {5,80,90},{22,77,1},{10,8,33} };

 cout << "\nMatrix1:\n";
 PrintMatrix(Matrix1, 3, 3);

 cout << "\nMatrix2:\n";
 PrintMatrix(Matrix2, 3, 3);

 cout << "\nIntersected Numbers are: \n\n";

 PrintIntersectedNumbers(Matrix1, Matrix2, 3, 3);

 system("pause>0");
}
} */


