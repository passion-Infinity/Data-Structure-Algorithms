#include <stdio.h>
#include <stdlib.h>

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

int main() {
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
	return 0;
}
