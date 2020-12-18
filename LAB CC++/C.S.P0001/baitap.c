#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char ketQua[1000];

char* daoNguocTuCoTrongChuoi(char *S){
    int j = 0, dem = 0;
	int i, k;
    for(i = strlen(S); i >= 0; i--){
        if (i == strlen(S) || i == strlen(S)-1)  // doc ky tu '\0' bang cach bo qua
            continue;
        //dem so luong ki tu minh di qua
        dem++;
        //khi gap ky tu '_' thuc hien sao chep tu chuoi qua mang ket qua
        if (S[i] == '_'){
            for(k = i; k < i+dem; k++){
                ketQua[j] = S[k+1];
                j++;
            }
            ketQua[j-1] = '_';
            dem = 0;
        }
        //xu ly tu dau cau
        if (i == 0){
            for(k = i; k < i+dem; k++){
                ketQua[j] = S[k];
                j++;
            }
        }
    }
    ketQua[strlen(S)-1] = '\0';
    return ketQua;
}

int main(){
    char S[300];
    char k;
    do {
	    printf("Nhap vao chuoi: ");
	    fflush(stdin);
	    fgets(S, 300, stdin);
	    printf("Ket qua la: ");
	    char* ketQua = daoNguocTuCoTrongChuoi(S);
	    puts(ketQua);
		printf("\n----------------------\n"
				"Press any key to continute, Esc to exit.\n");	
	    k = getch();
	    if (k == 27)
	    	return EXIT_SUCCESS;
	} while (k != 27);
    return 0;
}
