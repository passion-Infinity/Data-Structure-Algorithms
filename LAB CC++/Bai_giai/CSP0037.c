#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <stdbool.h>

int main() {
	double n;
	while(true) {
	printf("Check Square Number Program\n");
		do {
			printf("Enter a positive number: ");
			scanf("%lf", &n);
			if(n < 0) {
				printf("Please enter a positive number!\n");
				system("pause");
			}
		} while(n < 0);
		
		int a = sqrt(n);
		if(n == (int)pow(a, 2)) {
			printf("%lf is a square number %lf = %d x %d\n", n, n, a, a);
			system("pause");
			system("cls");
		}
			
		else {
			printf("%lf is not a square number\n", n);
			system("pause");
			system("cls");		
		}
		printf("Press any key to continute. ESC to exit.\n");
		char c = getch();
		system("cls");
		if(c == 27) break;	
	}		
}
