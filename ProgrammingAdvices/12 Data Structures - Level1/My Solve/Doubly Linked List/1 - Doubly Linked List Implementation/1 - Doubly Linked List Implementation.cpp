
#include <iostream>

using namespace std;

class Node {

public:
    int value;
    Node* prev;
    Node* next;
};

int main()
{
    Node* head = NULL;

    Node* NewNode1 = new Node();
    Node* NewNode2 = new Node();
    Node* NewNode3 = new Node();

    NewNode1->value = 1;
    NewNode2->value = 2;
    NewNode3->value = 3;

    NewNode1->next = NewNode2;
    NewNode1->prev = NULL;
    NewNode2->next = NewNode3;
    NewNode2->prev = NewNode1;
    NewNode3->next = NULL;
    NewNode3->prev = NewNode2;

    head = NewNode1;

    Node* current = head;
    cout << endl;
    while (current != NULL)
    {
        cout << current->value << " ";
        current = current->next;
    }


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

