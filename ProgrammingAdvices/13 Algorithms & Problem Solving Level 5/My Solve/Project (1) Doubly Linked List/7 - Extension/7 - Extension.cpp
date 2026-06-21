
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

    MyDblLinkedList.UpdateItem(2, 500);

    cout << "\nAfter Updating Item(2): \n";
    MyDblLinkedList.PrintList();


    system("pause>0");
    return 0;

}

