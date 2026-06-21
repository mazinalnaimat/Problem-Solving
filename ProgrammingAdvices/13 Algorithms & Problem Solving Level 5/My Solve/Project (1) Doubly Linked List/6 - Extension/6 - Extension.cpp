
#include <iostream>
#include "clsDblLinkedList.h"

using namespace std;

int main()
{
    clsDblLinkedList <int> MyDblLinkedList;

  
   MyDblLinkedList.InsertAtBeginning( 5);
   MyDblLinkedList.InsertAtBeginning( 4);
   MyDblLinkedList.InsertAtBeginning( 3);
   MyDblLinkedList.InsertAtBeginning( 2);
   MyDblLinkedList.InsertAtBeginning( 1);


    cout << "\nLinked List Content:\n";
    MyDblLinkedList.PrintList();


    cout << "\nItem(2) value is: " << MyDblLinkedList.GetItem(8);

    system("pause>0");
    return 0;

}

