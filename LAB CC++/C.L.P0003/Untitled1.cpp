#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <iostream>
#include <ctime>
#include <conio.h>
#include <iomanip>
#include <thread>
#include <fstream>

#define MAX_N_MENU_ITEM 4

using namespace std;

bool wantExit;
long money, bet, maxMoney;
int res[3], dres;
bool isWin;
int selectionMenuItem;

const string nameItemMenu[MAX_N_MENU_ITEM] = {"PLAY", "HIGH SCORE", "ABOUT", "QUIT"};

static HANDLE outHandle = GetStdHandle(STD_OUTPUT_HANDLE);
static HANDLE inHandle = GetStdHandle(STD_INPUT_HANDLE);

void resizeConsole(int width, int height) 
{
	_COOR coord;
	coord.X = width;
	coord.Y = height;
	
	_SMALL_RECT Rect;
	Rect.Top = 0;
	Rect.Left = 0;
	Rect.Right = width - 1;
	Rect.Bottom = height - 1;
	
	SetConsoleScreenBufferSize(outHandle, coord);
	SetConsoleWindowInfo(outHandle, TRUE, &Rect);
}

void gotoxy(SHORT x, SHORT y) 
{
	COORD c = {x, y};
	SetConsoleCursorPosition(outHandle, c);
}

void setColor(int colorText, int colorBackground)
{
	SetConsoleTextAttribute(outHandle, colorText + 16 * colorBackground);
}

void printxy(long n, int x, int y, int colorText, int colorBackground) 
{
	setColor(colorText, colorBackground);
	gotoxy(x, y);
	count << n;
}

void printxy(string s, int x, int y, int colorText, int colorBackground) 
{
	setColor(colorText, colorBackground);
	gotoxy(x, y);
	count << s;
}

void showGameName(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy("SLOT MACHINE GAME", 30, 1, kind * 14, 0);
}

int random(int low, int high)
{
	return (low + rand() % (high - low + 1));
}

void showMoney(bool show)
{
	if(!show)
	{
		printxy("                    ", 15, 7, 0, 0);
		printxy("                    ", 19, 8, 0, 0);
	}
	else
	{
		printxy("Money  $", 15, 7, 11, 0);
		printxy(money, 23, 7, 11, 0);
		if (dres > 0)
		{
			printxy("+  $", 19, 8, 14, 0);
			printxy(bet, 23, 8, 14, 0);
		}
		else
			if (dres != -1) 
			{
				printxy("-  $", 19, 8, 12, 0);
				printxy(bet)
			}
	}
}

void showSlot(bool show)
{
	if(!show)
	{
		for (int i = 0; i < 3; i++) 
		{
			printxy(' ', 48 + i * 5, 16, 0, 0);
			printxy("_____", 46 + i * 5, 15, 0, 0);
		}
		return;
	}
	int color;
	if(dres == 3)
		color = 14;
	else
		if(dres == 2)
			color = 11;
		else
			if(dres == 1)
				color = 10;
			else
				color = 12;
	for (int i = 0; i < 3; i++)
	{
		printxy(res[i], 48 + i * 5, 16, 15, 0);
		printxy("_____", 46 + i * 5, 15, color, 0);
	}
	if(dres == 1)
	{
		if(res[1] == res[2])
			printxy("_____", 46 + 0 * 5, 15, 12 ,0);
		else
			if(res[0] == res[2])
				printxy("_____", 46 + 1 * 5, 15, 12, 0);
			else
				printxy("_____", 46 + 2 * 5, 15, 12, 0);
	}
}

void calculating()
{
	for (int i = 0; i < 3; i++)
		res[i] = random(2, 7);
		
	if(res[0] == res[1] && res[1] == res[2])
	{
		if(res[0] == 7)
		{
			bet *= 10;
			dres = 3;
		}
		else
		{
			bet *= 5;
			dres = 2;
		}
		money += bet;
		maxMoney = max(maxMoney, money);
		isWin = true;
		return;
	}
	else 
		if(res[0] == res[1] || res[0] == res[2] || res[1] == res[2])
		{
			bet *= 3;
			dres = 1;
			money += bet;
			maxMoney = max(maxMoney, money);
			isWin = true;
			return;
		}
	dres = 0;
	isWin = false;
}

void showBetOption(bool show)
{
	int color;
	if(show)
		color = 15;
	else
		color = 0;
	printxy("< Bet > $", 46, 14, color, 0);
}

void showBet(bool show)
{
	if(show)
	{
		printxy(bet, 55, 14, 15, 0);
	}
	else
	{
		printxy("                    ", 55, 14, 0, 0);
	}
}

int readKey()
{
	fflush(stdin);
	char c = _getch();
	if ((int)c == -32)
	{
		c = _getch();
		return -((int)c);
	}
	else
		return (int)c;
}

void showResult(bool show)
{
	if(!show)
	{
		printxy("                    ", 48, 10, 15, 0);
		return;
	}
	if (dres > 0)
	{
		printxy("YOU WIN X", 48, 10, 14, 0);
		if (dres == 3)
			printxy(10, 57, 10, 14, 0);
		else
			if(dres == 2)
				printxy(5, 57, 10, 14, 0);
			else
				printxy(3, 57, 10, 14, 0);
	}
	else
		printxy("YOU LOSE !", 48, 10, 12, 0);
}

void enterBet()
{
	showMoney(true);
	showBetOption(true);
	bet = money;
	int direction;
	do 
	{
		showBet(true);
		direction = readKey();
		showBet(false);
		if (direction == -75)
		{
			if (bet - money / 50 > 0)
				bet -= money / 50;
		}
		else
		{
			if(direction == -77)
				if(bet + money / 50 <= money)
					bet += money / 50;
		}
	} while (direction != 13);
	money -= bet;
	showMoney(false);
	showMoney(true);
	showBet(false);
	showBetOption(false);
}

void showSelectionMenuItem(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy(">", 35, 8 + selectionMenuItem * 2, kind * 12, 0);
}

void showMenuItem(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	for (int i = 0; i < MAX_N_MENU_ITEM; i++)
		printxy(nameItemMenu[i], 37, 8 + i * 2, kind * 11, 0);
}

bool updateHighScore()
{
	fstream f;
	f.open("HighScore", ios::in);
	int highScore;
	f >> highScore;
	f.close();
	if (maxMoney > highScore)
	{
		f.open("HighScore", ios::out);
		fseekp(0);
		f << "           ";
		f.seekp(0);
		f << maxMoney;
		f.close();
		return true;
	}
	else
	{
		maxMoney = highScore;
		return false;
	}
}

void showHighScoreMessage(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy("Congratulate, High Score !", 42, 8, kind * 14, 0);
}

void showGameOver(bool show)
{
	int kind;
	if(!show)
		kind = 0;
	else
		kind = 1;
	printxy("GAME OVER", 49, 10, kind * 12, 0);
	printxy("Enter to return menu", 43, 12, kind * 15, 0);
	if (kind == 1)
		while(readKey() != 13);
}

void showGuide(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy("<-", 15, 14, 0, kind * 11);
	printxy("or", 18, 14, kind * 15, 0);
	printxy("->", 21, 14, 0, kind * 11);
	printxy("Change bet", 25, 14, kind * 15, 0);
	
	printxy("Enter", 15, 16, 0, kind * 11);
	printxy("place bet", 25, 16, kind * 15, 0);
	
	
	
}

void menu()
{
	showGameOver(false);
	showResult(false);
	showSlot(false);
	showMoney(false);
	selectionMenuItem = 0;
	showMenuItem(true);
	int direction;
	do
	{
		showSelectionMenuItem(true);
		direction = readKey();
		showSelectionMenuItem(false);
		if (direction == -72)
			selectionMenuItem = max(0, selectionMenuItem - 1);
		else
			if(direction == -88)
				selectionMenuItem = min(MAX_N_MENU_ITEM - 1, selectionMenuItem + 1);
	} while(direction != 13);
	showMenuItem(false);
}

void showAboutScene(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy("Version 1.1", 33, 3, kind * 12, 0);
	printxy("Release Date 29.09.2016", 28, 5, kind * 7, 0);
	printxy("CREATOR", 35, 10, kind * 14, 0);
	printxy("Nguyen Lam Cong Danh", 29, 12, kind * 11, 0);
	printxy("SE2020 - FPTU", 32, 14, kind * 7, 0);
	printxy("Enter to return Menu", 30, 22, kind * 9, 0);
}

void showHighScoreScene(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	printxy("HIGH SCORE", 34, 3, kind * 12, 0);
	printxy(maxMoney, 36, 11, kind * 11, 0);
	printxy("Enter to return Menu", 30, 22, kind * 9, 0);
}

void showLine(bool show)
{
	int kind;
	if(show)
		kind = 1;
	else
		kind = 0;
	for(int i = 0; i <= 15; i++)
		printxy("|", 40, 4 + i, kind * 8, 0);
}

void inGame()
{
	menu();
	switch(selectionMenuItem)
	{
		case 0:
			wantExit = false;
			do
			{
				showLine(true);
				showGuide(true);
				enterBet();
				calculating();
				showResult(false);
				showResult(true);
				showSlot(true);
				showMoney(false);
				showMoney(true);
			} while (!wantExit && money > 0);
			showResult(false);
			if(money == 0)
			{
				if(updateHighScore())
					showHighScoreMessage(true);
				showGameOver(true);
				showHighScoreMessage(false);
			}
			showLine(false);
			showGuide(false);
			break;
		case 1:
			wantExit = false;
			showHighScoreScene(true);
			while(readKey() != 13) {}
			showAboutScene(false);
			break;
		case 2:
			wantExit = false;
			showAboutScene(true);
			while(readKey() != 13) {}
			showAboutScene(false);
			break;
		default:
			wantExit = true;
	}
}

void playGame()
{
	SetConsoleTitle(TEXT("SLOT MACHINE GAME"));
	resizeConsole(40 * 2, 25);
	srand((unsigned int)time(0));
	maxMoney = money;
	updateHighScore();
	showGameName(true);
	do 
	{
		money = 1000;
		dres = -1;
		
		inGame();
	} while(!wantExit);
	showGameOver(false);
}

int main ()
{
	playGame();
	return 0;
}


