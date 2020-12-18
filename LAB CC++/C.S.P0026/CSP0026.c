#include <stdio.h>

int conVertBinary(int);

int main () { 
	int n;
	while (69) {
		printf ("---Convert decimal to Binary program");
		printf ("\nEnter a positive number: ");
		scanf ("%d", &n);
		printf ("Binary number: %d\n", conVertBinary(n));
	}
	
	return 0;
}

int conVertBinary(int n) {
	int r, i = 1, b = 0;
	while (n > 0) {
		r = n % 2;
		n = n / 2;
		b = b + i * r;
		i = i * 10;
		
	}
	return b;
}
