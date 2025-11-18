
#include <iostream>
using namespace std;

struct stInfo
{
	int Age;
	bool HasDrivingLicense;
	bool HasRecommendation;

};
stInfo ReadInfo()
{
	stInfo Info;
	cout << "Please Enter  your age?" << endl;
	cin >> Info.Age;

	cout << "Do you have driving license?" << endl;
	cin >> Info.HasDrivingLicense;

	cout << "Do you have recommendation?" << endl;
	cin >> Info.HasRecommendation;

	return Info;
}
bool IsAccepted(stInfo Info)
{
	return ((Info.Age > 21 && Info.HasDrivingLicense) || Info.HasRecommendation);
};
void PrintResult(stInfo Info)
{
	if (IsAccepted(Info))
		cout << "\n Hired" << endl;
	else
		cout << "\n Rejected" << endl;
}


int main()
{


	PrintResult((ReadInfo()));
	return 0;
}

