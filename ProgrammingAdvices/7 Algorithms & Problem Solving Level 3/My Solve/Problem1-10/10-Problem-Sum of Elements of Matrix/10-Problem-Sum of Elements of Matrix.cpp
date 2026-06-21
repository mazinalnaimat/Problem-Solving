
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

            SumOfElements +=arr[i][j] ;
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

}





int main()
{
    srand((unsigned)time(NULL));

    int Matrix1[3][3];


    FillMatrixWithRandomNumbers(Matrix1, 3, 3);
    cout << "\nMatrix1:" << "\n";
    PrintMatrix(Matrix1, 3, 3);


    cout << "\nSum of Matrix1 is: " << SumOfElementsOfMatix(Matrix1, 3, 3) << endl;
   

    system("pause>0");

}


