#include <iostream>
using namespace std;

struct strTaskDuration 
{
    int NumberOfDays;
    int NumberOfHours;
    int NumberOfMinutes;
    int NumberOfSeconds;
   
};

int ReadPositiveNumber(string Message)
{
    int Number = 0;
    do
    {
        cout << Message << endl;
        cin >> Number;
    } while (Number <= 0);
    return Number;
}

strTaskDuration SecondsToTaskDuration(int TotalSeconds)
{
    strTaskDuration  TaskDuration;
    TaskDuration.NumberOfDays = TotalSeconds / (24 * 3600);
    TaskDuration.NumberOfHours = (TotalSeconds % (24 * 3600)) / (3600);
    TaskDuration.NumberOfMinutes = ((TotalSeconds % (24 * 3600)) % (3600)) / 60;
    TaskDuration.NumberOfSeconds = (((TotalSeconds % (24 * 3600)) % (3600)) % 60);

    return TaskDuration;
}

void PrintTaskDurationDetails(strTaskDuration TaskDuration)
{
    cout << "\n" << TaskDuration.NumberOfDays << ":" << TaskDuration.NumberOfHours << ":"
        << TaskDuration.NumberOfMinutes << ":" << TaskDuration.NumberOfSeconds << endl;
}



int main()
{
    
    PrintTaskDurationDetails(SecondsToTaskDuration(ReadPositiveNumber("Please Enter The Total Number Of Seconds?")));




    return 0;
}

