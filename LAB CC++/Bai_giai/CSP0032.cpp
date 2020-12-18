#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int sumOfDigit(int n);

int main () {
    int n;
    char c ;
    do {
        printf ("----------SUM OF DIGIT");
        printf ("\nEnter a integer: ");
        scanf ("%d", &n);
        printf ("Sum = %d", sumOfDigit(n));
        printf ("\nPress any key to continute, ESC to exit.\n");
        c = getch();  
        if (c == 27)
            return EXIT_SUCCESS;
        system("cls");
    } while (c != 27);
    return 0;
}

int sumOfDigit(int n) {
    int r, s = 0;
    while (n > 0 || n < 0) {
        r = n % 10;
        n = n / 10;
        s = s + r;
    }
    if (s < 0) 
        s = -s;
    return s;
}
