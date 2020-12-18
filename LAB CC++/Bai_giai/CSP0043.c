#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

#define MAXN 100

int isFull(int list[], int *n) {
	return ((*n) == MAXN);
}

int isEmpty(int list[], int *n) {
	return ((*n) == 0);
}

void addValue(int list[], int *n) {
	char c[10];
	int i;
	int existed;
	do {
		printf("Add a value: ");
		fflush(stdin);
		scanf("%[^\n]", c);
		existed = 1;
		int len = strlen(c) - 1;
		for(i = 0; i <= len && existed == 1; i++) {
			if(c[i] >= '0' && c[i] <= '9' || c[i] == '-') {
				existed = 1;	
			}
			else {
				printf("Error!\n");
				existed = 0;
			}		
		}
	} while(!existed);
	int num = atoi(c);
	list[*n] = num;
    (*n)++;
	printf("Added!\n");
    system("pause");
    system("cls");
}

void search(int list[], int *n) {
	int i, x, count = 0;
	printf("Enter founded element: ");
	scanf("%d", &x);	
	for(i = 0; i < *n; i++) 
		if(list[i] == x) {
			count++;
			printf("Found %d at %d position\n", x, i);
		}
	if(count == 0)
		printf("Not find!\n");
}

void removeFirst(int list[], int *n) {
	int i, j, x, temp;
	printf("Enter element: ");
	scanf("%d", &x);
	int flag = 1;
	for(i = 0; i < (*n) && flag == 1; i++) {
		if(x == list[i]) {
			temp = i;
			flag = 0;	
		}
	}
	
	for(i = temp; i < *n && flag == 0; i++) {
		list[i] = list[i + 1];
	}
	if(flag == 1) {
		printf("Unremoved!\n");
	} else {
		printf("Removed!\n");
		(*n)--;
	}
	system("pause");
	system("cls");
}

void removeAll(int list[], int *n) {
	int i, j, x, count = 0,k;
	
	printf("Enter element: ");
	scanf("%d", &x);

	for(i = 0; i < (*n); i++) {
		for(j = i; j < (*n); j++) {
			if(list[j]== x) {
				for(k = j; k < (*n); k++) {
					list[k] = list[k + 1];
				}
				(*n)--;
				count = 1;
			}
		}
	}
	
	if(count == 0) {
		printf("Unremoved!\n");
	} else {
		printf("Removed!\n");
	}
	
	system("pause");
	system("cls");
}

void sortAscending(int list[], int *n) {
	int i,j;
	for(i = 0; i < *n - 1; i++) 
		for(j = *n - 1; j > i; j--)
			if(list[j] < list[j - 1]) {
				int temp = list[j];
					list[j] = list[j - 1];
					list[j - 1] = temp;
			}	
	printf("Sorted!\n");
	system("pause");
    system("cls");	
}

void sortDescending(int list[], int *n) {
	int i,j;
	for(i = 0; i < *n - 1; i++) 
		for(j = i + 1; j < *n; j++) 
			if(list[i] < list[j]) {
				int temp = list[i];
					list[i] = list[j];
					list[j] = temp;
			}		
	printf("Sorted!\n");
	system("pause");
    system("cls");		
}

void print(int list[], int *n)
{
	int i, j;
	for (i = 0; i < (*n); i++)
		{
			printf("Element[%d] : %d \n", i, list[i]);
		}
	system("pause");
    system("cls");
}

char getUserChoice()
{
    int c;
    printf("\t--------MENU--------\n");
    printf("\t1-Add a value\n");
    printf("\t2-Search a value\n");
    printf("\t3-Remove the first existence of a value\n");
    printf("\t4-Remove all existences of a value\n");
    printf("\t5-Print out the array\n");
    printf("\t6-Sort the array in ascending order\n");
    printf("\t7-Sort the array in descending order \n");
    printf("\tOther-Quit\n");
    printf("Choice = ");
    fflush(stdin);
    scanf("%c", &c);
    return c;
}



int main() {
	char userChoice;
	int list[MAXN];
	int n = 0;
	do {
		userChoice = getUserChoice();
		switch(userChoice) {
			case '1':
				if(isFull(list, &n)) printf("Imposible to add!\n"); 
				else addValue(list, &n); break;
			case '2':
				if(isEmpty(list, &n)) {
					printf("Nothing to search!\n");
					system("pause");
    				system("cls");
				}
				else search(list, &n); break;
			case '3': 
				if(isEmpty(list, &n)) {
					printf("Nothing to remove!\n");
					system("pause");
    				system("cls");
				}
				else removeFirst(list, &n); 				
 				break;
			case '4': 
				if(isEmpty(list, &n)) {
					printf("Nothing to remove!\n");
					system("pause"); 
					system("cls");
				}
				else removeAll(list, &n); 
				break;
			case '5':
				if(isEmpty(list, &n)) {
					printf("List is empty!\n");
					system("pause");
    				system("cls");
				}
				else print(list, &n); break;
			case '6': 
				if(isEmpty(list, &n)) {
					printf("Nothing to sort!\n");
					system("pause");
    				system("cls");
				}
				else sortAscending(list, &n); 
 				break;
			case '7':
				if(isEmpty(list, &n)) {
					printf("Nothing to sort!\n");
					system("pause");
    				system("cls");
				}
				else sortDescending(list, &n); 
				break;
			default: printf("Goodbye!"); break;
		}
	} while(userChoice >= '1' && userChoice <= '7');
	return 0;
}
	
