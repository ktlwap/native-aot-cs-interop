#include <stdio.h>

extern int native_aot_shared_add(int a, int b);

int main()
{
    printf("1 + 1 = %d\n", native_aot_shared_add(1, 1));
    return 0;
}
