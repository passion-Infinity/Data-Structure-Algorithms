#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFile(char* pathFile);

int main () {
	char name[20];
	printf("Enter file name: ");
	scanf("%[^\n]", name);
	readFile(name);
//    readFile("./data.txt");
    return EXIT_SUCCESS;
}

void readFile(char *pathFile) {
    FILE *f;
    char c;
    
    f = fopen(pathFile,"r+");
    if (f == NULL) {
        printf ("It hasn't existed this file!");
    } else {
        char *fileName = strrchr(pathFile, '/') + 1;
        printf ("File name: %s\n", fileName);
        printf ("File content:\n");
        
        c = fgetc(f);
        while (c != EOF) {
            printf ("%c", c);
            c = fgetc(f);
        }
    }
    printf ("\n");
    fclose(f);
}
           
