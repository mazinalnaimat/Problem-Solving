#pragma once
#pragma warning(disable : 4996)

#include <iostream>
#include<vector>
#include <string>
#include <iomanip>
#include "clsString.h"




using namespace std;

class clsDate
{
private:


	short _Day = 1;
	short _Month = 1;
	short _Year = 1900;

public:


	clsDate()
	{
		time_t t = time(0); // get time now
		tm* now = localtime(&t);
		_Year = now->tm_year + 1900;
		_Month = now->tm_mon + 1;
		_Day = now->tm_mday;

	};

	clsDate(string StringDate)
	{
		ConvertStringDateToNum(StringDate, "/");

	};

	clsDate(short Day, short Month, short Year)
	{
		_Year = Year;
		_Month = Month;
		_Day = Day;
	};

	clsDate(short NumDay, short Year)
	{
		_Year = Year;
		_Month = 1;
		_Day = 0;

		*this = IncreaseDateByXDay(NumDay, *this);
	};

	void SetDay(short Day)
	{
		_Day = Day;

	}

	short GetDay()
	{
		return _Day;
	}
	__declspec(property(get = GetDay, put = SetDay)) short Day;

	void SetMonth(short Month)
	{
		_Month = Month;

	}

	short GetMonth()
	{
		return _Month;
	}
	__declspec(property(get = GetMonth, put = SetMonth)) short Month;

	void SetYear(short Year)
	{
		_Year = Year;

	}

	short GetYear()
	{
		return _Year;
	}
	__declspec(property(get = GetYear, put = SetYear)) short Year;

	static clsDate GetSystemDate()
	{
		short Day, Month, Year;
		time_t t = time(0); // get time now
		tm* now = localtime(&t);
		Year = now->tm_year + 1900;
		Month = now->tm_mon + 1;
		Day = now->tm_mday;
		return clsDate(Day, Month, Year);
	}

	static bool IsValid(clsDate Date)
	{
		if (Date._Year <= 0 || Date._Month < 1 || Date._Month > 12)
		{
			return 0;
		}
		else if (Date._Year == 1582 && Date._Month == 10)
		{
			if (Date._Year == 1582 && Date._Month == 10 && (Date._Day > 4 && Date._Day < 15))
			{
				return 0;

			}
			if (Date._Day > 10 + NumberOfDaysInAMonth(Date._Year, Date._Month) || Date._Day < 1)
			{
				return 0;
			}
			else
				return 1;
		}
		else if (Date._Day > NumberOfDaysInAMonth(Date._Year, Date._Month) || Date._Day < 1)
		{
			return 0;
		}

		else
		{
			return 1;
		}

	}

	bool IsValid()
	{
		return IsValid(*this);
	}

	static string DateToString(clsDate Date)
	{
		return  to_string(Date._Day) + "/" + to_string(Date._Month) + "/" + to_string(Date._Year);
	}

	string DateToString()
	{
		return DateToString(*this);
	}

	static	bool IsLeapYear(short Year)
	{
		return ((Year % 400 == 0) || (Year % 4 == 0 && Year % 100 != 0));
	}

	bool IsLeapYear()
	{
		return(this->GetYear());
	}

	static short NumberOfDaysInAYear(short Year)
	{
		return Year = Year == 1582 ? 356 : IsLeapYear(Year) ? 366 : 365;
	}

	short NumberOfDaysInAYear()
	{
		return  NumberOfDaysInAYear(this->_Year);
	}

	static short NumberOfHoursInAYear(short Year)
	{
		return NumberOfDaysInAYear(Year) * 24;
	}

	short NumberOfHoursInAYear()
	{
		return  NumberOfHoursInAYear(this->_Year);
	}

	static int NumberOfMinutessInAYear(short Year)
	{
		return NumberOfHoursInAYear(Year) * 60;
	}

	short NumberOfMinutessInAYear()
	{
		return  NumberOfMinutessInAYear(this->_Year);
	}

	static int NumberOfSecondsInAYear(short Year)
	{
		return NumberOfMinutessInAYear(Year) * 60;
	}

	short NumberOfSecondsInAYear()
	{
		return  NumberOfSecondsInAYear(this->_Year);
	}

	static void PrintTheYearPerTimes(short Year)
	{
		cout << "Number of Days    in Year [" << Year << "] is " << NumberOfDaysInAYear(Year) << endl;
		cout << "Number of Hours   in Year [" << Year << "] is " << NumberOfHoursInAYear(Year) << endl;
		cout << "Number of Minutes in Year [" << Year << "] is " << NumberOfMinutessInAYear(Year) << endl;
		cout << "Number of Seconds in Year [" << Year << "] is " << NumberOfSecondsInAYear(Year) << endl;
	}

	void PrintTheYearPerTimes()
	{
		return  PrintTheYearPerTimes(this->_Year);
	}

	static short NumberOfDaysInAMonth(short Year, short Month)
	{
		return Month = (Year == 1582 && Month == 10 ? 21 : Month == 2 ? (IsLeapYear(Year) ? 29 : 28) : (Month == 11 || Month == 9 || Month == 6 || Month == 4) ? 30 : 31);
	}

	short NumberOfDaysInAMonth()
	{
		return NumberOfDaysInAMonth(this->GetMonth(), this->GetYear());
	}


	static short NumberOfHoursInAMonth(short Year, short Month)
	{
		return NumberOfDaysInAMonth(Year, Month) * 24;
	}

	short NumberOfHoursInAMonth()
	{
		return  NumberOfHoursInAMonth(this->_Year, this->_Month);
	}

	static int NumberOfMinutessInAMonth(short Year, short Month)
	{
		return NumberOfHoursInAMonth(Year, Month) * 60;
	}

	int NumberOfMinutessInAMonth()
	{
		return  NumberOfMinutessInAMonth(this->_Year, this->_Month);
	}

	static int  NumberOfSecondsInAMonth(short Year, short Month)
	{
		return NumberOfMinutessInAMonth(Year, Month) * 60;
	}

	int NumberOfSecondsInAMonth()
	{
		return  NumberOfSecondsInAMonth(this->_Year, this->_Month);
	}

	static void PrintTheMonthPerTimes(short Year, short Month)
	{
		cout << "Number of Days    in Month [" << Month << "] is " << NumberOfDaysInAMonth(Year, Month) << endl;
		cout << "Number of Hours   in Month [" << Month << "] is " << NumberOfHoursInAMonth(Year, Month) << endl;
		cout << "Number of Minutes in Month [" << Month << "] is " << NumberOfMinutessInAMonth(Year, Month) << endl;
		cout << "Number of Seconds in Month [" << Month << "] is " << NumberOfSecondsInAMonth(Year, Month) << endl;

	}

	void PrintTheMonthPerTimes()
	{
		return  PrintTheMonthPerTimes(this->_Year, this->_Month);
	}

	static clsDate DecreaseDateByOneDay(clsDate& Date)
	{
		if (Date._Year == 1582 && Date._Month == 10 && Date._Day == 15)
		{
			Date._Day = 4;
		}
		else
		{

			Date._Day--;
			if (Date._Day == 0)
			{
				Date._Month--;
				Date._Day = NumberOfDaysInAMonth(Date._Year, Date._Month);

			}
			if (Date._Month == 0)
			{
				Date._Year--;
				Date._Month = 12;

			}
		}

		return Date;
	}

	void DecreaseDateByOneDay()
	{
		DecreaseDateByOneDay(*this);
	}

	static clsDate DecreaseDateByXDay(int Days, clsDate& Date)
	{
		for (int i = 1; i <= Days; i++)
		{
			Date = DecreaseDateByOneDay(Date);
		}

		return Date;
	}

	void DecreaseDateByXDay(int Days)
	{
		DecreaseDateByXDay(Days, *this);
	}

	static clsDate DecreaseDateByOneWeek(clsDate& Date)
	{
		for (int i = 1; i <= 7; i++)
		{
			Date = DecreaseDateByOneDay(Date);
		}

		return Date;
	}

	void DecreaseDateByOneWeek()
	{
		DecreaseDateByOneWeek(*this);
	}

	static clsDate DecreaseDateByXWeeks(int Weeks, clsDate& Date)
	{
		for (int i = 1; i <= Weeks; i++)
		{
			Date = DecreaseDateByOneWeek(Date);
		}

		return Date;
	}

	void DecreaseDateByXWeeks(int Weeks)
	{
		DecreaseDateByXWeeks(Weeks, *this);
	}

	static clsDate DecreaseDateByOneMonth(clsDate& Date)
	{

		Date._Month--;
		if (Date._Month == 0)
		{
			Date._Year--;
			Date._Month = 12;

		}

		return Date;
	}

	void DecreaseDateByOneMonth()
	{
		DecreaseDateByOneMonth(*this);

	}

	static clsDate DecreaseDateByXMonths(int Months, clsDate& Date)
	{

		for (int i = 1; i <= Months; i++)
			Date = DecreaseDateByOneMonth(Date);
		return Date;
	}

	void DecreaseDateByXMonths(int Months)
	{
		DecreaseDateByXMonths(Months, *this);
	}

	static clsDate DecreaseDateByOneYear(clsDate& Date)
	{
		Date._Year--;
		return Date;
	}

	void DecreaseDateByOneYear()
	{
		DecreaseDateByOneYear(*this);
	}

	static clsDate DecreaseDateByXYears(int Years, clsDate& Date)
	{
		for (int i = 1; i <= Years; i++)
			Date = DecreaseDateByOneYear(Date);
		return Date;
	}

	void DecreaseDateByXYears(int Years)
	{
		DecreaseDateByXYears(Years, *this);
	}

	static clsDate DecreaseDateByXYearsFaster(int Years, clsDate& Date)
	{
		Date._Year -= Years;
		return Date;
	}

	void DecreaseDateByXYearsFaster(int Years)
	{
		DecreaseDateByXYearsFaster(Years, *this);
	}

	static clsDate DecreaseDateByOneDecade(clsDate& Date)
	{
		Date._Year -= 10;
		return Date;
	}

	void DecreaseDateByOneDecade()
	{
		DecreaseDateByOneDecade(*this);
	}

	static  clsDate DecreaseDateByXDecades(int Decades, clsDate& Date)
	{
		for (int i = 1; i <= 10 * Decades; i++)
			Date = DecreaseDateByOneYear(Date);
		return Date;
	}

	void DecreaseDateByXDecades(int Decades)
	{
		DecreaseDateByXDecades(Decades, *this);
	}

	static clsDate DecreaseDateByXDecadesFaster(int Decades, clsDate& Date)
	{
		Date._Year -= Decades * 10;
		return Date;
	}

	void DecreaseDateByXDecadesFaster(int Decades)
	{
		DecreaseDateByXDecadesFaster(Decades, *this);
	}

	static clsDate DecreaseDateByOneCentury(clsDate& Date)
	{
		Date._Year -= 100;
		return Date;
	}

	void DecreaseDateByOneCentury()
	{
		DecreaseDateByOneCentury(*this);
	}

	static clsDate DecreaseDateByOneMillennium(clsDate& Date)
	{
		Date._Year -= 1000;
		return Date;
	}

	void DecreaseDateByOneMillennium()
	{
		DecreaseDateByOneMillennium(*this);
	}

	static string GetMonthName(short Month)
	{

		if (Month > 12 || Month < 1)
			return "";

		string arrMonthName[12] = { "Jan","Feb","Mar","Apr","May"
			,"Jun","Jul","Aug","Sep","Oct","Nov","Dec" };

		return arrMonthName[Month - 1];
	}

	static short DayOrdInWeekByClassDate(clsDate Date)
	{
		short a, y, m;
		a = (14 - Date._Month) / 12;
		y = Date._Year - a;
		m = Date._Month + (12 * a) - 2;
		short b = (Date._Day + y + (y / 4) - (y / 100) + (y / 400) + ((31 * m) / 12)) % 7;


		if (IsDate1BeforeDate2(Date, clsDate(15, 10, 1582)))
		{


			short i = 1;
			b = (Date._Day + y + (y / 4) - (y / 100) + (y / 400) + ((31 * m) / 12)) % 7;

			while (i != 13)
			{
				if (b == 0)
				{

					b = 6;
				}
				else
					b--;

				i++;
			}

		}


		return b;

	}

	short DayOrdInWeekByClassDate()
	{
		return  DayOrdInWeekByClassDate(*this);
	}

	static short DayOrdInWeek(short Year, short Month, short Day)
	{
		short a, y, m;
		a = (14 - Month) / 12;
		y = Year - a;
		m = Month + (12 * a) - 2;

		clsDate Date;
		Date._Day = Day;
		Date._Month = Month;
		Date._Year = Year;


		if (IsDate1BeforeDate2(clsDate(4, 10, 1582), Date) && IsDate1BeforeDate2(Date, clsDate(15, 10, 1582)))
		{
			return -1;
		}


		if (IsDate1BeforeDate2(Date, clsDate(15, 10, 1582)))
		{
			short b, i = 1;
			b = (Date._Day + y + y / 4 - y / 100 + y / 400 + (31 * m) / 12) % 7;

			while (i != 13)
			{
				if (b == 0)
				{

					b = 6;
				}
				else
					b--;

				i++;
			}
			return b;
		}
		else

			return (Day + y + (y / 4) - (y / 100) + (y / 400) + ((31 * m) / 12)) % 7;
	}

	short DayOrdInWeek()
	{
		return  DayOrdInWeek(this->_Day, this->_Month, this->_Year);
	}

	string GetMonthName()
	{
		return  GetMonthName(this->_Month);
	}

	static string GetMonthCalendar(short Year, short Month, int Line) {
		string Calendar = "___________________" + GetMonthName(Month) + "___________________";
		Calendar += "                                         ";
		Calendar += " Sun   Mon   Tue   Wed   Thu   Fri   Sat ";

		short FirstDay = DayOrder(Year, Month, 1) + 1;

		short MonthLength = NumberOfDaysInAMonth(Year, Month);

		for (short j = 1; j < FirstDay; j++)
			Calendar += "      ";

		short i;

		if (Year == 1582 && Month == 10)
		{
			MonthLength = 31;
		}


		for (i = 1; i <= MonthLength; i++)
		{


			if (Year == 1582 && i == 5 && Month == 10)
				i = i + 10;

			Calendar += " " + to_string(i) + "   " + ((i > 9) ? "" : " ");

			if (i > 5 && Month == 10 && Year == 1582)
			{
				if ((i + FirstDay - 1 + 11) % 7 == 0)
					Calendar.erase(Calendar.length() - 1, 1);
			}

			else

			{
				if ((i + FirstDay - 1) % 7 == 0)
					Calendar.erase(Calendar.length() - 1, 1);
			}

		}

		i--;

		if (i > 5 && Month == 10 && Year == 1582)
		{
			while ((i + FirstDay - 1 + 11) % 7 != 0)
			{
				Calendar += "             ";
				if (i == 31 && Line == 9)
					Calendar.erase(Calendar.length() - 2, 2);

				i++;
			}
		}

		else
			while ((i + FirstDay - 1) % 7 != 0)
			{
				Calendar += "      ";

				i++;
			}

		if (Calendar.length() <= 9 * 41)
		{
			Calendar += "                                         ";
		}

		Calendar += "_________________________________________";


		return Calendar;
	}

	static clsDate ConvertStringDateToNum(string Line, string Seperator = "/")
	{
		vector <string> vNewDate = clsString::SplitString(Line, Seperator);
		clsDate Date;

		for (int i = 0; i < vNewDate.size(); i++)
		{
			Date._Year = stoi(vNewDate[2]);
			Date._Month = stoi(vNewDate[1]);
			Date._Day = stoi(vNewDate[0]);

		}

		return Date;
	}

	static	clsDate IncreaseDateByOneDay(clsDate& Date)
	{
		short NumberodDaysInMon = NumberOfDaysInAMonth(Date._Year, Date._Month);
		if (Date._Year == 1582 && Date._Month == 10 && Date._Day == 4)
		{
			Date._Day = 15;

		}
		else
		{

			Date._Day++;

			if (Date._Year == 1582 && Date._Month == 10)
			{
				if (Date._Day > NumberodDaysInMon + 10)
				{
					Date._Day = 1;
					Date._Month = Date._Month + 1;
				}
			}

			else
			{
				if (Date._Day > NumberodDaysInMon)
				{
					Date._Day = 1;
					Date._Month = Date._Month + 1;
				}
			}



			if (Date._Month > 12)
			{
				Date._Month = 1;
				Date._Year = Date._Year + 1;

			}
		}

		return Date;
	}

	void IncreaseDateByOneDay()
	{
		IncreaseDateByOneDay(*this);
	}

	static clsDate IncreaseDateByXDay(int Days, clsDate Date)
	{
		for (int i = 1; i <= Days; i++)
		{
			Date = IncreaseDateByOneDay(Date);
		}

		return Date;
	}

	void IncreaseDateByXDay(int Day)
	{
		IncreaseDateByXDay(Day, *this);
	}

	static clsDate IncreaseDateByOneWeek(clsDate Date)
	{
		for (int i = 1; i <= 7; i++)
		{
			Date = IncreaseDateByOneDay(Date);
		}

		return Date;
	}

	void IncreaseDateByOneWeek()
	{
		IncreaseDateByOneWeek(*this);
	}

	static clsDate IncreaseDateByXWeeks(int Weeks, clsDate Date)
	{
		for (int i = 1; i <= Weeks; i++)
		{
			Date = IncreaseDateByOneWeek(Date);
		}

		return Date;
	}

	void IncreaseDateByXWeeks(int Weeks)
	{
		IncreaseDateByXWeeks(Weeks, *this);
	}

	static clsDate IncreaseDateByOneMonth(clsDate Date)
	{

		Date._Month++;
		if (Date._Month > 12)
		{
			Date._Month = 1;
			Date._Year++;
		}

		return Date;
	}

	void IncreaseDateByOneMonth()
	{
		IncreaseDateByOneMonth(*this);
	}

	static clsDate IncreaseDateByXMonths(int Months, clsDate Date)
	{

		for (int i = 1; i <= Months; i++)
			Date = IncreaseDateByOneMonth(Date);
		return Date;
	}

	void IncreaseDateByXMonths(int Months)
	{
		IncreaseDateByXMonths(Months, *this);
	}

	static clsDate IncreaseDateByOneYear(clsDate Date)
	{
		Date._Year++;
		return Date;
	}

	void IncreaseDateByOneYear()

	{
		IncreaseDateByOneYear(*this);

	}


	static clsDate IncreaseDateByXYears(int Years, clsDate& Date)
	{
		for (int i = 1; i <= Years; i++)
			Date = IncreaseDateByOneYear(Date);
		return Date;
	}

	void IncreaseDateByXYears(int Years)
	{
		IncreaseDateByXYears(Years, *this);
	}

	static clsDate IncreaseDateByXYearsFaster(int Years, clsDate& Date)
	{
		Date._Year += Years;
		return Date;
	}

	void IncreaseDateByXYearsFaster(int Years)
	{
		IncreaseDateByXYearsFaster(Years, *this);
	}

	static clsDate IncreaseDateByOneDecade(clsDate Date)
	{
		Date._Year += 10;
		return Date;
	}

	void IncreaseDateByOneDecade()
	{

		IncreaseDateByOneDecade(*this);
	}

	static clsDate IncreaseDateByXDecades(int Decades, clsDate Date)
	{
		for (int i = 1; i <= 10 * Decades; i++)
			Date = IncreaseDateByOneYear(Date);
		return Date;
	}

	void IncreaseDateByXDecades(int Decades)
	{
		IncreaseDateByXDecades(Decades, *this);
	}

	static clsDate IncreaseDateByXDecadesFaster(int Decades, clsDate Date)
	{
		Date._Year += Decades * 10;
		return Date;
	}

	void IncreaseDateByXDecadesFaster(int Decades)
	{
		IncreaseDateByXDecadesFaster(Decades, *this);
	}

	static clsDate IncreaseDateByOneCentury(clsDate Date)
	{
		Date._Year += 100;
		return Date;
	}

	void IncreaseDateByOneCentury()
	{
		IncreaseDateByOneCentury(*this);
	}

	static clsDate IncreaseDateByOneMillennium(clsDate Date)
	{
		Date._Year += 1000;
		return Date;
	}

	void IncreaseDateByOneMillennium()
	{
		IncreaseDateByOneMillennium(*this);
	}

	static short DayOrder(short Year, short Month, short Day)
	{
		clsDate Date(Day, Month, Year);

		short a = (14 - Month) / 12;
		Year = Year - a;
		Month = Month + 12 * a - 2;


		if (IsDate1BeforeDate2(clsDate(4, 10, 1582), Date) && IsDate1BeforeDate2(Date, clsDate(15, 10, 1582)))
		{
			return -1;
		}

		if (IsDate1BeforeDate2(Date, clsDate(15, 10, 1582)))
		{
			short b, i = 0;
			b = (Day + Year + (Year / 4) - (Year / 100) + (Year / 400) + (31 * Month / 12)) % 7;
			while (i != 11)
			{
				if (b == 0)
				{

					b = 6;
				}
				else
					b--;

				i++;
			}
			return b;
		}
		else
			return(Day + Year + (Year / 4) - (Year / 100) + (Year / 400) + (31 * Month / 12)) % 7;
	}

	short DayOrder()
	{
		return DayOrder(this->GetYear(), this->GetMonth(), this->GetDay());
	}

	static string MonthShortName(short Month)
	{
		string MonthName[] = { "" , "Jan", "Feb", "Mar", "Apr", "May" ,"Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		return MonthName[Month];
	}

	string MonthShortName()
	{
		return MonthShortName(this->GetMonth());
	}

	static	bool IsDate1BeforeDate2(clsDate Date1, clsDate Date2)
	{
		if (Date1._Year < Date2._Year)
		{
			return true;
		}

		else if (Date1._Year == Date2._Year)
		{

			if (Date1._Month < Date2._Month)
			{
				return true;
			}
			else if (Date1._Month == Date2._Month)
			{
				if (Date1._Day < Date2._Day)
				{
					return true;
				}
				else
					return false;
			}
		}

		return false;
	}

	bool IsDateBeforeDate2(clsDate Date2)
	{
		return IsDate1BeforeDate2(*this, Date2);
	}

	static bool IsDate1EqualsDate2(clsDate Date1, clsDate Date2)
	{
		return(((Date1._Year == Date2._Year) && (NumbersOfDaysFromTheBeginningOfTheYear(Date1) == NumbersOfDaysFromTheBeginningOfTheYear(Date2))) ? true : false);
	}

	bool IsDateEqualsDate2(clsDate Date2)
	{
		return IsDate1EqualsDate2(*this, Date2);
	}


	static bool IstDate1AfterDate2(clsDate Date1, clsDate Date2)
	{
		return (!IsDate1BeforeDate2(Date1, Date2) && !IsDate1BeforeDate2(Date1, Date2)) ? true : false;
	}

	bool IstDate1AfterDate2(clsDate Date2)
	{
		return IstDate1AfterDate2(*this, Date2);
	}

	static int GetYourAgeInDays(clsDate Date)
	{
		clsDate Today;

		time_t TodayDate = time(0);

		tm* now = localtime(&TodayDate);

		Today.SetDay(now->tm_mday);
		Today.SetMonth(now->tm_mon + 1);
		Today.SetYear(now->tm_year + 1900);

		int NumDays = 0;
		while (IsDate1BeforeDate2(Date, Today))
		{
			Date = IncreaseDateByOneDay(Date);
			NumDays++;
		}
		return NumDays /*IncludeEndDay ? ++NumDays :*/;
	}

	int GetYourAgeInDays()
	{
		return GetYourAgeInDays(*this);
	}

	static void Print(clsDate Date)
	{
		if (IsValid(Date))
			cout << Date._Day << "/" << Date._Month << "/" << Date._Year << endl;
		else
			cout << "The Date is Wrong !!!" << endl;

	}

	void Print()
	{
		return Print(*this);
	}

	static void PrintMonthCalender(clsDate Date)
	{

		if (IsValid(Date) == false)
			cout << "The Date is Wrong!!! \n  Enter a valide Date" << endl;
		else
		{

			printf("\n  _______________%s_______________\n", MonthShortName(Date._Month).c_str());
			cout << "\n  Sun  Mon  Tue  Wed  Thu  Fri  Sat" << endl;
			short DayOre = DayOrder(Date._Year, Date._Month, 1);
			short NumberOfDays = NumberOfDaysInAMonth(Date._Year, Date._Month);


			for (int i = 1; i <= NumberOfDays + DayOre; i++)
			{
				if (Date._Year == 1582 && Date._Month == 10)//To Print October 1582

				{
					if (i > 5 && i < 16)
						continue;


					if (i <= DayOre)
						cout << "     ";
					else
						cout << setw(5) << i - DayOre;
					if (i > 16)
						if ((i + 11) % 7 == 0)
							cout << endl;
				}

				else
				{

					if (i <= DayOre)
						cout << "     ";
					else
						cout << setw(5) << i - DayOre;
					if (i % 7 == 0)
						cout << endl;
				}
			}
			printf("\n  _________________________________\n");

		}

	}

	void PrintMonthCalender()
	{
		return PrintMonthCalender(*this);
	}

	static void PrintYearCalenderVertically(clsDate Date)
	{
		if (IsValid(Date) == false)
			cout << "The Date is Wrong!!! \n  Enter a valide Date" << endl;
		else
		{
			short Cur = Date._Month;
			printf("\n  _________________________________\n");
			printf("\n          Calnder - %d", Date._Year);
			printf("\n  _________________________________\n");

			Date._Month = 1;

			for (int i = 1; i <= 12; i++)
			{
				PrintMonthCalender(Date);
				Date._Month++;
			}

			Date._Month = Cur;

		}
	}

	void PrintYearCalenderVertically()
	{
		return PrintYearCalenderVertically(*this);
	}

	static void PrintYearCalenderHorizontally(clsDate Date)
	{
		if (IsValid(Date) == false)
			cout << "The Date is Wrong!!! \n  Enter a valide Date" << endl;
		else
		{
			short Line = 10;

			cout << "\n";
			cout << clsString::GetLine(175, '_');
			cout << "\n\n" << clsString::GetLine(75, ' ') << "Year [" << Date._Year << "] Calendar\n";
			cout << clsString::GetLine(175, '_');


			cout << "\n\n\n";

			for (size_t l = 0; l <= 8; l += 4)
			{

				for (size_t i = 0; i < Line; i++)
				{
					for (size_t j = 1 + l; j <= 4 + l; j++)
					{

						cout << GetMonthCalendar(Date._Year, j, i).substr(i * 41, 41) << " | ";

					}
					cout << "\n";
				}
				cout << "\n\n";
			}

		}
	}

	void PrintYearCalenderHorizontally()
	{
		return PrintYearCalenderHorizontally(*this);
	}

	static string DayNameByDate(clsDate Date)
	{
		short DayOre = DayOrder(Date._Year, Date._Month, Date._Day);
		if (DayOre == -1)
		{
			return "None";
		}
		else
		{
			string DaysNames[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
			return DaysNames[DayOre];
		}
	}

	string DayNameByDate()
	{
		return DayNameByDate(*this);
	}

	static short NumbersOfDaysFromTheBeginningOfTheYear(short Day, short Month, short Year)
	{
		short NumDays = 0;
		for (int i = 1; i < Month; i++)
		{
			NumDays += NumberOfDaysInAMonth(i, Year);
		}
		NumDays += Day;
		return NumDays;
	}

	static short NumbersOfDaysFromTheBeginningOfTheYear(clsDate Date)
	{
		short NumDays = 0;
		for (int i = 1; i < Date._Month; i++)
		{
			NumDays += NumberOfDaysInAMonth(i, Date._Year);
		}
		NumDays += Date._Day;
		return NumDays;
	}

	short NumbersOfDaysFromTheBeginningOfTheYear()
	{
		return NumbersOfDaysFromTheBeginningOfTheYear(this->_Day, this->_Month, this->_Year);
	}

	static clsDate GetDateFromDayOrderInYear(short DaysNumber, short Year)
	{
		clsDate Date;
		short DaysNum = DaysNumber;
		short Month;
		short Day;

		for (int i = 1; i <= 12; i++)
		{
			if (NumberOfDaysInAMonth(i, Year) < DaysNumber)
			{
				DaysNumber -= NumberOfDaysInAMonth(i, Year);
			}
			else
			{
				Month = i;
				Day = DaysNumber;
				break;
			}
		}


		Date._Day = Day;
		Date._Month = Month;
		Date._Year = Year;

		return Date;
	}

	static bool IsTheLastDayInAMonth(clsDate Date)
	{
		return (Date._Day == NumberOfDaysInAMonth(Date._Month, Date._Year));
	}

	bool IsTheLastDayInAMonth()
	{
		return IsTheLastDayInAMonth(*this);
	}

	static bool IsTheLastMonthInAYear(clsDate Date)
	{
		return Date._Month == 12;
	}

	bool IsTheLastMonthInAYear()
	{
		return  IsTheLastMonthInAYear(*this);
	}

	static void SwapDates(clsDate& Date1, clsDate& Date2)
	{
		clsDate TempDate = Date1;
		Date1 = Date2;
		Date2 = TempDate;
	}

	void SwapDates(clsDate& Date)
	{
		return SwapDates(*this, Date);
	}

	static int GetDifferenceInDays(clsDate Date1, clsDate Date2, bool IncludeEndDay = false)
	{
		if (IsValid(Date1) && IsValid(Date2))
		{
			int NumDays = 0;
			short SwapFlagValue = 1;
			if (!IsDate1BeforeDate2(Date1, Date2))
			{
				SwapDates(Date1, Date2);
				SwapFlagValue = -1;

			}


			while (IsDate1BeforeDate2(Date1, Date2))
			{
				Date1 = IncreaseDateByOneDay(Date1);
				NumDays++;
			}
			return IncludeEndDay ? SwapFlagValue * ++NumDays : SwapFlagValue * NumDays;
		}
		else
			return -1;
	}

	int GetDifferenceInDays(clsDate Date1, bool IncludeEndDay = false)
	{
		return GetDifferenceInDays(*this, Date1, IncludeEndDay);
	}


	static short DaysUntilEndOfMonth(clsDate Date, bool  WithThisDay = true)
	{
		/*#1

			short Days = 0;
			short Month = NumberOfDaysInAMonth(Date.Month, Date.Year);
			while (Month  >= Date.Day)
			{
				Days++;
			   if( Month != Date.Day)
				Date = IncreaseDateByOneDay(Date);
			   else
			   return Days;
			 }
		*/


		/*#2*/

		if (IsValid(Date))
		{



			clsDate EndOfMonthDate;
			EndOfMonthDate._Day = NumberOfDaysInAMonth(Date._Month, Date._Year);
			EndOfMonthDate._Month = Date._Month;
			EndOfMonthDate._Year = Date._Year;

			return GetDifferenceInDays(Date, EndOfMonthDate, WithThisDay);
		}

		else

			return -1;


		//#3
		  //return  NumberOfDaysInAMonth(Date.Month, Date.Year) - Date.Day;
	}

	short DaysUntilEndOfMonth(bool  WithThisDay = true)
	{
		return DaysUntilEndOfMonth(*this, WithThisDay);
	}

	static short DaysUntilEndOfYear(clsDate Date, bool  WithThisDay = true)
	{/*
		#1
			short Days = 0;
			short Year = NumberOfDaysInAYear(Date.Year);
			while (Year >= NumberOfDaysFromTheBeginningOfTheYear(Date))
			{
				Days++;
				if (Year != NumberOfDaysFromTheBeginningOfTheYear(Date))
					Date = IncreaseDateByOneDay(Date);
				else
					return Days;
			}

		return Days;
		  */


		  //#2

		if (IsValid(Date))
		{


			clsDate EndOfYearDate;
			EndOfYearDate._Day = 31;
			EndOfYearDate._Month = 12;
			EndOfYearDate._Year = Date._Year;

			return GetDifferenceInDays(Date, EndOfYearDate, WithThisDay);
		}

		else

			return -1;


	}

	short DaysUntilEndOfYear(bool  WithThisDay = true)
	{
		return DaysUntilEndOfYear(*this, WithThisDay);
	}

	static short DaysUntilEndOfWeek(clsDate Date, bool WithThisDay = true)
	{
		if (IsValid(Date))
		{



			if (WithThisDay == true)
				return 7 - DayOrdInWeekByClassDate(Date);
			else
				return 6 - DayOrdInWeekByClassDate(Date);
		}

		else

			return -1;


	}

	short DaysUntilEndOfWeek(bool WithThisDay = true)
	{
		return DaysUntilEndOfWeek(*this, WithThisDay);
	}

	static bool IsItEndOfWeek(clsDate Date)
	{
		return DayOrdInWeekByClassDate(Date) == 6 ? true : false;
	}

	bool IsItEndOfWeek()
	{
		return IsItEndOfWeek(*this);
	}

	static	bool IsItWeekend(clsDate Date)
	{
		return DayOrdInWeekByClassDate(Date) == 6 || DayOrdInWeekByClassDate(Date) == 5 ? true : false;
	}

	bool IsItWeekend()
	{
		return IsItWeekend(*this);
	}

	static bool IsItBusinessDay(clsDate Date)
	{
		return !IsItWeekend(Date);
	}

	bool IsItBusinessDay()
	{
		return IsItBusinessDay(*this);
	}

	static	short CalculateVacationDaysIfTheDate(clsDate StartDate, clsDate EndDate)
	{
		short NumbDays = 0;

		while (IsDate1BeforeDate2(StartDate, EndDate))
		{
			if (IsItBusinessDay(StartDate))
				NumbDays++;
			StartDate = IncreaseDateByOneDay(StartDate);
		}
		return NumbDays;
	}

	short CalculateVacationDaysIfTheDateIsStart(clsDate EndDate)
	{
		return CalculateVacationDaysIfTheDate(*this, EndDate);
	}

	short CalculateVacationDaysIfTheDateIsEnd(clsDate StartDate)
	{
		return CalculateVacationDaysIfTheDate(StartDate, *this);
	}

	static	short CalculateBusinessDaysIfTheDate(clsDate StartDate, clsDate EndDate)
	{
		return CalculateVacationDaysIfTheDate(StartDate, EndDate);
	}

	short CalculateBusinessDaysIfTheDateIsStart(clsDate EndDate)
	{
		return CalculateBusinessDaysIfTheDate(*this, EndDate);
	}

	short CalculateBusinessDaysIfTheDateIsEnd(clsDate StartDate)
	{
		return CalculateBusinessDaysIfTheDate(StartDate, *this);
	}

	static clsDate ReturnDateAfterVacation(short VacationDays, clsDate StartDate)
	{
		/*

		//My Solve
			sDate ReturnDate = StartDate;
			for(int i = 1 ; i <= VacationDays;i++)
			{
				if(IsItWeekend(ReturnDate))
					ReturnDate = IncreaseDateByOneDay(ReturnDate);
				ReturnDate = IncreaseDateByOneDay(ReturnDate);
			}

			while  (IsItWeekend(ReturnDate))
			{
				ReturnDate = IncreaseDateByOneDay(ReturnDate);
			}
			return ReturnDate;
			*/

			//Teacher solve
		short WeekEndCounter = 0;

		for (short i = 1; i <= VacationDays; i++)
		{

			if (IsItWeekend(StartDate))
				WeekEndCounter++;

			StartDate = IncreaseDateByOneDay(StartDate);

		}

		//to add weekends
		for (short i = 1; i <= WeekEndCounter; i++)
			StartDate = IncreaseDateByOneDay(StartDate);

		return StartDate;

	}


	clsDate ReturnDateAfterVacation(short VacationDays)
	{
		return ReturnDateAfterVacation(VacationDays, *this);
	}

	enum enDateCompare { Before = -1, Equal = 0, After = 1 };

	static enDateCompare CompareDates(clsDate Date1, clsDate Date2)
	{
		if (IsDate1BeforeDate2(Date1, Date2))
			return enDateCompare::Before;

		if (IsDate1EqualsDate2(Date1, Date2))
			return enDateCompare::Equal;

		/* if (IsDate1AfterDate2(Date1,Date2))
			 return enDateCompare::After;*/

			 //this is faster
		return enDateCompare::After;

	}

	enDateCompare CompareDates(clsDate Date2)
	{
		return CompareDates(*this, Date2);
	}


};