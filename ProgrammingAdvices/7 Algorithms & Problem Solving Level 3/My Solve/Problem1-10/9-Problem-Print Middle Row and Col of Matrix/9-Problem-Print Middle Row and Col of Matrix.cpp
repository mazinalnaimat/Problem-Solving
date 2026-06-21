
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

            arr[i][j] = RandomNumbere(1, 10);
        }
    }

}

void MiddleRowOfMatrix(int Matrix[3][3],int arrMiddleRow[3], short Rows, short Cols)
{
    for (int i = 0; i < Cols; i++)
    {   
        short middleRow = (Rows / 2);
        arrMiddleRow[i] = Matrix[middleRow][i];
    }
}

void MiddleColOfMatrix(int Matrix[3][3], int arrMiddleCol[3], short Rows, short Cols)
{
        for (int i = 0; i < Rows; i++)
    {   
        short middleCol = (Cols / 2);
        arrMiddleCol[i] = Matrix[i][middleCol];
    }
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

}

void PrintArray(int  arr[3], short NumOfElemnets)
{


    for (int i = 0; i < NumOfElemnets; i++)
    {
        
            printf("%0*d", 2, arr[i]);
            cout << "\t";
       
       
    }

}



int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3], arrMiddleRow[3], arrMiddleCol[3];


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);

    MiddleRowOfMatrix(Matrix1, arrMiddleRow, 3, 3);
    cout << "\nMiddle Row of Matrix1 is:" << "\n";
    PrintArray(arrMiddleRow, 3);

    MiddleColOfMatrix(Matrix1, arrMiddleCol, 3, 3);
    cout << "\n\nMiddle Col of Matrix1 is:" << "\n";
    PrintArray(arrMiddleCol, 3);

    system("pause>0");

}


