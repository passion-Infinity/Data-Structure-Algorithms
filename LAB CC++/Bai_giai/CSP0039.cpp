#include <stdio.h>
#include <stdlib.h>

void printCharacter();
int CheckDatetime(int d, int m, int y);
void printCheckDatetime();

int main() {
    int op;
    do {
        printf("Menu"
               "\n----------------------"
               "\n1- Processing date data"
               "\n2- Character data"
               "\n3- Quit"
               "\nEnter your choice: ");
        scanf ("%d", &op);
        switch(op) {
            case 1: {
                printCheckDatetime();
                break;
            }
            case 2: {
                printCharacter();
                break;
            }
            case 3: break;
            
            default: printf ("Your choice doesn't exist. Try it again!!!\n\n");
        }
    } while (op != 3 );
    return 0;
}

int CheckDatetime(int d, int m, int y) {
    int Maxd = 31;
    if (d < 0 || d > 31 || m < 0 || m > 12)
        return 0;
    if (m == 4 || m == 6 || m == 9 || m == 11)
        Maxd = 30;
    if (m == 2) {
        if (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0))
            Maxd = 29;
        else
            Maxd = 28;
    }
    return d <= Maxd;
}

void printCheckDatetime() {
    int d, m, y;
    printf ("Please enter dd//mm//yyyy: ");
    scanf ("%d%d%d", &d, &m, &y);
    if (CheckDatetime(d, m, y))
        printf ("----valid date\n\n");
    else 
        printf ("----Invalid date\n\n");
}

void printCharacter() {
    fflush(stdin);
    char temp, i, c1, c2;
    printf("Enter c1, c2: ");
    scanf("%c %c", &c1, &c2);
    printf("Output: ");
    if (c1 <= c2) {
        temp = c1;
        c1 = c2;
        c2 = temp;
    }
    for (i = c1; i >= c2; i--) {
        printf ("%c:  %d\n", i, i);
    }
    printf ("\n\n");
}
