#pragma once
#include <iostream>
#include <queue>
#include <stack>
#include "clsDate.h"

using namespace std;
class clsQueueLine
{
private:
	string _Prefix = "";
	short _TotalTickets = 0;
	short _AverageServeTime = 0;

	class clsTickest
	{
	public:
		short _Number = 0;
		string _Prefix = "";
		string _TimeOfIssueTicket;
		short _WaitingClients =0;
		short _AverageServeTime = 0;
		short _ExpectedServedTime = 0;

		clsTickest()
		{
			
		}

		clsTickest(string Prefix, short Number, short WaitingClients, short AverageServeTime)
		{
			_Prefix = Prefix;
			_Number = Number;
			_TimeOfIssueTicket = clsDate::GetDateAndTimeOfThisMoment();
			_WaitingClients = WaitingClients;
			_AverageServeTime = AverageServeTime;
		}

		string Prefix()
		{
			return _Prefix;

		}

		short Number()
		{
			return _Number;
		}
	
		string TimeOfIssueTicket()
		{
			return _TimeOfIssueTicket;
		}

		string FullNumber()
		{
			if(_WaitingClients <10)
			return _Prefix + "0" + to_string(_Number);
			return _Prefix + to_string(_Number);

		}

		short WaitingClients()
		{
			return _WaitingClients;
		}

		short ExpectedServedTime()
		{
			return _AverageServeTime * _WaitingClients;
		}

		void Print()
		{
			cout << "\n" << setw(35) << "" << "____________________________\n";
			cout << "\n" << setw(35) << "" << "\t\t" << FullNumber() << "\n";
			cout << "\n" << setw(35) << "" << "\t" << _TimeOfIssueTicket;
			cout << "\n" << setw(35) << "" << "\tWaiting Clients = " << _WaitingClients;
			cout << "\n" << setw(35) << "" << "\t  Serve Time In \n" << setw(42) << ""
				<< ExpectedServedTime() << " Minutes.";

			cout << "\n" << setw(35) << "" << "____________________________\n";

		}

	};


public:

	queue <clsTickest> QueueLine;	

	clsQueueLine(string Prefix, short AverageServeTime)
	{
		_Prefix = Prefix;
		_TotalTickets = 0;
		_AverageServeTime = AverageServeTime;

	}

	void IssueTicket()
	{
		_TotalTickets++;
		
		clsTickest Ticket(_Prefix, QueueLine.size() + 1,WaitingClients(), _AverageServeTime);
		QueueLine.push(Ticket);

	}

	short WaitingClients()
	{
		return QueueLine.size();
	}

	short ServedClients()
	{
		return _TotalTickets - WaitingClients(); 
	}

	string WhoIsNext()
	{
		if (QueueLine.empty())
			return "No Client Lesft.";
		return QueueLine.front().FullNumber();
	}

	bool ServeNextClient()
	{
		if (QueueLine.empty())
			return false;
		QueueLine.pop();
		return true;
	}

	void PrintInfo()
	{
		cout << "\n" << setw(35) << "" << "____________________________\n";
		cout << "\n" << setw(35) << "" << "\t  Queue Info";
		cout << "\n" << setw(35) << "" << "____________________________\n";

		cout << "\n" << setw(37) << "" << "Prefix     = " << _Prefix;
		cout << "\n" << setw(37) << "" << "Total Tickets    = " << _TotalTickets;
		cout << "\n" << setw(37) << "" << "Served Clients   = " << ServedClients();
		cout << "\n" << setw(37) << "" << "Waiting Clients  = " << WaitingClients();
		cout << "\n" << setw(35) << "" << "____________________________\n";

	}

	void PrintTicketsLineRTL()
	{
		queue <clsTickest> TempLine = QueueLine;

		cout << "\n\t\t\tTickets: ";

		for (short i = 0; i < QueueLine.size(); i++)
		{

			cout << TempLine.front().FullNumber() << " <-- ";
			TempLine.pop();
		}
		cout << "\n";
	}

	void PrintTicketsLineLTR()
	{
		queue <clsTickest> TempQueueLine = QueueLine;
		stack <clsTickest> TempStackLine;

		while (!TempQueueLine.empty())
		{
			TempStackLine.push(TempQueueLine.front());
			TempQueueLine.pop();
		}

		cout << "\n\t\t\tTickets: ";

		while (!TempStackLine.empty())
		{

			cout << TempStackLine.top().FullNumber() << " --> ";
			TempStackLine.pop();
		}
		cout << "\n";
	}

	void PrintAllTickets()
	{
		if (QueueLine.empty())
		{
			cout << "\n\n" << setw(35) << "" << "\t  ---No Tickets---";
			return;
		}
		queue <clsTickest> TempQueueLine = QueueLine;

		cout << "\n\n" << setw(35) << "" << "\t  ---Tickets---";

		while (!TempQueueLine.empty())
		{
			TempQueueLine.front().Print();
			TempQueueLine.pop();
		}
	}

};

