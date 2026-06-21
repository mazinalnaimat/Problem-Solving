
#include <iostream>
using namespace std;


void FillMatrixWithOrederedNumbers(int  arr[3][3], short Rows, short Cols)
{
    short Conter = 0;
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            Conter++;
            arr[i][j] = Conter;
        }
    }

}

void TrasposedMatrix(int  arr[3][3], int arrTrasposed[3][3], short Rows, short Cols)
{
    
    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
           
            arrTrasposed[i][j] = arr[j][i];
        }
    }

}

void PrintMatrix(int  arr[3][3], short Rows, short Cols)
{


    for (int i = 0; i < Rows; i++)
    {
        for (int j = 0; j < Cols; j++)
        {
            cout << arr[i][j] << "\t";
        }
        cout << endl;
    }

}



int main()
{

    int arr[3][3], arrTrasposed[3][3];


    FillMatrixWithOrederedNumbers(arr, 3, 3);
    cout << "\nThe following is a 3x3 ordered matrix:" << "\n";
    PrintMatrix(arr, 3, 3);

    TrasposedMatrix(arr, arrTrasposed, 3, 3);

    cout << "\n\nThe following is a 3x3 trasposed matrix:" << "\n";
    PrintMatrix(arrTrasposed, 3, 3);

    system("pause>0");

}


