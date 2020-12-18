#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <conio.h>

void nhap(int a[], int n) {
    for(int i = 0; i < n; i++) {
        printf("Enter an integer: ");
        scanf("%d", &a[i]);
    }
}

int sum(int a[], int n) {
    int s = 0;
    for(int i = 0; i < n; i++) {
        s += a[i];
    }
    return s;
}

int main () {
    int n, *a;
    char c;
    printf("Dynamic memory allocation\n");
    while(true) {
        printf("Number of element: ");
        scanf("%d", &n);
        a = new int[n];
        nhap(a, n);
        printf("Sum = %d", sum(a, n));
        printf("\n----------------------------------");
        printf("\nPress any key to continute, ESC to exit.\n\n");
        c = getch();
        if(c == 27)
            break;
    }
    delete[] a;
    return 0;
}
