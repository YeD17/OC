#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato);
extern void pBin16b(uint16_t dato);

int main() {
    pBin8b(10); 
    printf ("\n");
    pBin16b(13);
    return 0;
}
