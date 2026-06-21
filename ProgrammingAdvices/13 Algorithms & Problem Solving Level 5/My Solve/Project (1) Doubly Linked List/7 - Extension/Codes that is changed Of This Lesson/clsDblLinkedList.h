#pragma once


#include <iostream>

using namespace std;

template <typename T>class clsDblLinkedList
{
protected:
    int _Size;
public:
    class Node {

    public:
        T value;
        Node* next;
        Node* prev;
    };

    Node* head = NULL;


    void InsertAtBeginning(T value)
    {
        Node* NewNode = new Node();
        NewNode->value = value;
        NewNode->next = head;
        NewNode->prev = NULL;

        if (!head == NULL)
            head->prev = NewNode;

        head = NewNode;
        _Size++;
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
        _Size++;
    }

    void InsertAtEnd(T value)
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
        _Size++;
    }

    void DeleteNode(Node*& NodeToDelete)
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
        _Size--;
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
        delete temp;
        _Size--;
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
            _Size--;
            return;
        }
        Node* current = head;
        while (current->next->next != NULL) {
            current = current->next;
        }
        Node* temp = current->next;
        current->next = NULL;
        _Size--;
        delete temp;
    }

    int  Size()
    {
        return _Size;
    }

    bool IsEmpty()
    {
        return (_Size == 0);
    }

    void Clear()
    {
        //My Solve
        /*
        _Size = 0;
        delete head;
        head = NULL;
        */

        //Teacher Solve

        while (_Size > 0)
        {
            DeleteFirstNode();
        }
    }

    void Reverse()
    {
        Node* current = head;
        Node* temp = nullptr;
        while (current != nullptr)
        {
            temp = current->prev;
            current->prev = current->next;
            current->next = temp;
            current = current->prev;
        }

        if (temp != nullptr)
            head = temp->prev;

    }

    Node* GetNode(int index)
    {
        int counter = 0;
        if (index > _Size - 1 || index < 0)
            return NULL;
        Node * current = head;
        while (counter < index)
        {
            counter++;
            current = current->next;
        }
        return current;
    }

    T GetItem(int index)
    {
        Node* ItemNode = GetNode(index);
        if (ItemNode == NULL)
             return NULL;     
        else
            return (ItemNode->value);
    }

    bool UpdateItem(int index, T NewValue)
    {
        Node* ItemNode = GetNode(index);
        if (ItemNode != NULL)
        {  
            ItemNode->value = NewValue;
             return true;
         }
        else
        {
            return false;
        }
    }
};

