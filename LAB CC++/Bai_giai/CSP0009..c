#include <stdio.h>
#include <stdlib.h>

void nhapMang(int a[], int n) {
	int i;
    for(i = 0; i < n; i++) {
        printf("Element[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

void process(int a[], int n) {
    int min = a[0];
    int i = 1;
	while(i < n) {
		if(min > a[i])
			min = a[i];
		i++;
	}
    int j = 0;
    while(j < n) {
        if(a[j] == min)
            printf("The smallest element: %d - Its position: %d\n", a[j], j);
        j++;
    }
}

int main() {
    int n, a[100];
    printf("Please enter size of array: ");
    scanf("%d", &n);
    nhapMang(a, n);
    process(a, n);
}
