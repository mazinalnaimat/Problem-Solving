#include <iostream>
#include <string>
using namespace std;

struct stTaskDuration
{
	int  NumberDays, NumberHours, NumberMunites, NumberSeconds;

};

float ReadPositiveNumber(string Message)
{
	float  Number = 0;
	do
	{
		cout << Message << endl;
		cin >> Number;
	} while (Number <= 0);
	return Number;
}

stTaskDuration ReadTaskDuration()
{
	stTaskDuration  TaskDuration;
	TaskDuration.NumberDays = ReadPositiveNumber("Enter The Days");
	TaskDuration.NumberHours = ReadPositiveNumber("Enter The Hours");
	TaskDuration.NumberMunites = ReadPositiveNumber("Enter The Minutes");
	TaskDuration.NumberSeconds = ReadPositiveNumber("Enter The Seconds");
	return TaskDuration;
}

int TaskDuratoinInSeconds(stTaskDuration TaskDuration)
{
	return TaskDuration.NumberDays * 24 * 3600 + TaskDuration.NumberHours *3600
		+ TaskDuration.NumberMunites * 60 + TaskDuration.NumberSeconds;
}


int main()
{
	cout << "\nTask Duration In Seconds: " << TaskDuratoinInSeconds(ReadTaskDuration());
	cout << endl;

	return 0;
}

