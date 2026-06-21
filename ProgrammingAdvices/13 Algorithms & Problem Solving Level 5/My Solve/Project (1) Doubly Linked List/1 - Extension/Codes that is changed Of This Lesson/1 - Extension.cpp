
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

   
    cout << "\nNumber of items in the linked list = " << MyDblLinkedList.Size() << "\n";
   
    MyDblLinkedList.InsertAtEnd(9);
    MyDblLinkedList.InsertAtEnd(7);
    MyDblLinkedList.InsertAtEnd(8);
    cout << "\nNumber of items in the linked list = " << MyDblLinkedList.Size() << "\n";

    MyDblLinkedList.DeleteLastNode();
    MyDblLinkedList.DeleteLastNode();
    MyDblLinkedList.DeleteLastNode();
    cout << "\nNumber of items in the linked list = " << MyDblLinkedList.Size() << "\n";


    MyDblLinkedList.DeleteFirstNode();
    MyDblLinkedList.DeleteFirstNode();
    MyDblLinkedList.DeleteFirstNode();
    cout << "\nNumber of items in the linked list = " << MyDblLinkedList.Size() << "\n";

    MyDblLinkedList.DeleteLastNode();
    MyDblLinkedList.DeleteLastNode();
    cout << "\nNumber of items in the linked list = " << MyDblLinkedList.Size() << "\n";


    system("pause>0");
    return 0;

}

