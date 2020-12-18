#include <stdio.h>
#include <stdlib.h>

void printMultiplication(int);

int main () {
	int n;
	char c;
	do {
		do {
			printf ("Please enter a number(1-9): ");
			scanf ("%d", &n);
			if (n < 0 || n > 10)
				printf ("It doesn't permit. Try again!!!");
		} while (n < 0 || n > 10);
		printMultiplication(n);
		printf ("-----------------------------------\n");
		printf ("Press any key to continute, Esc to exit.\n");
		c = getch();
		if (c == 27)
			return EXIT_SUCCESS;
	} while (c != 27);
	return 0;
}

void printMultiplication(int n) {
	int i;
	for (i = 1; i <= 10; i++) {
		printf ("%d x %d = %d\n", n, i, n * i);
	}
}
