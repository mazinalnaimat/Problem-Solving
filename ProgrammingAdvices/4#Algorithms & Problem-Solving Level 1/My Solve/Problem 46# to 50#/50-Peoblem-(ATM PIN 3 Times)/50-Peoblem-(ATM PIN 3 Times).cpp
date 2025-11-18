
#include <iostream>
using namespace std;

string ReadPinCode()
{
	string PinCode;
	cout << "Please Enter The Pin Code" << endl;
	cin >> PinCode;
	return PinCode;
}

bool Login()
{
	string PinCode;
	int Counter = 3;
	   
		do
		{
			PinCode = ReadPinCode();

			if (PinCode == "1234")
			{
				return 1;
			}
			else
			{
				Counter--;
				cout << "\nWrong PIN, you have "<< Counter<<" more tries\n";
				system("color 4F");				
			}
		} while (PinCode != "1234" && Counter >=1);
		return 0;
	
}



int main()
{
	if (Login())
	{
		system("color 2F");
		cout << "\nYour Account Balance Is " << 7500 << "\n";
	}
	else
	{
		cout << "\nYour card blocked call the bank for help. \n";
	}
	return 0;
}
