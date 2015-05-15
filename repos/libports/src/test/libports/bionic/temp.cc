/*
* \author Paramesh O(IITM)
*
*/


/* Genode includes */
#include <base/printf.h>

/* libC includes */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

void *addr;


int main(int argc, char **argv)
{
	
	
	printf("--- Bionic test ---\n");

	printf("Does printf ");
	printf("work? \n");
	printf("We can find out by printing a floating-point number: %f. How does that work? \n", 1.2345);
	
	
	/*malloc() test */
	printf("Malloc test\n");
	addr = malloc(1234);
	printf("Malloc returned addr = %p \n", addr);
	free(addr);
	
	/* strcmp test case */
	char *A="123", *B="bionic",*C;
	
	printf("string A=%s B=%s  \n",A,B);	
	printf("string lengths : A=%d 	B=%d \n", (int)strlen(A),(int)strlen(B));
	
	/* strcpy() */
	C=(char *)malloc(sizeof("abcd"));
	strcpy(C,"abcd");
	
	printf("strcpy(C,A): A= %s C=%s \n", A,C);
	
	if(strcmp(A,B)==0)  printf("strcmp(A,B): string are equal \n");
	else  printf("strcmp(A,B): strings are not equal \n");
	
	/* calloc() */
	int *pData = (int*) calloc (5,sizeof(int));
	for(int i=0;i<4;i++){
		pData[i]=i;
	}
	printf("calloc test \n");
	for(int i=0;i<4;i++){
		printf("%d ",pData[i]);
	}
	printf("\n");
	
	/* rand functions */
	srand(10);
	printf("rand() : rand()/100 = %d  \n ",rand()%100);	
	
	/* atoi() */
	int q=atoi(A);
	printf("atoi() : A=%s q=%d \n",A,q);
	
	/* strchr() */
	printf(" strchr(A,'i')=%c strncpy(C,A,3)=%s\n",*strrchr(B,'i'),strncpy(C,A,3));
				
	printf("--- returning from main ---\n");
	
	return 0;
}
