#include <iostream>
#include <time.h>
#include <vector>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <wheel.h>



using namespace std;

int money  = 4000;

void print_screen(int n, vector<wheel*>slot_machine);
void game_play(int n, vector<wheel*> slot_machine);
bool win_condition1(int n, vector<wheel*> slot_machine);
bool win_condition2(int n, vector<wheel*> slot_machine);
bool win_condition3(int n, vector<wheel*> slot_machine);
void winning(int &monies, vector<wheel*> slot_machine, int b);



int main()
{
    srand(time(0));
    int req = 0;
    vector<wheel*> slot_machine;
    cout << "Enter number of wheels:" << endl;
    cin >> req;

    for (int i = 0; i < req; i++)
    {
        slot_machine.push_back(new wheel);
    }

    int num_wheels = slot_machine.size();
    bool game_playing = true;
    int bet = 0;
    while(money > o)
    {
        while(game_playing)
        {
            system("clear");
            cout << "Round Beginning..." << endl << "Enter bet amount: " << endl;
            cin >> bet;
            cout << "Enter number of rows to bet on (maximum of 3)" << endl;
            cin >> betting_rows;
            money -= bet * betting_rows;

            game_play(num_wheels, slot_machine);
            if (betting_rows <= 1)
            {
                if (win_condition2(num_wheels, slot_machine)) winning(money, slot_machine, bet);
            }
            if (betting_rows <= 2)
            {
                if (win_condition1(num_wheels, slot_machine)) winning(money, slot_machine, bet);
            }
            if (betting_rows <= 3)
            {
                if (win_condition3(num_wheels, slot_machine)) winning(money, slot_machine, bet);
            }

            if(money <= 0)
            {
                cout << "You lose! out of money :(" << endl;
                game_playing = false;
            }

            cout << "You lost :(" << endl;
            sleep(3);
        }
        sleep(20);

    return 0;
}


void print_screen(int n, vector<wheel*>slot_machine)
{
    system("clear");
    for (int i = 0; i < n; i++)
    {
        cout << slot_machine[i] ->get_first() << " ";
    }
    count << endl;
    for (int i = 0; i < n; i++)
    {
        cout << slot_machine[i] ->get_second() << " ";
    }
    cout << endl;
    for(int i = 0; i < n; i++)
    {
        cout << slot_machine[i] ->get_third() << " ";
    }
    cout << endl << endl << "Monies: " << ::money << endl;
}


void game_play(int n, vector<wheel*> slot_machine)
{
    int time = rand() % 15 + 10;
    while (time > 0)
    {
        for (int i = 0; i < n; i++) slot_machine[i] ->update();
        print_screen(n, slot_machine);
        usleep(400000);
        time--;
    }
    int stop_count = 0;
    int j = 0;
    while (stop_count < n)
    {
        for(j = stop_count; j < n; j++)
        {
            slot_machine[j] ->update();
        }
        print_screen(n, slot_machine);
        stop_count++;
        usleep(400000);
    }
}


bool win_condition1(int n, vector<wheel*> slot_machine)
{
    int winner_number = slot_machine[0] ->get_first();
    for(int i = 1; i < n; i++)
    {
        if (winner_number != slot_machine[i] ->get_first()) return false;
    }
    return true;
}
bool win_condition2(int n, vector<wheel*> slot_machine)
{
    int winner_number = slot_machine[0] ->get_second();
    for(int i = 1; i < n; i++)
    {
        if (winner_number != slot_machine[i] ->get_second()) return false;
    }
    return true;
}
bool win_condition3(int n, vector<wheel*> slot_machine)
{
    int winner_number = slot_machine[0] ->get_third();
    for(int i = 1; i < n; i++)
    {
        if (winner_number != slot_machine[i] ->get_third()) return false;
    }
    return true;
}
void winning(int &monies, vector<wheel*> slot_machine, int b)
{
    monies += slot_machine[1] ->get_second() * b;
    cout << "Winner!" << endl;
    count << "You win $" << slot_machine[1] ->get_second() * b << endl;
}


