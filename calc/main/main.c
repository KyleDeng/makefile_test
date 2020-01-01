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

    int listA[] = {1, 2, 3, 4, 5, 6};
    int listB[] = {1, 2, 3, 4, 5, 6};
    int size = sizeof(listA) / sizeof(listA[0]);

    for(int i = 0; i < size; i++) {
        a = calc_add(listA[i], listB[i]);
        printf("a=%d\n", a);
    }

    return 0;
}
