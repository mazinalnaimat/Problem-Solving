#include <iostream>
using namespace std;

int  RandomNumbere(int From, int To)
{
    int randNum  = rand() % (To - From +1) +From;
  
    return randNum;
}


int main()
{
    srand((unsigned)time(NULL)); // هذا الأمر يكتب لكي لايكرر الرقم العشوائي نفسه و يجب أن يكون في الماين

    cout << RandomNumbere(1,10) << endl;
    cout << RandomNumbere(1, 10) << endl;
    cout << RandomNumbere(1, 10) << endl;


    return 0;
}

