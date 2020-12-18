#include <stdio.h>
#include <stdlib.h>
#include <math.h>

char getUserChoice() {
    int c;
    printf("MENU\n"
           "----------------------"
           "\n1- Quadratic equation"
           "\n2- Bank deposit problem"
           "\n3- Quit"
           "\nEnter your choice: ");
    fflush(stdin);
    scanf ("%c", &c);
    return c;
}

void quadraticEquation() {
    	float delta, a, b, c;
		printf ("Enter a, b, c = ");
		scanf ("%f %f %f", &a, &b, &c);
	if (a == 0) {
		if (b == 0) {		
			if (c == 0) {		
				printf ("Phuong trinh co vo so nghiem.\n");
			}
			else {		
				printf ("Phuong trinh vo nghiem.\n");
			}
		}
		else {		
			printf ("Phuong trinh co nghiem x = %.2f\n", -c / b);
		}
	}
	else {		
		delta = b*b - 4*a*c;
		if (delta < 0) {
			printf ("Phuong trinh vo nghiem.\n");
		}
		else {		
			if (delta == 0) {
				printf ("Phuong trinh co nghiem kep x = %.2f\n", -b / (2 * a));
			}
			else {		
				printf ("Phuong trinh co 2 nghiem phan biet:\n");
				printf ("x1 = %.2f\t", (-b + sqrt(delta)) / (2 * a));
				printf ("x2 = %.2f\n\n", (-b - sqrt(delta)) / (2 * a));
			}
		}
	}	
}

void calculateBank() {
    float tienvon, tiennhan;
    float laisuat;
    int sothang;
    printf("Tien von gui ngan hang: ");
    scanf("%f", &tienvon);
    printf("Lai suat trong 1 thang: ");
    scanf("%f", &laisuat);
    printf("So thang gui ngan hang: ");
    scanf("%d", &sothang);
    
    tiennhan = tienvon * pow((1 + laisuat), sothang);
    
    printf("So tien nhan duoc sau %d nam: %f\n\n", sothang, tiennhan);
    
}

int main() {
    char userChoice;
    do {
        userChoice = getUserChoice();
        switch(userChoice) {
            case '1': quadraticEquation(); break;
            case '2': calculateBank(); break;
            case '3': printf("Bye! See you late.\n\n");   
        }
        if (userChoice < '1' || userChoice > '3') printf ("1 to 3 only!\n");
    } while (userChoice != '3');
    return 0;
}
