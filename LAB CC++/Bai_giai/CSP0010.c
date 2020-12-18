#include <stdio.h>
#include <stdlib.h>

void nhap(int a[], int n);
void xuat(int a[], int n);
void xoaPhanTu(int a[], int n);

int main () {
    int arr[100];
    int n;
    printf("Please enter size of array: ");
    scanf ("%d", &n);
    nhap(arr, n);
    printf("The array before deleting: ");
    xuat(arr, n);
    printf ("\n");
    xoaPhanTu(arr, n);
    return 0;
}

void nhap(int a[], int n) {
	int i;
    for (i = 0; i < n; i++) {
        printf("Element[%d]: ", i);
        scanf("%d", &a[i]);
    }
}

void xuat(int a[], int n) {
	int i;
    for (i = 0; i < n; i++) {
        printf("%5d", a[i]);
    }
}

void xoaPhanTu(int a[], int n) {
    int b[100];
    int count = 0;
    int i, j;
    for (i = 0; i < n; i++) {   
	    for (j = 0; j < count; j++) {
	      if(a[i] == b[j])
	        break;
	    }
	    if (j == count)
	    {
	      b[count] = a[i];
	      count++;
	    }
  	}
    printf("The array after deleting: ");
    for (i = 0; i < count; i++) {
        printf("%5d", b[i]);
    }
}
