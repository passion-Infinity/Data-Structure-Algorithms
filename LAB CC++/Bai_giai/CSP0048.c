#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFile(char pathFile[]);
void writeFile(char pathFile[]);

int main () {
    char pathFile[] = "./data.txt";
    writeFile(pathFile);
    readFile(pathFile);
    return EXIT_SUCCESS;
}

void readFile(char pathFile[]) { 
    FILE *f;
    f = fopen(pathFile,"r");
    printf("\n\nFile content: \n");
    char c;
    c = fgetc(f);
    while (c != EOF) {
        printf ("%c", c);
        c = fgetc(f);
    }
    fclose(f);
}

void writeFile(char pathFile[]) {
    FILE *f;
    f = fopen(pathFile,"a+");
    char *p;
    p = malloc(sizeof(char)*50);
    printf ("Enter content: ");
    if (p != NULL) {
        fgets(p, 255, stdin);
        fprintf(f,"%s", p);
    }
    fclose(f);
}
