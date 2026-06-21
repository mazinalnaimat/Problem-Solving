#pragma once
class clsScreen
{
protected:
	static void _DrawScreenHeader(string S1)
	{
		cout << setw(37) << left << "" << "_____________________________________________\n\n";
		cout << setw(42) << left << "" << S1 << "\n";
		cout << setw(37) << left << "" << "_____________________________________________\n\n";

	}
};

