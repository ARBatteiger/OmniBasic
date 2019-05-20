/* HEADER FILE FOR mingw32 */

#include <errno.h>
#include <setjmp.h>
#include <time.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define A_READ 0
#define A_WRITE 1
#define A_UPDATE 2
#define A_CREAT 0x100
#define A_EXCL 0x400
#define A_DIR 0
#define A_TEXT 0x4000
#define A_BINARY 0x8000

#define P_WRITE 0x80
#define P_READ 0x80

#define E_EXIST 36

#define S_ORG 0
#define S_CUR 1
#define S_END 2
