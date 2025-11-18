
#include <iostream>
using namespace std;

string ReadPinCode()
{
	string PinCode;
	cout << "Please Enter The Pin Code?" << endl;
	cin >> PinCode;
	return PinCode;
}

bool Login()
{
	string PinCode;

	do
	{
		PinCode = ReadPinCode();

		if (PinCode == "1324")
		{
			return 1;
		}
		else
		{
			cout << "\nWrong PIN\n";
			system("color 4F");
		}
	} while (PinCode != "1234");

}



int main()
{
	if (Login())
	{
		system("color 2F");
		cout << "\Your Account Balance Is " << 7500 << "\n";
	}
	return 0;
}
