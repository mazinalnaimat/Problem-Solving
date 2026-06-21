
#include <iostream>

using namespace std;

class Node {

public:
    int value;
    Node* prev;
    Node* next;
};

Node* Find(Node* head, int value)
{
    while (head != NULL)
    {
        if (head->value == value)
        {
            return head;
        }
        head = head->next;
    }
    return NULL;
}

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

void PrintListFromTheFront(Node* head)
{

    while (head != NULL)
    {
        cout << head->value << " ";
        head = head->next;
    }
}

void PrintListDerails(Node* head)
{
    while (head != NULL)
    {
        if ((head->prev) == NULL)
            cout << "NULL";
        else
            cout << (head->prev)->value;

        cout << " <--> " << head->value << " <--> ";

        if (head->next == NULL)
            cout << "NULL\n";
        else
            cout << (head->next)->value << "\n";
        head = head->next;
    }
}

void InsertAfter(Node* current, int value)
{


    Node* NewNode = new Node();
    NewNode->value = value;
    NewNode->next = current->next;
    NewNode->prev = current;

    if (current->next != NULL)
        current->prev = NewNode;

    current->next = NewNode;

}

void InsertAtEnd(Node* head, int value)
{

    Node* NewNode = new Node();
    NewNode->value = value;
    NewNode->next = NULL;

    if (head == NULL)
    {
        NewNode->prev = NULL;
        head = NewNode;
    }
    else
    {
        Node* LastNode = head;
        while (LastNode->next != NULL)
        {
            LastNode = LastNode->next;
        }
        LastNode->next = NewNode;
        NewNode->prev = LastNode;
    }
}

void Delete(Node*& head, Node*& NodeToDelete)
{

    if (head == NULL || NodeToDelete == NULL)
        return;
    if (head == NodeToDelete)
        head = NodeToDelete->next;

    if (NodeToDelete->next != NULL)
        (NodeToDelete->next)->prev = NodeToDelete->prev;

    if (NodeToDelete->next != NULL)
        (NodeToDelete->prev)->next = NodeToDelete->next;

    delete NodeToDelete;



}

void DeleteFirst(Node*& head)
{

    if (head == NULL)
        return;

    if (head->next == NULL)
    {
        head = NULL;
    }
    else
    {
        Node* temp = head;
        (head->next)->prev = NULL;
        head = head->next;
        delete temp;
    }

}

void DeleteLast(Node*& head)
{

    if (head == NULL)
        return;

    if (head->next == NULL)
    {
        delete head;
        head = NULL;
    }
    else
    {
        Node* current = head;
        while (current->next != NULL)
        {
            current = current->next;
        }
        
        (current->prev)->next = NULL;

        delete current;
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


    cout << "\n\n";
    PrintListDerails(head);

    Node* N1 = Find(head, 3);


    DeleteLast(head);
    cout << "\n\n";
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

