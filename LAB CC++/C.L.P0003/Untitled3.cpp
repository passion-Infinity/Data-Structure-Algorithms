#include <iostream>
#include <ctime>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>

using namespace std;

 
class slotMachine {
private:
    int wheelA;
    int wheelB;
    int wheelC;
    double moneyInMachine; //total amount of $ in the machine
    double gameCost;       //the cost of one pull
    double moneyPaid;      //the money put in by user
public:
    slotMachine();
    bool displayMenu(void);
    bool pullHandle(void);
    void spinWheel(int &);
    void calculatePayout();
    void insertCoin(double );
    void displaySpinResults();
    int Random(int, int);
    void displayTotals();
};
 
int main(void) {
    //create a slot machine object
    slotMachine mySlot;
    cout << "You have $10.00\n";
    bool ok = true;
    while (ok){
        ok = mySlot.displayMenu();
    };
    return 0;
}

 

slotMachine::slotMachine () {
    srand((int) time(0));
    moneyInMachine = 10.00;
    moneyPaid = 0;
    wheelA = 0;
    wheelB = 0;
    wheelC = 0;
    gameCost = 0.25;
}

bool slotMachine::displayMenu(void)
{
    int choice;
    bool continueGame = true;  
    printf ("\nChoose one of the following menu option: "
			"\n1)	Play the slot machine"
			"\n2)	Save game"
			"\n3)	Cash out\n");
    cin >> choice;
    switch (choice) {
		case 1: 
			insertCoin(moneyInMachine);
		    if (pullHandle())
			{
		        displaySpinResults();
		        calculatePayout();
		    }
		    break;
		case 2:
			cout << "Your money had saved!" << endl;
			return continueGame;
			break;
		case 3: 
		    displayTotals();
			continueGame = false;
		    break;
    }
    return continueGame;
}

bool slotMachine::pullHandle(void)
{
    if (moneyPaid >= gameCost)
    {
        spinWheel(wheelA);
        spinWheel(wheelB);
        spinWheel(wheelC);
 
        moneyInMachine -= gameCost;
        //returns true if the handle was pulled.
        return true;
    } 
    //returns false if the handle could not be pulled  
    else
    {
        return false;
    }
}

 
void slotMachine::spinWheel(int &theWheel)
{
    theWheel = Random(2,7);
}
 
void slotMachine::calculatePayout()
{
    if (wheelA == wheelB  && wheelA == wheelC)
    {
        cout << "You win the big prize, 10.00$" << endl;
        cout << "You have " << moneyInMachine << "$";
        }
    else if(wheelA == wheelB || wheelA == wheelC || wheelB == wheelC)
    {
        cout << "You win 50 cents" << endl;
        moneyInMachine += 0.5;
        cout << "You have " << moneyInMachine << "$";
	}
	else
	{
		cout << "You don't win anything!" << endl;
		cout << "You have " << moneyInMachine << "$";
	}
}

void slotMachine::insertCoin(double amount)
{
    //adds to the amount of money paid by the user
    moneyPaid += amount;
    //adds to the total money in the machine
//    moneyInMachine += amount;
}

void slotMachine::displaySpinResults()
{
    //displays the value of the three wheels
    cout << "The slot machine show " << wheelA << wheelB << wheelC << endl;
}

void slotMachine::displayTotals()
{
    //displays the amount of money and number
    // of pulls the player has left
    cout << "Thank you for playing! You end with " << slotMachine::moneyInMachine << "$" << endl;
//    cout << "Pulls Left: " <<   slotMachine::moneyPaid / slotMachine::gameCost  << endl << endl;
}          

int slotMachine::Random(int low, int high)
{
    return 1 + rand() % (high - low + 1);
}

