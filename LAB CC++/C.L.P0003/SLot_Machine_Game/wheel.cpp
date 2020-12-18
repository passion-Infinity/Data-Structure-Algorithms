#include "wheel.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
using namespace std;

wheel::wheel()
{
    for (int i = 0; i < 10; i++)
    {
        cycle[i] = i / 2;
    }

    int shuffle_times = rand() % 50;
    while (shuffle_times > 0)
    {
        int tmpindex = rand() % 10;
        int swapindex = rand() % 10;
        int tmp = cycle[tmpindex];
        int tmp2 = cycle[swapindex];
        cycle[tmpindex] = tmp2;
        cycle[swapindex] = tmp;
        shuffle_times--;
    }
    place_tracker = 1;

}

void wheel::update()
{
        if (place_tracker < 8) place_tracker++;
        else place_tracker = 0;
}

int wheel::get_first()
{
    return cycle[place_tracker];
}

int wheel::get_second()
{
    return cycle[place_tracker + 1];
}

int wheel::get_third()
{
    return cycle[place_tracker + 2];
}
