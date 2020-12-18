#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <windows.h>

const  int MAXN = 100;
const char MAXCHOICE = '5';

char getUserChoice()
{
    int c;
    printf("1-Add a student\n");
    printf("2-Remove a student\n");
    printf("3-Search a student\n");
    printf("4-Print the list in ascending order\n");
    printf("5-Quit\n");
    printf("Choice = ");
    fflush(stdin);
    scanf("%c", &c);
    return c;
}

char *ltrim(char str[]) {
		int i = 0;
		while (str[i] == ' ' || str[i] == '\n') i++;
		if (i > 0) strcpy(&str[0], &str[i]);
		return str;
}

char * rtrim(char str[]) {
	  int i = strlen(str) - 1;
	  while (str[i] == ' ') i--;
	  str[i + 1] = '\0';
	  return str;
}

char *trim(char str[]) {
	 rtrim(ltrim(str));
	 char *ptr = strstr(str, "  ");
	 while (ptr != NULL) {     // while two blank exist
	 	strcpy(ptr, ptr + 1);  //     remove one blank  
	 	ptr = strstr(str, "  ");
	 }
	 return str;
}

char *strtolower(char str[]) {
    int len = strlen(str);
    int i;
    for (i = 0; i < len; ++i) str[i] = tolower(str[i]);
    return str;
}

char *strtoupper(char str[]) {
    int len = strlen(str);
    int i;
    for (i = 0; i < len; ++i) str[i] = toupper(str[i]);
    return str;
}

char *captalize(char str[]) {
    strtolower(str);
    str[0] = toupper(str[0]);
    int len = strlen(str), i;
    for (i = 1; i < len; ++i)
        if (str[i - 1] == ' ') str[i] = toupper(str[i]);
    return str;
}

int countWords(char str[]) {
    int count = str[0] != ' ' ? 1 : 0;
    int len = strlen(str), i;
    for (i = 1; i < len; ++i)
        if (str[i - 1] == ' ' && str[i] != ' ') count += 1;
    return count;
}
char *strShr(char str[], int step) {
    int len = strlen(str), i;
    for (i = len - 1; i >= 0; --i)
        str[i + step] = str[i];
    str[len + step] = 0;
    return str;
}

char *replaceAll(char str[], const char * pat, const char * rep) {
    int len = strlen(str);
    int patL = strlen(pat);
    int repL = strlen(rep);
    int shorter = patL < repL;
    int i, j;
    for (i = 0; i < len; ++i) {
        if (strncmp(str + i, pat, patL) == 0) {
            if (shorter)
                strShr(str + i + patL, repL - patL);
            else
                strcpy(str + i + repL, str + i + patL);
            for (j = i; j < i + repL; ++j)
                str[j] = rep[j - i];
            i += repL;
            len += repL - patL;
        }
    }
    return str;
}

char *cistrstr(const char  str[], const char * substr) {
    int strLen = strlen(str);
    int subLen = strlen(substr);
    int i, j;
    for (i = 0; i <= strLen - subLen; ++i) {
        int matched = 1;
        for (j = 0; j < subLen; ++j)
            if (tolower(substr[j]) != tolower(str[j + i])) {
                matched = 0;
                break;
            }
        if (matched)
            return (char*)str + i;
    }
    return NULL;
}

char *nameStr(char str[]) {
	trim(str);  // trim all extra blank
	strlwr(str);  // covert it  to lowercase
	int i = 0;
	for ( i = 0; i < strlen(str); i++)
		if (i == 0 || str[i-1] == ' ') str[i] = toupper(str[i]);
	return str;

}

int isFull(char list[MAXN][30], int *pn) {
	return ((*pn) == MAXN);
}

int isEmpty(char list[MAXN][30], int *pn) {
	return ((*pn) == 0);
}

void add(char list[MAXN][30], int *pn) {
	char hs[30];
	int i, existed;
	do {
		printf("Add a student : ");
		fflush(stdin);
		scanf("%[^\n]", hs);
		existed = 1;
		for ( i = 0; i < *pn; i++)
			if (strcmp(hs,list[i]) == 0) 
				{
					printf("Name existed!Retype!\n");
					existed = 0;
					i = *pn - 1;
				}
	} while (!existed);
    strcpy(list[*pn], hs);
    (*pn)++;
    printf("Added!\n");
    system("pause");
    system("cls");
}

void search(char list[MAXN][30], int *pn)
{
	int i;
	printf("Searching for : ");
	char hs[30];
	fflush(stdin);
    scanf("%[^\n]", &hs);
	for (i = 0; i < *pn; i++)
		{
			nameStr(hs);
			nameStr(list[i]);
			char * ptr = strstr(list[i], hs);
			if (ptr != '\0') printf("RESULT : Name[%d] : %s\n", i, list[i]);
		}
}
void removed(char list[MAXN][30], int *pn)
{
	search(list, pn);
	printf("Which Name you want to removed?(input a number) : ");
	int del, i;
	scanf("%d", &del);
	if (del >= 0 && del < *pn) {
	for (i = del + 1; i < *pn; i++)
		strcpy(list[i-1], list[i]);
	printf("Removed!\n");
	(*pn)--;
	} else printf("UnRemoved!\n");
	system("pause");
    system("cls");
}
void print(char list[MAXN][30], int *pn)
{
	int i, j;
   	for (i = 0 ; i < *pn-1; i++)
     	for (j = *pn-1; j > i; j--)
     		if (strcmp(list[j] , list[j-1]) < 0)
     			{
     				char t[30];
		            strcpy(t, list[j]);
		            strcpy(list[j], list[j-1]);
		            strcpy(list[j-1], t);
				}
	for (i = 0; i < (*pn); i++)
		{
			nameStr(list[i]);
			printf("Name[%d] : %s \n", i, list[i]);
		}
	system("pause");
    system("cls");
}
void halt()
{
	printf("Goodbye!\n");
	printf("See you later!\n");
}

int main() {
    char userChoice;
    char list[MAXN][30];
    int n = 0;
    do
    {
        userChoice = getUserChoice();
        switch(userChoice)
        {
            case '1':
				if (isFull(list, &n)) printf("Impossible to add!\n");
				else add(list, &n);
				break;
            case '2':
				if (isEmpty(list, &n)) printf("Impossible to remove!\n");
				else removed(list, &n);break;
            case '3':
				if (isEmpty(list, &n)) printf("Nothing to search!\n");
				else search(list, &n);
				system("pause");
			    system("cls");
				break;
            case '4':
				if (isEmpty(list, &n)) printf("Nothing to print!\n");
				else print(list, &n);
				break;
            case '5':
				halt();
				break;
        }
       if (userChoice < '1'  || userChoice >'5') printf("1 to 5 only!\n");
    } while (userChoice != MAXCHOICE);
}
