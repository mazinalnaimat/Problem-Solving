
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

    InsertAtBegninning(head, 1);
    InsertAtBegninning(head, 2);
    InsertAtBegninning(head, 3);
    InsertAtBegninning(head, 4);
    InsertAtBegninning(head, 5);

    PrintList(head);

    Node* N1 = Find(head, 2);

    InsetAfter( N1, 500);

    cout << endl;
    PrintList(head);

    system("pause>0");
    return 0;
}

