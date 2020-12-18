#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX 1000

void foundCharacters(char s[], int count[]);

int main () {
	char string[MAX];
	char k;
	int c;
	do {
		int count[26] = {0};
		printf ("Please enter a string: ");
		fgets(string, sizeof(string), stdin);
		foundCharacters(string, count);
		printf ("Found Characters: ");
		for (c = 0; c < 26; c++) {
			if (count[c] == 1)
				printf ("%c   ", c + 'a');
		}
		printf ("\n--------------------\n"
				"Press nay key to continute, Esc to exit.\n");
		k = getch();
		if (k == 27)
			return EXIT_SUCCESS;
	} while (k != 27);
	return 0;
}

void foundCharacters(char s[], int count[]) {
	int c = 0;
	strlwr(s);
	while (s[c] != '\0') {
		if (s[c] >= 'a' && s[c] <= 'z')
			count[s[c] - 'a']++;
		c++;
	}
}
