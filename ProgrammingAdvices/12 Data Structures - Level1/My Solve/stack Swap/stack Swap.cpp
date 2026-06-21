


#include <iostream>
#include <stack>
#include <vector>
using namespace std;



int main()
{

	stack <string> stkStudents1;
	stack <string> stkStudents2;

	stkStudents1.push ("Marya");
	stkStudents1.push("Salem");
	stkStudents1.push("Mahmood");
	stkStudents1.push("Esam");
	stkStudents1.push("Muhsen");

	stkStudents2.push("Sarah");
	stkStudents2.push("Osameh");
	stkStudents2.push("Ra'ed");
	stkStudents2.push("Yman");


	//stkStudents1.swap(stkStudents2);

  	cout << "\nStudents1 are: ";

	while (!stkStudents1.empty())
	{
		cout << stkStudents1.top() << " ";

		stkStudents1.pop();

	}


	cout << "\nStudents2 are: ";

	while (!stkStudents2.empty())
	{
		cout << stkStudents2.top() << " ";

		stkStudents2.pop();

	}
	system("pause>0");
	return  0;
}



