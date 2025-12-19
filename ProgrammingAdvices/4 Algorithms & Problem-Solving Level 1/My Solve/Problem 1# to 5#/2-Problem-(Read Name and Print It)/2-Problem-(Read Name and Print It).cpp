

#include <iostream>
using namespace std;

string ReadName()
{
	string Name;
	cout << "Your name is: ";
	cin >> Name;
	return Name;
}
void PrintName(string Name)
{
	cout << "Your naem is " << Name;
}



int main()
{
	PrintName(ReadName());
}

