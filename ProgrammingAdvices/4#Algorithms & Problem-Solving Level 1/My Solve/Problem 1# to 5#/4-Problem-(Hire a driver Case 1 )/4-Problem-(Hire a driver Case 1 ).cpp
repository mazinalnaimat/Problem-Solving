
#include <iostream>
using namespace std;

enum enDriverLicense {Yes = 1,No  = 2 };
enum enIsHired { Hired = 1, Rejected = 2 };

int ReadAge()
{
	int Age;
	do
	{
		cout << "Enter your Age:" << endl;
		cin >> Age;
	} while (Age <= 0);
	return Age;
}

enDriverLicense HaveDriverLicense()
{
	string driverLicense;
	do {
		cout << "Have you a driver license:";
		cin >> driverLicense;
	} while (driverLicense != "Yes" && driverLicense != "No");
	if (driverLicense == "Yes")
		return enDriverLicense::Yes;
	else
		return enDriverLicense::No;
}

enIsHired HasLicenseAndAge(enDriverLicense HasDriverLicense, int Age)
{
	if (Age > 21 && HaveDriverLicense==1)
		return enIsHired::Hired;
	else
		return enIsHired::Rejected;

}
  
void PrintResult(enIsHired HaveLicenseAndAge)
{
	if (HaveLicenseAndAge == 1)
		cout << "You are Hired";
	else
		cout << "You are Rejected";

}



int main()
{
	PrintResult(HasLicenseAndAge( HaveDriverLicense(),ReadAge()));


	return 0;
}

