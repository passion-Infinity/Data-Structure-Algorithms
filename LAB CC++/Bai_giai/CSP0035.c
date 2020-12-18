#include <stdio.h>
#include <stdlib.h>

void nhapMaTran(int** a, int dong, int cot);
void xuatMaTran(int** a, int dong, int cot);
void SumOfMatrix(int **a, int **b, int **c, int dong, int cot);

int i, j;

int main () {
    int **a = NULL, **b = NULL, **c = NULL;
    int dong, cot;
    printf ("Nhap so dong: ");
    scanf ("%d", &dong);
    printf ("Nhap so cot: ");
    scanf ("%d", &cot);
    
    printf ("Nhap ma tran m1: \n");
    a = (int **) malloc (dong * sizeof(int *));
    for (i = 0; i < dong; i++) {
        a[i] = (int *) malloc (cot * sizeof(int));
    }
    nhapMaTran(a, dong, cot);
    xuatMaTran(a, dong, cot);
    
    printf ("Nhap ma tran m2: \n");
    b = (int **) malloc (dong * sizeof(int *));
    for (i = 0; i < dong; i++) {
        b[i] = (int *) malloc (cot * sizeof(int));
    }
    nhapMaTran(b, dong, cot);
    xuatMaTran(b, dong, cot);
    
    c = (int **) malloc (dong * sizeof(int *));
    for (i = 0; i < dong; i++) {
        c[i] = (int *) malloc (cot * sizeof(int));
    }
    
    printf ("m = m1 + m2: \n");
    SumOfMatrix(a, b, c, dong, cot);
    xuatMaTran(c, dong, cot);
    
    for (i = 0; i < dong; i++) {
        free(a[i]);
        free(b[i]);
        free(c[i]);
    }
    free(a);
    return 0;
}

void nhapMaTran(int **a, int dong, int cot) {
    for (i = 0; i < dong; i++) {
        for (j = 0; j < cot; j++) {
            printf ("a[%d][%d]= ", i, j);
            scanf ("%d", &a[i][j]);
        }
    }
}

void xuatMaTran(int **a, int dong, int cot) {
    for (i = 0; i < dong; i++) {
        for (j = 0; j < cot; j++) {
            printf ("%5d", a[i][j]);
        }
        printf ("\n");
    }
}

void SumOfMatrix(int **a, int **b, int **c, int dong, int cot) {
    for (i = 0; i < dong; i++) {
        for (j = 0; j < cot; j++) {
            c[i][j] = a[i][j] + b[i][j];
        }
    }
}
