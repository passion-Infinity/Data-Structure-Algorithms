#include <stdio.h>
#include <stdlib.h>

char *checkCase(char c[]) {
	int i;
	int len = strlen(c);
	for(i = 0; i < len; i++) {
		if(c[i] >= 'a' && c[i] <= 'z') {
			c[i] = c[i] - 32;
		}
		else if(c[i] >= 'A' && c[i] <= 'Z') {
			c[i] = c[i] + 32;
		}
	}
	return c;
}

int main () {
	char c[100];
	printf("Enter a string: ");
	fflush(stdin);
	fgets(c, 100, stdin);
	printf("\t%s", strrev(checkCase(c)));
	return 0;
}
