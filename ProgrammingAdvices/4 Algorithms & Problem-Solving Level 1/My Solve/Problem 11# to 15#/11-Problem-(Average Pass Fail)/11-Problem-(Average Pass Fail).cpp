
#include <iostream>
using namespace std;

enum enPassFail { Pass = 1, Fail = 2};

void ReadNumbers(int& Mark1 ,int& Mark2, int& Mark3)
{


    do
    {
        if (Mark1 > 100 || Mark1 < 0)
        {
            cout << "The Mark must less than or equal 100 " << endl;
        }
    
        std::cout << "Enter the First Mark:" << endl;
        cin >> Mark1;
    } while (Mark1 >100 || Mark1 <0);


    do
    {
        if (Mark2 > 100 || Mark2 < 0)
        {
            cout << "The Mark must less than or equal 100 " << endl;
        }
        std::cout << "Enter the Second  Mark:" << endl;
        cin >> Mark2;
    } while (Mark2 > 100 || Mark2 < 0);


    do
    {
        if (Mark3 > 100 || Mark3 < 0)
        {
            cout << "The Mark must less than or equal 100 " << endl;
        }

        std::cout << "Enter the Third Mark:" << endl;
        cin >> Mark3;
    } while (Mark3 > 100 || Mark3 < 0);

}
int SumOf3Marks(int Mark1, int Mark2, int Mark3)
{
    return Mark1 + Mark2 + Mark3;
}
float AverageOfMarks(int Mark1, int Mark2, int Mark3)
{
    return SumOf3Marks(Mark1, Mark2, Mark3)/3;
}
enPassFail CheckAverage(float Average)
{
    if (Average >= 50)
        return  enPassFail::Pass;
    else
        return  enPassFail::Fail;
  
}
void PrintRusults(float Average)
{
    if (CheckAverage(Average) == enPassFail::Pass)
        cout << "You are Passed" << endl;
    else
        cout << "You are Failed" << endl;
}




int main()
{
    int Mark1 = 0, Mark2 = 0, Mark3 = 0;
    ReadNumbers(Mark1, Mark2, Mark3);
    PrintRusults(AverageOfMarks(Mark1, Mark2, Mark3));
}

