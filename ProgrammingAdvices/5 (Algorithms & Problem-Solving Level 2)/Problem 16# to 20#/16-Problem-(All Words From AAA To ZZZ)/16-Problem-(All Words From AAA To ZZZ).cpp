#include <iostream>
using namespace std;


void PrintFromAAA_To_ZZZ()
{
	int a = 0;
	for (int i = 65; i <=90; i++)
	{
	
		for (int j = 65; j <=90; j++)
		{
		
			for (int k = 65; k <=90; k++)
			{
			
				
					cout << a << ": ";
					cout << (char)i;
					cout << (char)j;
					cout << (char)k;
				
					cout << endl;
				
			} 
		} 
	} 

}

int main()
{
	PrintFromAAA_To_ZZZ();


   return 0;
}

