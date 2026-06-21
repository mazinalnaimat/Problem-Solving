#pragma once

#include <iostream>
#include "clsDynamicArray.h"
using namespace std;

template <typename T >class clsMyQueueArr
{
protected :
	clsDynamicArray <T> _MyDynamicArray;


public:

	void push(T newItem)
	{
		_MyDynamicArray.InsertAtEnd(newItem);
	}

	void pop()
	{
		_MyDynamicArray.DeleteFirstItem();
	}

	int Size()
	{
		return _MyDynamicArray.Size();
	}

	bool IsEmpty()
	{
		return _MyDynamicArray.IsEmpty();
	}

	T front()
	{
		return _MyDynamicArray.GetItem(0);
	}

	T back()
	{
		return _MyDynamicArray.GetItem(Size() - 1);
	}

	void Print()
	{
		_MyDynamicArray.PrintList();
	}

	T GetItem(int index)
	{
		return _MyDynamicArray.GetItem(index);
	}

	void Reverse()
	{
		_MyDynamicArray.Reverse();
	}

	void UpdateItem(int index, T value)
	{
		_MyDynamicArray.SetItem(index, value);
	}

	void InsertAfter(int index, T value)
	{
		_MyDynamicArray.InsertAfter(index, value);
	}

	void InsertAtFront( T value)
	{
		_MyDynamicArray.InsertAtBeginning(value);
	}

	void InsertAtBack( T value)
	{
		_MyDynamicArray.InsertAtEnd( value);
	}

	void Clear()
	{
		_MyDynamicArray.Clear();
	}



};


