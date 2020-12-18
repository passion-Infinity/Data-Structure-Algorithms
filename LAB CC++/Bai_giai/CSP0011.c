#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

void binaryToDecimal(char bin[]) {
    int dec = 0, i, p =0;
    int len = strlen(bin);
    for(i = len - 1; i >= 0; i--)
    	if(bin[i] >= '0' && bin[i] <= '1') {
    		dec += (bin[i] - 48) * pow(2, p);
    		p++;
		}
		else {
			printf("Error!!!");
			return;
		}
    printf("\nDecimal is : %d\n", dec);
}

void octalToDecimal(char oct[]) {
    int dec = 0, i , p = 0;
    int len = strlen(oct);
    for(i = len - 1; i >= 0; i--) {
    	if(oct[i] >= '0' && oct[i] <= '7'){
    		dec += (oct[i] - 48) * pow(8, p);
			p++;
		}
		else{
			printf("Error!!!");
			return;
		}
	}
    printf("\nDecimal is : %d\n", dec);
}

 
void hexadecimalToDecimal(char hex[]) {
    int len = strlen(hex);
    int dec =  0;
    int p = 0;
    int i;
	for ( i = len - 1; i >= 0; i--) {
        if (hex[i] >= '0' && hex[i] <= '9') {
            dec += (hex[i] - 48) * pow(16, p);
            p++;
        }
        else if (hex[i] >= 'A' && hex[i] <= 'F') {
            dec += (hex[i] - 55) * pow(16, p);
            p++;
        }
        else if (hex[i] >= 'a' && hex[i] <= 'f') {
        	dec += (hex[i] - 87) * pow(16, p);
        	p++;
		}
        else {
        	printf("Error!!!\n");
        	return;
		}
    }
    printf("\nDecimal is : %d\n", dec);
}

char getUserChoice() {
    int c;
    printf ("\n1-Convert binary number to decimal number."
            "\n2-Convert octal number to decimal number."
            "\n3-Convert hexadecimal number to decimal number."
            "\n4.EXit."
            "\nPlease choice number(1-4): ");
    fflush(stdin);
    scanf("%c", &c);
    return c;   
}

int main () {
    char userChoice;
    do {
        userChoice = getUserChoice();
        switch(userChoice) {
            case '1': {
            	system("cls");
                char n[100];
                printf ("\n Enter binary number: ");
                fflush(stdin);
				gets(n);
                binaryToDecimal(n);
                printf ("\n\n");
                break;
				}	
                
            case '2': {
            	system("cls");
            	char n[100];
                	printf("Enter octal number: ");
                	fflush(stdin);
					gets(n);
                	octalToDecimal(n);
                	printf ("\n\n");			
                break;
            	}
            	
            case '3': {
            	system("cls");
                fflush(stdin);
                char c[100];
                
                printf ("Enter hexadecimal number: ");
                fflush(stdin);
                gets(c);
                hexadecimalToDecimal(c);
                printf ("\n\n");
                break;
            	}
            
			case '4': {
                printf ("\nGoodbye! ");
                printf ("\n");
                break;
            }
        }
        if (userChoice < '1' || userChoice > '4') {
        	system("cls");
        	printf ("=-=-=-= Only 1 to 4! =-=-=-=\n");
		}		
    }while (userChoice != '4');
    return 0;
}

