#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

/* Illustration of code vulnerability similar to that found in
* Sun’s XDR library.
*/
void *copy_elements(void *ele_src[], int ele_cnt, size_t ele_size)
{
    /*
* Allocate buffer for ele_cnt objects, each of ele_size bytes
* and copy from locations designated by ele_src
*/
    void *result = malloc(ele_cnt * ele_size);
    if (result == NULL)
        /* malloc failed */
        return NULL;
    void *next = result;
    int i;
    for (i = 0; i < ele_cnt; i++)
    {
        /* Copy object i to destination */
        memcpy(next, ele_src[i], ele_size);
        /* Move pointer to next memory region */
        next += ele_size;
    }
    return result;
}

void *copy_elements_buggy(void *ele_src[], int ele_cnt, size_t ele_size)
{
    /*
* Allocate buffer for ele_cnt objects, each of ele_size bytes
* and copy from locations designated by ele_src
*/
    uint64_t asize =
        ele_cnt * (uint64_t)ele_size; // asize will not overflow, but finally when passsing to malloc, truncating will occurred.
    void *result = malloc(asize);
    if (result == NULL)
        /* malloc failed */
        return NULL;
    void *next = result;
    int i;
    for (i = 0; i < ele_cnt; i++)
    {
        /* Copy object i to destination */
        memcpy(next, ele_src[i], ele_size);
        /* Move pointer to next memory region */
        next += ele_size;
    }
    return result;
}

void *copy_elements_fixed(void *ele_src[], int ele_cnt, size_t ele_size)
{
    /*
* Allocate buffer for ele_cnt objects, each of ele_size bytes
* and copy from locations designated by ele_src
*/
    uint64_t asize =
        ele_cnt * (uint64_t)ele_size;
    // if (asize != ele_cnt * ele_size) // intuitive methods, overflow will cause high-order bits of asize not zeros
    //     return NULL;
    void *result = (asize == ele_cnt * ele_size)? malloc(asize) : NULL;
    if (result == NULL)
        /* malloc failed */
        return NULL;
    void *next = result;
    int i;
    for (i = 0; i < ele_cnt; i++)
    {
        /* Copy object i to destination */
        memcpy(next, ele_src[i], ele_size);
        /* Move pointer to next memory region */
        next += ele_size;
    }
    return result;
}
