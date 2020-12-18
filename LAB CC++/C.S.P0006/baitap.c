#include <stdio.h>
#include <stdlib.h>

void inputArray(int*, int);
void outputArray(int*, int);
void swap(int*, int*);
void sortDescendinginArray(int*, int);
void sortAscendinginArray(int*, int);

int main () {
	int *arr, n;
	printf ("Please enter size of array: ");
	scanf ("%d", &n);
	arr = (int *)malloc(n * sizeof(int));
	inputArray(arr, n);
	sortAscendinginArray(arr, n);
	printf ("---The array sorted in ascending: \n");
	outputArray(arr, n);
	sortDescendinginArray(arr, n);
	printf ("\n\n\n---The array sorted in descending: \n");
	outputArray(arr, n);
	return 0;
}

void inputArray(int *a, int n) {
	int i;
	for (i = 0; i < n; i++) {
		printf ("Enter element[%d]: ", i);
		scanf ("%d", (a + i));
	}
}

void outputArray(int *a, int n) {
	int i;
	for (i = 0; i < n; i++) {
		printf ("%d   ", *(a + i));
	}
}

void swap(int *a, int *b) {
	int temp = *a;
	*a = *b;
	*b = temp;
}

void sortDescendinginArray(int *a, int n) {
	int i, j;
	for (i = 0; i < n - 1; i++) {
		for (j = i + 1; j < n; j++) {
			if (a[i] < a[j]) 
				swap((a + i), (a + j));
		}
	}
}

void sortAscendinginArray(int *a, int n) {
	int i, j;
	for (i = 0; i < n - 1; i++) {
		for (j = i + 1; j < n; j++) {
			if (a[i] > a[j]) 
				swap((a + i), (a + j));
		}
	}
}
