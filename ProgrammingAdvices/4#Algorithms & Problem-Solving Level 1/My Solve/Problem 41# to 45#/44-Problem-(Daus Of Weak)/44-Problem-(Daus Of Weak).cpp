#include <iostream>
using namespace std;

enum enDayOfWeak { Sat = 1, Sun = 2, Mon = 3, Tue = 4, Wed = 5, Thu = 6, Fri = 7 };

int ReadNumberInRange(string Message, int From, int To)
{
	int Number = 0;
	do
	{
		cout << Message <<endl;
		cin >> Number;
	} while (Number < From || Number > To);
	return Number;
}

enDayOfWeak ReadDayOfWeak()
{
	return (enDayOfWeak)ReadNumberInRange("Please Enter Tne Number Of Day?",1,7);
}

 string GetDayOfWeak(enDayOfWeak Day)
 {
	 switch (Day)
	 {
	 case enDayOfWeak::Sat:
		 return "Saturday";
	 case enDayOfWeak::Sun:
		 return "Sunday";
	 case enDayOfWeak::Mon:
		 return "Monday";
	 case enDayOfWeak::Tue:
		 return "Tuesday";
	 case enDayOfWeak::Wed:
		 return "Wednesday";
	 case enDayOfWeak::Thu:
		 return "Thurasday";
	 case enDayOfWeak::Fri:
		 return "Friday";
	 default:
		 return "Not a valid Day";

	}
 }


int main()
{

	cout << GetDayOfWeak(ReadDayOfWeak()) << endl;

	return 0 ;
}
