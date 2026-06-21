
#include <iostream>

using namespace std;

class Node
{
public:

    int value;
    Node* next;
};

void InsertAtBegninning(Node*& head, int value)
{
    Node* NewNode = new Node();
    NewNode->value = value;
    NewNode->next = head;
    head = NewNode;

}

void InsertAtEnd(Node*& head, int value)
{
    Node* NewNode = new Node();

    NewNode->value = value;
    NewNode->next = NULL;

    if (head == NULL)
    {
        head = NewNode;
    }
    else
    {
        Node* LastHead= head;
        while (LastHead->next != NULL)
        {
            LastHead = LastHead->next;
        }

        LastHead->next = NewNode;
    }
}


Node* Find(Node* head, int value)
{
    while (head != NULL)
    {
        if (head->value == value)
            return head;

        head = head->next;
    }
    return NULL;
}

void InsetAfter(Node* prevNode, int newValue)
{
    if (prevNode != NULL)
    {

        Node* NewNode = new Node();
        NewNode->value = newValue;
        NewNode->next = prevNode->next;
        prevNode->next = NewNode;
    }
    else
        cout << "\nThe given previous node can not br NULL\n";
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

    InsertAtEnd(head, 1);
    InsertAtEnd(head, 2);
    InsertAtEnd(head, 3);
    InsertAtBegninning(head, 0);

    PrintList(head);

   /* Node* N1 = Find(head, 2);

    InsetAfter(N1, 500);

    cout << endl;
    PrintList(head);*/

    InsertAtEnd(head, 500);

    cout << endl;
    PrintList(head);

    system("pause>0");
    return 0;
}

