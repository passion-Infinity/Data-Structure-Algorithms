#include <stdio.h>
#include <stdlib.h>
#define MAXN 100


int main () {
	int a[MAXN];
	int k = 0;
	int n;
	
	printf("Enter elements array: \n");
	do {
		scanf("%d", &n);
		a[k] = n;
		if(n != 0)
			k++;
	} while(n != 0);
	
	
	printf("Array elements: \n");
	int max = a[0];
	int i;
	for(i = 0; i < k; i++) {
		printf("%5d", a[i]);
		if(a[i] > max) max = a[i];
	}
	
	printf("\n\n");
	
	printf("Array maximum value: %d", max);
	
	printf("\n\n");
	printf("Array even value: ");
	for(i = 0; i < k; i++) {
		if(a[i] % 2 == 0)
		printf("%5d", a[i]);
	}
	return 0;
}


