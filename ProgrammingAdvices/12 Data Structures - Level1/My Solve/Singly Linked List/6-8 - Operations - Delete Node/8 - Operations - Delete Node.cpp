
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
        Node* LastHead = head;
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

void DeleteFirst(Node*& head)
{
    if (head == NULL)
    {
        cout << "The Linked List is empty!!!";
        return;
    }
    Node* current = head;
    head = current->next;
        delete current;
}

void DeleteLast(Node*& head)
{
    if (head == NULL)
    {
        cout << "The Linked List is empty!!!";
        return;
    }

    Node *current = head;
    if (current->next == NULL)
    {
        head = NULL;
        delete current;
        return;
    }

    Node* previous = head;
    while (current->next != NULL)
    {
        previous = current;
        current = current->next;
    }
    previous->next = current->next;
    delete current;

}

void Delete(Node*& head, int value)
{

    Node* current = head;
    if (head == NULL)
    {
        cout << "The Linked List is empty!!!";
        return;
    }
    if (current->value == value)
    {
        DeleteFirst(head);
    }

    else
    {
        if (current->next == NULL)
        {
            cout << "\n The vlaue is not found!!!\n";
            return;
        }

        Node* previous = current;
        while (current->value != value && current != NULL)
        {
            previous = current;
            current = current->next;
        }
        if (current == NULL)
        {       cout << "\n The vlaue is not found!!!\n";
        delete current;
        delete previous;
           return;
         }
        previous->next = current->next;
        delete current;
    }
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

    InsertAtEnd(head, 0);
    InsertAtEnd(head, 5);
    InsertAtEnd(head, 10);
    InsertAtBegninning(head, 9);
    InsertAtEnd(head, 4);
    InsertAtBegninning(head, 3);

    PrintList(head);

    Delete(head, 0);
    cout << endl << "1: ";
    PrintList(head);

    DeleteLast(head);
    cout << endl << "2: ";
    PrintList(head);

    DeleteFirst(head);
    cout << endl << "3: ";
    PrintList(head);

    
    system("pause>0");
    return 0;
}

