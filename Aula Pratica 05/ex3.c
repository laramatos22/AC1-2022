#include<stdio.h>
#define SIZE 10
#define TRUE 1
#define FALSE 0

void main(void) {
	static int lista[SIZE];
	int houveTroca, i, aux;

	// inserir aqui o código para leitura de valores e
	// preenchimento do array
	int *p;
	p = lista;
	for(p = lista; p < lista + SIZE; p++)
	{
		printf("\nIntroduza um numero: ");		// print_string()
		scanf("%d", p);							// *p = read_int()
												// p++
	}

	do
	{
		houveTroca = FALSE;
		for (i = 0; i < SIZE - 1; i++)
		{
			if (lista[i] > lista[i+1])
			{
				aux = lista[i];
				lista[i] = lista[i+1];
				lista[i+1] = aux;
				houveTroca = TRUE;
			}
		}
	} while (houveTroca==TRUE);

	// inserir aqui o código de impressão do conteúdo do array
	printf("\nConteudo do array: ");
	for(i=0; i < SIZE; i++)
	{
		printf("%d", lista[i]);				    // print_int10(lista[i])
		printf("; ");							// print_string("; ")
	}
}