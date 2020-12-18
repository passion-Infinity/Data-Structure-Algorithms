#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void processCharater(char s[], int count[]) {
    int c = 0;
    while(s[c] != '\0') {
        if(s[c] >= 'a' && s[c] <= 'z') 
            count[s[c] - 'a']++;
        if(s[c] >= 'A' && s[c] <= 'Z')
            count[s[c] - 'A']++;
        c++;
    }
}

void tanSuat(char str[], int count[]) {
	int tansuat[255];
        int ascii, i, j;

        for (j = 0; j < 255; j++) {
            tansuat[j] = 0;
        }
        
    i = 0;
    while(str[i] != '\0') {
        if(str[i] >= 'a' && str[i] <= 'z') 
            tansuat[(int)str[i]]++;
        if(str[i] >= 'A' && str[i] <= 'Z')
            tansuat[(int)str[i]]++;
        i++;
    }

        int max = 0;
        for (i = 0; i < 255; i++) {
            if (i != 32) {
                if (tansuat[i] > tansuat[max]) {
                    max = i;
                }
            }
        }
        
        for(i = 0; i < 255; i++) {
        	if (tansuat[i] == tansuat[max] && i != 32) {
                char a = (char) i;
                printf("%c \t %d \n", a, tansuat[max]);
		}
	}
}

int main () {
    char string[100];
    int count[26] = {};
    int c;
    
    printf("Input a string: \n");
    fgets(string, 100, stdin);
    
    processCharater(string, count);
    
    printf("Characters \tCount\n");
    for(c = 0; c < 26; c++) {
        if(count[c] > 0) {
            printf("    %c \t\t  %d\n", c + 'a', count[c]);
        }
    }
    
    printf("-----------------------------------\n");
    printf("Characters that appear the most: \n");
    
    tanSuat(string, count);
	
    return  0;
}
