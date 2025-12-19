
#include <iostream>
using namespace std;

struct stInfo
{
	string FirstName;
	string LastName;
};

stInfo ReadInfo()
{
	stInfo Info;
	cout << "Enter your first name:"<< endl;
	cin >> Info.FirstName;

	cout << "Enter your first name:" << endl;
	cin >> Info.LastName;
	return Info;
}
string GetFullName(stInfo Info)
{
	string FullName = Info.FirstName +" " + Info.LastName;
	return FullName;
}
void PrintFullName(string FullName)
{
	cout << FullName;
}

int main()
{
  

	PrintFullName(GetFullName(ReadInfo()));








	return 0;
}

