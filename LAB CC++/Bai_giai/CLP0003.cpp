#include <cstdlib>
#include <iostream>
#include <ctime>

using namespace std;

class SlotMachine {
private:
    int wheelA;
    int wheelB;
    int wheelC;
    double moneyInMachine;
    double gameCost;
public:
    SlotMachine();
    bool showMenu(void);
    bool showGame(void);
    void showSpinWheel(int &);
    void showCalculation();
    void showSpinResult();
    void showTotal();
    int random(int, int);
};

SlotMachine::SlotMachine() {
    srand((int) time(0));
    moneyInMachine = 10.00;
    wheelA = 0;
    wheelB = 0;
    wheelC = 0;
    gameCost = 2;
}

int SlotMachine::random(int low, int high){
    return (1 + rand() % (high - low + 1));
}

void SlotMachine::showSpinWheel(int &theWheel){
    theWheel = random(1, 9);
}

void SlotMachine::showSpinResult() {
    cout << ">> The slot machine show " << wheelA << wheelB << wheelC << endl;
}


void SlotMachine::showCalculation(){
    if(wheelA == wheelB && wheelA == wheelC) {
        cout << ">> You win the big prize, $10.00" << endl;
        moneyInMachine += 10;
        cout << ">> You have " << moneyInMachine << "$" << endl << endl;
    } else if(wheelA == wheelB || wheelA == wheelC || wheelB == wheelC) {
        cout << ">> You have 50 cents!" << endl;
        moneyInMachine += 0.5;
        cout << ">> You have " << moneyInMachine << "$" << endl << endl;
    } 
    else {
        cout << ">> You don't win anything!" << endl;
        cout << ">> You have " <<  moneyInMachine << "$" << endl << endl;
    }
}

bool SlotMachine::showGame() {
    if(moneyInMachine >= gameCost) {
        showSpinWheel(wheelA);
        showSpinWheel(wheelB);
        showSpinWheel(wheelC);
        
        moneyInMachine -= gameCost;
        return true;
    }
    else {
        cout << ">> You are out of cash!" << endl;
        cout << "Thank you for playing! See you late!!!";
        exit(0);
    }
}

void SlotMachine::showTotal() {
    cout << "Thank you for playing! You end with " << SlotMachine::moneyInMachine << "$" << endl;
}

bool SlotMachine::showMenu() {
    int choice;
    bool continuteGame = true;
    cout << "Choose one of the following menu option:" << endl
         << "1) Play the slot machine" << endl
         << "2) Save game" << endl
         << "3) Cash out" << endl;
    cin >> choice;
    switch(choice) {
        case 1:
            if(showGame()) {
                showSpinResult();
                showCalculation();
            }
            break;
        case 2:
            cout << "Your money had saved!" << endl;
            return continuteGame;
            break;
        case 3:
            showTotal();
            continuteGame = false;
            break;
    }
    return continuteGame;
}

int main () {
    SlotMachine myslot;
    cout << "You have $10.00" << endl;
    bool play = true;
    while(play) {
        play = myslot.showMenu();
    }
    return 0;
}





