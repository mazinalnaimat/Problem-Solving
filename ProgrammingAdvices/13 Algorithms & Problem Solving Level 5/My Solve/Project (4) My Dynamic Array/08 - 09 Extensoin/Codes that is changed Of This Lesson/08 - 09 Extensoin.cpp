

#include <iostream>
#include "clsDynamicArray.h"

using namespace std;

int main()
{

    clsDynamicArray <int> MyDynamicArray(5);

    MyDynamicArray.SetItem(0, 10);
    MyDynamicArray.SetItem(1, 20);
    MyDynamicArray.SetItem(2, 30);
    MyDynamicArray.SetItem(3, 40);
    MyDynamicArray.SetItem(4, 50);

    cout << "\nIs Empty?  " << MyDynamicArray.IsEmpty();
    cout << "\nArray Size: " << MyDynamicArray.Size() << "\n";
    cout << "\nArray Items: \n";

    MyDynamicArray.PrintList();

    int Index = MyDynamicArray.Find(30);

    if (Index == -1)
        cout << "\nItwm was not found :-(\n";
    else
        cout << "\nItem is found at index: "<< Index << "\n";

    MyDynamicArray.DeleteItem(30);
    cout << "\nArray Size: " << MyDynamicArray.Size() ;
    cout << "\nArray Items After deleting 30: " << "\n";
    MyDynamicArray.PrintList();

    system("pause>0");
    return 0;

}