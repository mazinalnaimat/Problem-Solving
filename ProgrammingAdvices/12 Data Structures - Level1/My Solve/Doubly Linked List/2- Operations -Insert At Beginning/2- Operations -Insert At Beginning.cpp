
#include <iostream>

using namespace std;

class Node {

public:
    int value;
    Node* prev;
    Node* next;
};

void InsertAtBeginning(Node*& head, int value)
{
    Node* NewNode = new Node();
    NewNode->value = value;
    NewNode->next = head;
    NewNode->prev = NULL;

    if (!head == NULL)
      head->prev = NewNode;

       head = NewNode;
   
}

void PrintListFromTheFront(Node * head)
{

    while (head != NULL)
    {
        cout << head->value << " ";
        head = head->next;
    }
}

void PrintListDerails(Node * head)
{
    while (head != NULL)
    {
        if ((head->prev) == NULL)
            cout << "NULL";
        else
            cout <<(head->prev)->value;

        cout << " <--> " << head->value << " <--> ";

        if (head->next == NULL)
            cout << "NULL\n";
        else
            cout << (head->next)->value << "\n";
        head = head->next;
    }
}

int main()
{
    Node* head = NULL;

    InsertAtBeginning(head, 5);
    InsertAtBeginning(head, 4);
    InsertAtBeginning(head, 3);
    InsertAtBeginning(head, 2);
    InsertAtBeginning(head, 1);

    PrintListFromTheFront(head);

    cout << "\n\n";
    PrintListDerails(head);
  

    //Reverse Print
    /*
    current = head;
    Node* previuos =  new Node;
    while (current->next != NULL)
    {
           current = current->next;
    }
    previuos = current;

    cout << endl;

    while (previuos != NULL)
    {
        cout  << previuos->value << " ";
        previuos = previuos->prev;
    }
    */


    system("pause>0");
    return 0;

}

