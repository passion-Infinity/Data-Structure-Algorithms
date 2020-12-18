#include <stdio.h>
#include <stdlib.h>

void inputArray(int *a, int n);
void outputArray(int *a, int n);
void sortArray(int *a, int n);
void swap(int *a, int *b);
void addValueInArray(int *a, int *n, int val, int pos);

int main () {
	int *arr, n;
	printf ("Please enter size of array: ");
	scanf ("%d", &n);
	arr = (int *)malloc(n * sizeof(int));
	inputArray(arr, n);
	sortArray(arr, n);
	printf ("---The array after sorting: ");
	outputArray(arr, n);
	printf ("\n---Please enter new value: ");
	int val;
	scanf ("%d", &val);
	addValueInArray(arr, &n, val, n);
	sortArray(arr, n);
	printf ("---New array:  ");
	outputArray(arr, n);
	free(arr);
	return 0;
}

void inputArray(int *a, int n) {
	int i;
	for (i = 0; i < n; i++) {
		printf ("Enter element[%d]:  ", i);
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

void sortArray(int *a, int n) {
	int i, j;
	for (i = 0; i < n - 1; i++) {
		for (j = i + 1; j < n; j ++) {
			if (a[i] > a[j])
				swap((a + i), (a + j));
		}
	}
}

void addValueInArray(int *a, int *n, int val, int pos) {
	int i;
	for (i = *n; i > pos; i--) {
		a[i] = a[i - 1];
	}
	a[pos] = val;
	*n = *n + 1;
}
