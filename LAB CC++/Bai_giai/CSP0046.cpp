#include <stdio.h>
#include <stdlib.h>

int checkPrime(int n);
void printPrime(int n);
int fibonacci(int n);
void checkFibonacci(int n);
int sumOfDigit(int n);
char getUserChoice();


int main () {
    char userChoice;
    do {
        userChoice = getUserChoice();
        switch(userChoice) {
            case '1':{
            	system("cls");
                int n;
              printf ("Enter numbers of primes: ");
              scanf ("%d", &n);
              printPrime(n);
              printf ("\n\n");
              break;
            }
            case '2': {
            	system("cls");
                int n;
              printf ("Number tested: ");
              scanf("%d", &n);
              checkFibonacci(n);
              printf ("\n\n");
              break;
            }
            case '3': {
            	system("cls");
                int n;
                int s = 0;
              printf ("Enter an integer: ");
              scanf ("%d", &n);
              if(n < 0)	n = -n;
              printf ("Sum of its digit: %d", sumOfDigit(n));
              printf ("\n\n");
              break;
            }
            case '4' : {
                printf ("Goodbye! ");
                printf ("\n");
                break;
            }
        }
     if (userChoice < '1' || userChoice > '4') printf ("1 to 4 only!\n");  
    } while(userChoice != '4');
    return 0;
}

int checkPrime(int n) {
    int count = 0;
    for (int i = 1; i <= n; i++) {
        if (n % i == 0)
            count++;
    }
    if (count == 2)
        return 1;
    return 0;
}

void printPrime(int n) {
    int i = 2;
    int count = 1;
    while (count <= n) {
        if (checkPrime(i) == 1) {
            printf ("%5d", i);
            count++;
        }
        i++;
    }
}

int fibonacci(int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    return fibonacci(n-1) + fibonacci(n-2);
}

void checkFibonacci(int n) {
    int count = 0;
    for (int i = 0; i <= n; i++) {
        if (n == fibonacci(i))
            count++;
    }
    if (count == 1)
        printf ("It's a Fibonacci term");
    else
        printf ("It's not a Fibonacci term");
}

int sumOfDigit(int n) {
    int s = 0, r;
    while (n > 0) {
        r = n % 10;
        s = s + r;
        n /= 10;
    }
    return s;
}

char getUserChoice() {
    int c;
    printf ("1-The first primes"
            "\n2-Fibonacci element"
            "\n3-Sum of digits"
            "\n4-Quit"
            "\nChoose an option: ");
    fflush(stdin);
    scanf ("%c", &c);
    return c;
}

