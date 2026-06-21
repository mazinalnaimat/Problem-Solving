#pragma once


#include <iostream>
#include "clsMyQueueArr.h"

using namespace std;

template <typename T> class clsMyStackArr : public clsMyQueueArr <T>
{

public:

	void push(T newItem)
	{
		clsMyQueueArr<T>::_MyList.InsertAtBeginning(newItem);
	}

	T Top()
	{
		return clsMyQueueArr<T>::front();
	}

	T Bottom()
	{
		return clsMyQueueArr<T>::back();
	}



};