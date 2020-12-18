#include <stdio.h>
#include <string.h>
void find_frequency(char [], int []);
 
int main()
{
   char string[100];
   int c, count[26] = {};
   int s[100], dem=0, j = 0, max, i;
   char kt[100];
   printf("Input a string\n");
   fgets(string, 100, stdin);
 
   find_frequency(string, count);
   
   printf("Character Count\n");
   for (c = 0 ; c < 26 ; c++) {
   		if (count[c] > 0) {
      		printf("%c \t  %d\n", c + 'a', count[c]);
      		s[dem] = count[c];
      		kt[dem] = c + 'a';
      		dem++;
      		j++;
      	}
   }
   
   	printf ("-----------------------------------\n");
    printf ("Characters that appear the most: "); 
	dem = j = dem - 1;
	max = s[dem];
	while(dem >= 0) {
		if(s[dem] < s[dem - 1])
			max = s[dem - 1];

		dem--;
	}
	while(j >= 0) {
		if(s[j] == max)
			printf("\n%c \t %d\n", kt[j], max);
		j--;
	}

   return 0;
}

void find_frequency(char s[], int count[]) {
   int c = 0;
   while (s[c] != '\0') {
      if (s[c] >= 'a' && s[c] <= 'z' )
         count[s[c]-'a']++;
      if (s[c] >= 'A' && s[c] <= 'Z')
      	 count[s[c]-'A']++;
      c++;  
   }
}



