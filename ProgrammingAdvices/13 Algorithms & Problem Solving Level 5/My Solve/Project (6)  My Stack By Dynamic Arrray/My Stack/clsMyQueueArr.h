#pragma once

#include <iostream>
#include "clsDynamicArray.h"
using namespace std;

template <typename T >class clsMyQueueArr
{
protected :
	clsDynamicArray <T> _MyList;


public:

	void push(T newItem)
	{
		_MyList.InsertAtEnd(newItem);
	}

	void pop()
	{
		_MyList.DeleteFirstItem();
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

	T GetItem(int index)
	{
		return _MyList.GetItem(index);
	}

	void Reverse()
	{
		_MyList.Reverse();
	}

	void UpdateItem(int index, T value)
	{
		_MyList.SetItem(index, value);
	}

	void InsertAfter(int index, T value)
	{
		_MyList.InsertAfter(index, value);
	}

	void InsertAtFront( T value)
	{
		_MyList.InsertAtBeginning(value);
	}

	void InsertAtBack( T value)
	{
		_MyList.InsertAtEnd( value);
	}

	void Clear()
	{
		_MyList.Clear();
	}



};


