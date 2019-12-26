#include <stdio.h>
#include "calc_add.h"
// #include "calc_sub.h"
// #include "calc_mul.h"

int main(int argc, char *argv[])
{
    int a = 5, b = 2;

    printf("%d + %d = %d\n", a, b, calc_add(a, b));
    // printf("%d - %d = %d\n", a, b, calc_sub(a, b));
    // printf("%d * %d = %d\n", a, b, calc_mul(a, b));
    printf("Hello World!\n");

    return 0;
}
