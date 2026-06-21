
#include <iostream>
#include <queue>

using namespace std;

int main()
{
	queue <int> quNumbers;
	quNumbers.push(1);
	quNumbers.push(2);
	quNumbers.push(3);
	quNumbers.push(4);
	quNumbers.push(5);
	quNumbers.push(6);
	quNumbers.push(7);
	quNumbers.push(8);
	quNumbers.push(9);
	quNumbers.push(10);

	cout << "\nCount: " <<  quNumbers.size();
	cout << "\nFront: " <<  quNumbers.front();
	cout << "\nBack: " <<  quNumbers.back();

	cout << "\nquNumbers: ";
	while (!quNumbers.empty())
	{
		cout << quNumbers.front() << " ";
		quNumbers.pop();
	}

	system("pause>0");
	return 0;
}

