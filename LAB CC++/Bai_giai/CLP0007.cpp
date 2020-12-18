#include <iostream>
#include <time.h>
#include <cstdlib>
#include <conio.h>

using namespace std;

const int n = 4;

// ham tra ve mot mang cac so ngau nhien
void mangRandom(int a[])
{
	int random;
	for( int i = 0; i<n; i++)
	{
		random  = rand()%(6-1)+1;
		a[i] = random;	
//		cout << a[i];
	}
}

void printRandom(int a[]) {
	for(int i = 0; i < n; i++) {
		printf("%d ", a[i]);
	}
}

void result(int a[],int b[],int & perfecet, int & imperfect)
{
	bool ma[n]; 
	bool mb[n];


	//dem khong co so phan tu dc dat tot
	for(int i =0; i<n; i++)
	{
		if(a[i] == b[i])
		{
			mb[i] = true;
			ma[i] = true;
			perfecet++;
		}
		else
		{
			mb[i] = false;
			ma[i] = false;
		}
		
	}
	//dem so phan tu dc dat kem
	for(int i=0; i<n; i++)
	{	
		if(ma[i] == false)
		{
			for(int j=0; j<n; j++)
			{
				if(i!= j)
				{
					if(a[i] == b[j] && mb[j] == false)
					{
							mb[j] = true;
							mb[i] = true;
							imperfect++;				
					}
				}
			}
		}
	}

}


int main()
{ 
	clock_t t;
	int perfect = 0; 
	int imperfect = 0; 
	int flag = 0;
	int a[n];
	int b[n];

	t = time(NULL);
	
	srand(time(NULL));
	do	{
			cout << "Welcome to MasterMind Game!" << endl << endl;
			cout << "At each turn, you will enter your guess for the playing board." << endl;
			cout << "A valid guess ahs 4 values in between 0 and 5." << endl;
			cout << "Each guess will have each number within the guess seperated by a space." << endl;
			cout << "When you are ready, enter your first guess." << endl;
			cout << "From that point on, you will be told how many perfect and imperfect matches you have." << endl;
			cout << "After this message, you should guess again. You have 10 chances, good luck!" << endl;
			cout << endl;
			
			mangRandom(a);
			printRandom(a);
			int restTurn = 10;
			int turn = 0;
			int existed = 0;

			do {
					  for( int i = 0; i<n; i++)
						  cin >> b[i];
					  perfect = 0;
					  imperfect = 0;
		
					  //ham de dem so luong phan tu tot va duoc dat xau
					  result(a, b, perfect, imperfect);
					  cout << "You have " << perfect << " perfect matches " << imperfect << " imperfect matches " << endl;
					  restTurn--;
					  turn++;
					  if(restTurn == 0) existed = 1;
				} while(perfect != 4 && existed == 0);
		t = time(NULL) - t;
		if(restTurn != 0)
			cout << "You have won the game in " << turn << " turns in "<< t << endl;

		else {
			cout << "Sorry, you have exceeded the maximum number of turns. You lose" << endl;
			cout << "Here is the winning board: ";
			printRandom(a);
			cout << endl;
		} 			
			
		cout << "Press any key to continute, ESC to exit.";
		char c = getch();
		if(c == 27) flag = 1;
		system("cls");
	}while(flag == 0);
	return 0;
}
