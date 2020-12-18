#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void accept(char list[50][30], int n) {
	char c[30];
	int i;
	for(i = 0; i < n; i++) {
		fflush(stdin);
		scanf("%[^\n]", c);
		strcpy(list[i], c);
	}	
}

void print(char list[50][30], int n) {
	int i;
	for(i = 0; i < n; i++) {
		printf("%d. %s\n", i + 1, list[i]);
	}
}

void sort(char list[50][30], int n) {
	int i, j;
	for(i = 0; i < n - 1; i++)
		for(j = n - 1; j > i; j--) 
			if(strcmp(list[j], list[j - 1]) < 0) {
				char t[30];
				strcpy(t, list[j]);
				strcpy(list[j], list[j - 1]);
				strcpy(list[j - 1], t);
			}
}

int main() {
	int n;
	char list[50][30];
	printf("Enter the value of n: ");
	scanf("%d", &n);
	printf("Enter %d names\n", n);
	fflush(stdin);
	accept(list, n);
	printf("List input name: \n");
	print(list, n);
	printf("List sort name: \n");
	sort(list, n);
	print(list, n);
	return 0;
}













