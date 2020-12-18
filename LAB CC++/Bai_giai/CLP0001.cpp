#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXN 350000
#define MAX 30

char a[MAXN][MAX];
char word[MAXL];
int n = 0;

int readFile() {
	FILE *fin = fopen("dictionary.txt", "r");
	if(fin == NULL) 
		return 1;
	
	while (!feof(f)) {
		fscanf(f, "%[^\n]\n", a[n++]);
		fflush(f);
	}
	fclose(f);
	
	return 0;
}

int subString(char longstr[MAXL], char shortstr[MAXL]) {
	char a[MAXL], b[MAXL];
	strcpy(a, longstr);
	strcpy(b, shortstr);
	if(strstr(a, b) == NULL) 
		return 0;
	return 1;
}

int subSequence(char x[MAXL], char y[MAXL]) {
	char a[MAXL], b[MAXL];
	strcpy(a, x);
	strcpy(b, y);
	if(strcmp(a, b) == 0) 
		return 1;
	return 0;
}

int main () {
	printf("Welcome to the SPELL CHECKER!");
	if(readFile() == 1) printf("File not found!");
	else printf("The dictionary has been loaded!");
	
	
}






