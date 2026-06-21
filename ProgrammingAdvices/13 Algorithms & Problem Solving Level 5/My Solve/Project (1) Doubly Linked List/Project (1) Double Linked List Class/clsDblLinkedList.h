#pragma once


#include <iostream>

using namespace std;

template <typename T>class clsDblLinkedList
{
public:
    class Node {

    public:
        T value;
        Node* next;
        Node* prev;
    };

     Node* head = NULL;


    void InsertAtBeginning( T value)
    {
        Node* NewNode = new Node();
        NewNode->value = value;
        NewNode->next = head;
        NewNode->prev = NULL;

        if (!head == NULL)
            head->prev = NewNode;

        head = NewNode;

    }

    void PrintList()
    {
        Node* current = head;
        while (current != NULL)
        {
            cout << current->value << " ";
            current = current->next;
        }
        cout << "\n";
    }

    //PrintListDerails
    /*
    void PrintListDerails( )
    {
        Node* current = head;
        while (current != NULL)
        {
            if ((current->prev) == NULL)
                cout << "NULL";
            else
                cout << (current->prev)->value;

            cout << " <--> " << current->value << " <--> ";

            if (current->next == NULL)
                cout << "NULL\n";
            else
                cout << (current->next)->value << "\n";
            current = current->next;
        }
    }
    */

    Node* Find(T value)
    {
        Node* current = head;
        while (current != NULL)
        {
            if (current->value == value)
            {
                return current;
            }
            current = current->next;
        }
        return NULL;
    }

    void InsertAfter(Node* current, T value)
    {
        Node* NewNode = new Node();
        NewNode->value = value;
        NewNode->next = current->next;
        NewNode->prev = current;

        if (current->next != NULL)
            current->prev = NewNode;

        current->next = NewNode;
    }

    void InsertAtEnd( T value)
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
            Node* current = head;
            while (current->next != NULL)
            {
                current = current->next;
            }
            current->next = NewNode;
            NewNode->prev = current;
        }
    }

    void DeleteNode( Node*& NodeToDelete)
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

    void DeleteFirstNode()
    {
       //My Solution
      /*  if (head == NULL)
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
        }*/

      //Teacher Solution
        if (head == NULL)
            return;

        Node* temp = head;
        head = head->next;
        if (head != NULL)
            head->prev = NULL;
        delegate temp;
    }

    void DeleteLastNode()
    {
        //My Solutoin
        /*if (head == NULL)
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
        }*/


        //Teacher Solution

        if (head == NULL) {
            return;
        }
        if (head->next == NULL) {
            delete head;
            head = NULL;
            return;
        }
        Node* current = head;
        while (current->next->next != NULL) {
            current = current->next;
        }
        Node* temp = current->next;
        current->next = NULL;
        delete temp;
    }

};

