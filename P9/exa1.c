#include <stdio.h>

extern int getBit (int value, int numBit);
extern int suma( int num1, int num2);
extern int strlen1 (char *);
extern char *strchr( char *, int);

int main() {
    printf ("En bit %d del dato: %d es %d\n", 0, 1, getBit(1, 0));
    printf ("La suma de %d y %d es = %d\n", 5, 4, suma(5, 4));
    printf("Longitud de la Cadena : %d\n", strlen1("pelzs"));
    printf("'l' Esta en: %p\n", strchr("Calculando", 'l'));
    return 0;
}
