#include <iostream>
#include <stack>

using namespace std;

int main()
{

	stack <int> stkNumbers;

	stkNumbers.push(10);
	stkNumbers.push(20);
	stkNumbers.push(30);
	stkNumbers.push(40);
	stkNumbers.push(50);


	cout << "Numbers are: \n";

	while(!stkNumbers.empty())
	{
	cout << stkNumbers.top() << "\n";

	stkNumbers.pop();

}
	system("pause>0");
	return  0;
}

