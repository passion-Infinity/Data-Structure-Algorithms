#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAXN 100

int isFull(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	return ((*pn) == MAXN);
}

int isEmpty(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	return ((*pn) == 0);
}

void add(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	char item[50], id[10], cost[10], pc[5];
	int i, existed;
	do {
		printf("What is the ID number of the item to add? \n");
		fflush(stdin);
		scanf("%[^\n]", id);
		printf("What is the name of the item to be added? \n");
		fflush(stdin);
		scanf("%[^\n]", item);
		printf("What is the cost the item to be added? \n");
		fflush(stdin);
		scanf("%[^\n]", cost);
		printf("What is the product category of the item to be added? \n");
		fflush(stdin);
		scanf("%[^\n]", pc);
		existed = 1;
		for ( i = 0; i < *pn; i++)
			if (strcmp(item,list[i]) == 0) 
				{
					printf("=====Name existed!Retype!\n");
					existed = 0;
					i = *pn - 1;
				}
		for(i = 0; i < *pn; i++)
			if(strcmp(id, listID[i]) == 0) 
				{
					printf("====ID existed!Retype!\n");
					existed = 0;
					i = *pn - 1;					
				}
		for(i = 0; i < *pn; i++)
			if(strcmp(pc, listPc[i]) == 0) 
				{
					printf("====Product category existed!Retype!\n");
					existed = 0;
					i = *pn - 1;					
				}								
	} while (!existed);
    strcpy(list[*pn], item);
    strcpy(listID[*pn], id);
    strcpy(listCost[*pn], cost);
    strcpy(listPc[*pn], pc);
    (*pn)++;
    printf("%s have been added into the database!\n", item);
    system("pause");
    system("cls");
}

void search(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	char item[30];
	int i;
	printf("Searching for : ");
	fflush(stdin);
    scanf("%[^\n]", item);
	for (i = 0; i < *pn; i++)
		{
			char * ptr = strstr(list[i], item);
			if (ptr != '\0') printf("ID: %s\t\tItem: %s\t\tCost: %s\t\tSize: %s\n", listID[i], list[i], listCost[i], listPc[i]);
		}
    system("pause");
    system("cls");		
}

void print(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	int i;
	printf("ID\t\t\tItem\t\t\tCost\t\t\tSize\n");
	for (i = 0; i < *pn; i++)
		{
			printf("%s\t\t\t%s\t\t\t%s\t\t\t%s\n", listID[i], list[i], listCost[i], listPc[i]);
		}
	system("pause");
    system("cls");	
}

void deleteItem(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	printf("====NOTE: Please try to remember the ID of item you want to delete from database!\n");		
	print(list, listID, listCost, listPc, pn);
	char del[10];
	char s[50];
	printf("Which ID you want to delete? \n");
	fflush(stdin);
	scanf("%[^\n]", del);
	int i, temp, j, flag = 1;
	for(i = 0; i < *pn && flag == 1; i++) {
			if(strcmp(listID[i], del) == 0) {
				temp = i;
				strcpy(s, list[i]);
				for(i = temp + 1; i < *pn; i++) {
					strcpy(list[i - 1], list[i]);
					strcpy(listID[i - 1], listID[i]);
					strcpy(listCost[i - 1], listCost[i]);
					strcpy(listPc[i - 1], listPc[i]);
				}	
				printf("%s have been deleted from the database!\n", s);
				(*pn)--;
				flag = 1;
			} else {
				printf("Sorry, there is no item in the database with that ID number.\n");
				flag = 0;
			}
	}
	system("pause");
    system("cls");	
}

void changeCost(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	printf("====NOTE: Please try to remember the ID of item you want to change the cost!\n");
	print(list, listID, listCost, listPc, pn);
	char newcost[10], thisID[10];
	printf("What is the ID number of the item in question? \n");
	fflush(stdin);
	scanf("%[^\n]", thisID);
	printf("What is the new price for Corn? \n");
	fflush(stdin);
	scanf("%[^\n]", newcost);
	int i;
	for(i = 0; i < *pn; i++) {
		if(strcmp(thisID, listID[i]) == 0) {
			strcpy(listCost[i], newcost);
		}
	}
	printf("The cost have been changed!\n");
	system("pause");
    system("cls");	
}

void processFile(char list[MAXN][50], char listID[MAXN][10], char listCost[MAXN][10], char listPc[MAXN][5], int *pn) {
	int i;
	char c[5], pathFile[20];
	printf("Would you like to save the changes made to the database?\n");
	fflush(stdin);
	scanf("%[^\n]", c);
	if(strcmp("yes", c) == 0) {
		printf("What file would you like to save the new database?\n");
		fflush(stdin);
		scanf("%[^\n]", pathFile);
		FILE *fout;
		fout = fopen(pathFile, "w");
		for (i = 0; i < *pn; i++)
			{
				fprintf(fout,"%s %s %s %s\n", listID[i], list[i], listCost[i], listPc[i]);
			}
		printf("The file has been saved. Thanks for shopping!\n");
		fclose(fout);			
		system("pause");
	    system("cls");		
	} else {
		printf("Goodbye!\n");
	}	
}

char getUserChoice() {
    int c;
    printf("Please make one of the following selections:\n");
    printf("1-Add new item\n");
    printf("2-Delete item\n");
    printf("3-Change the cost of an item\n");
    printf("4-Search for item\n");
    printf("5-Display inventory details\n");
    printf("6-Quit\n");
    printf("Choice = ");
    fflush(stdin);
    scanf("%c", &c);
    return c;
}

int main() {
	char userChoice;
	char list[MAXN][50], listID[MAXN][10], listCost[MAXN][10], listPc[MAXN][5];
	int n = 0;
	int flag = 1;
	do {
		userChoice = getUserChoice();
		switch(userChoice) {
			case '1':
				if(isFull(list, listID, listCost, listPc, &n)) printf("Imposible to add!\n");
				else add(list, listID, listCost, listPc, &n); flag = 1; break;
			case '2':
				if(isEmpty(list, listID, listCost, listPc, &n)) {
					printf("Nothing to delete!\n");
					system("pause");
					system("cls");
				} else deleteItem(list, listID, listCost, listPc, &n); flag = 1; break;
			case '3':
				if(isEmpty(list, listID, listCost, listPc, &n)) {
					printf("Nothing to change!\n");
					system("pause");
					system("cls");					
				} else changeCost(list, listID, listCost, listPc, &n); flag = 1; break;
			case '4':
				if(isEmpty(list, listID, listCost, listPc, &n)) {
					printf("Nothing to search!\n");
					system("pause");
					system("cls");					
				} else search(list, listID, listCost, listPc, &n); flag = 1; break;
			case '5':
				if(isEmpty(list, listID, listCost, listPc, &n)) {
					printf("Nothing to print!\n");
					system("pause");
					system("cls");
				} else print(list, listID, listCost, listPc, &n); flag = 1; break;
			case '6':
				processFile(list, listID, listCost, listPc, &n); flag = 0; break;
		}
		if(userChoice < '1' || userChoice > '6') printf("Only 1 to 6!\n");
	} while(flag);
	return 0;
}























