#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#define MAX 1000

char* ltrim(char s[]);
char* rtrim(char s[]);
char* trim(char s[]);

int main () {
	char c[MAX];
	char k;
	do {
		printf ("Please enter a string: ");
		fgets(c, sizeof(c), stdin);
		trim(c);
		printf ("The string after removing: ");
		puts(c);	
		printf ("--------------\n");
		printf ("Press any key to continute, ESC to exit.\n");
		k = getch();
		if (k == 27)
			return EXIT_SUCCESS;
	} while (k != 27);
	return 0;
}

char* ltrim(char s[]) {
	int i = 0;
        char* strcopy = NULL;
	while (s[i] == ' ') i++;
	if (i > 0) strcpy(&s[0], &s[i]);
	return s;
}

char* rtrim(char s[]) {
	int i = strlen(s) - 1;
	while (s[i] == ' ') i--;
	s[i + 1] = '\0';
	return s;
}

char* trim(char s[]) {
	rtrim(ltrim(s));
	char *ptr = strstr(s, "  ");
	while (ptr != NULL) {
                strcpy (ptr, ptr + 1);
		ptr = strstr(s, "  ");
	}
	return s;
}
