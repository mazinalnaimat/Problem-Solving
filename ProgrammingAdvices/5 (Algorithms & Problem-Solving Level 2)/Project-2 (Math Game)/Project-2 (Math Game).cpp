#include <iostream>
using namespace std;

enum enQuestionLevel{Easy = 1, Med = 2, Hard = 3, MixLevel = 4 };

enum enOperationType{ Add = 1, Subtract = 2, Multiplay = 3, Divisoin = 4, MixOp = 5};

struct stRoundInfo
{
	short     GameRound = 0;
	enQuestionLevel QuestionLevel;
	enOperationType  OperationType;
	int     Number1 = 0;
	int     Number2 = 0;
	int     RightAnswer = 0;
	int    PlayerAnswer = 0;
	string CharOperationType ;
};

struct stGameResults
{
	short GameRounds = 0;
	short NumberRightQuestoins = 0;
	short NumberWrongQuestoins = 0;
	string 	 ResultQuestionLevel;
	string ResultOpType;
	string GamePassedFailed;
};

int RandomNumber(int From, int To)
{
	int randNum = rand() % (To - From + 1) + From;
	return randNum;
}

short ReadHowManyQuestions()
{
	short Rounds = 0;
	do
	{
		cout << "How Many Questions do you wnat to answer ? " ;
		cin >> Rounds;

	} while (Rounds < 1 || Rounds > 10);
	return Rounds;
}

enQuestionLevel ReadLevelQuestoins(stRoundInfo Round)
{
	short LevelQuestions = 0;
	do
	{
		cout << "Enter Question Level [1] Easy, [2] Med, [3] Hard, [4] Mix ? ";
		cin >> LevelQuestions;
	} while (LevelQuestions > 4 || LevelQuestions < 1);
	return 	enQuestionLevel(LevelQuestions);
}

enOperationType	ReadOperationType()
{
	short OperationType = 0;
	do
	{	  if(OperationType !=0)
		cout << endl;
		cout << "Enter Question Level [1] '+', [2] '-', [3] '*', [4] '/', [5] Mix ? ";
		cin >> OperationType;
	} while (OperationType > 5 || OperationType < 1);

	return 	 enOperationType(OperationType);
}

 short GetRandomNumber(stRoundInfo RoundInfo)
 {
	 switch (RoundInfo.QuestionLevel)
	 {
	 case  enQuestionLevel::Easy:
		 return RandomNumber(1, 10);
		 break;
	 case  enQuestionLevel::Med:
		 return RandomNumber(10, 50);
		 break;
	 case  enQuestionLevel::Hard:
		 return RandomNumber(50, 100);
		 break;
	 }
 }

 string ResultQesLevel(enQuestionLevel Level)
 {
	 switch (Level)
	 {
	 case  enQuestionLevel::Easy:
		 return "Easy";
		 break;
	 case  enQuestionLevel::Med:
		 return "Med";
		 break;
	 case  enQuestionLevel::Hard:
		 return "Hard";
		 break;
	 default:
		 return "Mix";
		 break;
	 }
 }

 int GetRightAnswer(stRoundInfo RoundInfo)
 {
	 switch (RoundInfo.OperationType)
	 {
	 case  enOperationType::Add:
		 return RoundInfo.Number1 + RoundInfo.Number2;
		 break;
	 case  enOperationType::Subtract:
		 return RoundInfo.Number1 - RoundInfo.Number2;
		 break;
	 case  enOperationType::Multiplay:
		 return RoundInfo.Number1 * RoundInfo.Number2;
		 break;
	 case  enOperationType::Divisoin:
		 return RoundInfo.Number1 / RoundInfo.Number2;
		 break;
	 }
	 
 }

 int ReadPlayerAnswer()
 {
	 int answer;
	 cin >> answer;
	 return answer;
 }

 bool RightWrongAnswer(stRoundInfo RoundInfo, int PlayerAnswer)
 {
	 if (PlayerAnswer == RoundInfo.RightAnswer)
		 return true;
	 else
		 return false;
}

 string CharOperType(enOperationType OpType)
 {
	 switch (OpType)
	 {
	 case  enOperationType::Add:
		 return "+";
		 break;
	 case  enOperationType::Subtract:
		 return "-";
		 break;
	 case  enOperationType::Multiplay:
		 return "*";
		 break;
	 case  enOperationType::Divisoin:
		 return "/";
		 break;
	 case  enOperationType::MixOp:
		 return "Mix";
		 break;
	 }
 }

 string PassedFailed(stGameResults GameResults)
 {
	 if (GameResults.NumberRightQuestoins >= GameResults.NumberWrongQuestoins)
		 return "Pass :-)";
	 else
		 return "Fail :-(";
 }
 
stGameResults FillGameResults(short GameRounds, short RigthQuestion, short WrongQuestion, string ReslQesLev , string OpType )
{
   stGameResults GameResults;
    GameResults.GameRounds = GameRounds;

    GameResults.NumberRightQuestoins = RigthQuestion;
    GameResults.NumberWrongQuestoins = WrongQuestion;
	GameResults.ResultQuestionLevel = ReslQesLev;
	GameResults.ResultOpType = OpType;
	GameResults.GamePassedFailed = PassedFailed(GameResults);
    return GameResults;

}  

void PrintRoundResults(stRoundInfo RoundInfo,int&  PlayerAnswer)
{
	
	cout << "\n" << RoundInfo.Number1 ;
	cout << "\n" << RoundInfo.Number2<<" " << RoundInfo.CharOperationType << endl;
	cout << "________________________________\n";
	PlayerAnswer = RoundInfo.PlayerAnswer = ReadPlayerAnswer();
	cout << endl;
	if (RightWrongAnswer(RoundInfo, PlayerAnswer))
	{
		cout << "Right Answer :-)\n\n";
		system("Color 2F");
		
	}
	else
	{
		cout << "Wrong Answer :-(\n";
		cout << "The Rigth Answer is: " << RoundInfo.RightAnswer << "\n\n";
		system("Color 4F");
	
	}

}

stGameResults PlayGame(short HowManyRounds)
{	  
	stRoundInfo RoundInfo; 
	short RigthQuestion = 0, WrongQuestion = 0;
	int PlayerAnswer = 0;
	string ReslQesLev = "", OpType = "";


	RoundInfo.QuestionLevel = ReadLevelQuestoins(RoundInfo);
	enQuestionLevel QesLevelBeforeLoop = RoundInfo.QuestionLevel;
	RoundInfo.OperationType = ReadOperationType();
	enOperationType OpTypeBeforeLoop = RoundInfo.OperationType;

	for (short GameRound = 1; GameRound <= HowManyRounds; GameRound++)
	{
		RoundInfo.GameRound = GameRound;
		
		if (QesLevelBeforeLoop == enQuestionLevel::MixLevel)
			RoundInfo.QuestionLevel = enQuestionLevel(RandomNumber(1, 4));

		if (OpTypeBeforeLoop == enOperationType::MixOp)
			RoundInfo.OperationType = enOperationType(RandomNumber(1, 4)); 


		cout << "\nQuestoin [" << GameRound <<"/" << HowManyRounds << "]\n";
	
		RoundInfo.Number1 = GetRandomNumber(RoundInfo);
		RoundInfo.Number2 = GetRandomNumber(RoundInfo);
		RoundInfo.CharOperationType = CharOperType(RoundInfo.OperationType);
		RoundInfo.RightAnswer = GetRightAnswer(RoundInfo);
					
		ReslQesLev = ResultQesLevel(QesLevelBeforeLoop);

		OpType = CharOperType( OpTypeBeforeLoop);

		PrintRoundResults(RoundInfo, PlayerAnswer);
		
		if (RightWrongAnswer(RoundInfo, PlayerAnswer) == true)
			RigthQuestion++;
		else
			WrongQuestion++;
	}
	return FillGameResults(HowManyRounds, RigthQuestion, WrongQuestion, ReslQesLev , OpType );
}

void ShowFinalGameResults(stGameResults GameResults)
{		
	cout << "___________________________________________\n\n";
	cout << " Final Result is " << GameResults.GamePassedFailed << endl;
	cout << "___________________________________________\n";
	cout << "Questions Level        : " << GameResults.ResultQuestionLevel<< endl;
	cout << "Operation Type         : " << GameResults.ResultOpType <<endl;
	cout << "Number of Right Answers: " << GameResults.NumberRightQuestoins << endl;
	cout << "Number of Wrong Answers: " << GameResults.NumberWrongQuestoins << endl;
 }

void ResetScreen()
{
	system("cls");
	system("color 0F");
}

string Tabs(short NumberOfTabs)
{
	string t = "";
	for (int i = 1; i < NumberOfTabs; i++)
	{
		t = t + "\t";
		cout << t;
	}
	return t;
}

void StartGame()
{ 
	char PlayAgain = 'Y';
	do

	{  
		ResetScreen();
		stGameResults GameResults = PlayGame(ReadHowManyQuestions());
		ShowFinalGameResults(GameResults);

		do
		{
			cout << endl << Tabs(3) << "Do you want to play again? Y/N? ";
			cin >> PlayAgain;

		} while (PlayAgain != 'y' && PlayAgain != 'Y' && PlayAgain != 'N' && PlayAgain != 'n');
	} while (PlayAgain == 'Y' || PlayAgain == 'y');	

 }

int main()
{
   
	srand((unsigned)time(NULL));

	StartGame();

	return 0;
}

