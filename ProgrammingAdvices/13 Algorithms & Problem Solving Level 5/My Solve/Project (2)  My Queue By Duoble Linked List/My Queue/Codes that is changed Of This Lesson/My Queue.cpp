// My Queue.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "clsMyQueue.h"
using namespace std;

int main()
{
	clsMyQueue <int> MyQueue;


	MyQueue.push(10);
	MyQueue.push(20);
	MyQueue.push(30);
	MyQueue.push(40);
	MyQueue.push(50);

	cout << "\nQueue: \n";
	MyQueue.Print();

	cout << "\nQueu Size   : " << MyQueue.Size();
	cout << "\nQueue Front : " << MyQueue.front();
	cout << "\nQueue Back  : " << MyQueue.back();
	
	MyQueue.pop();

	cout << "\n\nQueue after pop() : \n";
	MyQueue.Print();

	system("pause>0");
	return 0;

}
