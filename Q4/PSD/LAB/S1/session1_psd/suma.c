#include <stdio.h>
#include <stdlib.h>
int min=1;
#define VEC_SIZE 4096
int V[VEC_SIZE];
int funciones=0;
int suma(int *origen,int *dest,int size)
{
	int i,total;
	funciones++;
	total=0;
	for (i=0;i<size;i++) total=total+origen[i]+dest[i];
	return total;
}
int suma_rec(int *origen,int *dest,int size)
{
	int med;
	funciones++;
	if (size>min){
		med=size/2;
		return suma_rec(origen,&origen[med],med) +  suma_rec(dest,&dest[med],med);
	}else return suma(origen,dest,size);
}
	
int main(int argc,char *argv[])
{
	int i,total=0,med;
	for (i=0;i<VEC_SIZE;i++){
		V[i]=1;
	}
	if (argc>1) min=atoi(argv[1]);
	med=VEC_SIZE/2;
	total=suma_rec(&V[0],&V[med],VEC_SIZE/2);
	printf("El total es %d tareas=%d min=%d\n",total,funciones,min);
}
