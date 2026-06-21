#pragma once

#include <iostream>
#include "clsDblLinkedList.h"
using namespace std;

template <typename T >class clsMyQueue
{
protected :
	clsDblLinkedList <T> _MyList;


public:

	void push(T newItem)
	{
		_MyList.InsertAtEnd(newItem);
	}

	void pop()
	{
		_MyList.DeleteFirstNode();
	}

	int Size()
	{
		return _MyList.Size();
	}

	bool IsEmpty()
	{
		return _MyList.IsEmpty();
	}

	T front()
	{
		return _MyList.GetItem(0);
	}

	T back()
	{
		return _MyList.GetItem(Size() - 1);
	}

	void Print()
	{
		_MyList.PrintList();
	}



};


