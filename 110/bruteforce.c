#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main() {
    int erg, i;
    for(i = 0;i < INT_MAX; i++) {
        asm("mov %1, %%eax;"
            "mov %1, %%edx;"
            "sar $0x1f, %%edx;"
            "not %%edx;"
            "and %%eax, %%edx;"
            "sub $0x6fe5d5, %%edx;"
            "xor $0x2eb22189, %%edx;"
            "imul $0x1534162, %%edx, %%edx;"
            "xor $0x69f6bc7, %%edx;"
            "mov %%edx, %0;"
            : "=r" ( erg )
            : "r" ( i )
            : "%eax","%edx"
        );
        if(erg == 230392619) {
            printf("%d\n",i);
            return 0;
        }
    }
    return 0;
}
