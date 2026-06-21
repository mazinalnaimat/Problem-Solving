
#include <iostream>

using namespace std;

class Node
{
public:

    int value;
    Node* next;

};



void InsertAtBegninning( Node* & head, int value)
{
    Node* NewNode = new Node();
    NewNode->value = value;
    NewNode->next = head;
    head = NewNode;

}

void PrintList(Node* head)
{
    while (head != NULL)
    {
        cout << head->value << " ";
        head = head->next;
    }
}

int main()
{
    Node* head = NULL;

    InsertAtBegninning(head, 1);
    InsertAtBegninning(head, 2);
    InsertAtBegninning(head, 3);
    InsertAtBegninning(head, 4);
    InsertAtBegninning(head, 5);

    PrintList(head);
    system("pause>0");
    return 0;
}

