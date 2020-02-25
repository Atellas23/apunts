#include <math.h>
#include <stdio.h>

struct DOUBLE {
	unsigned long mantissa:52;
	unsigned int exp:11;
	unsigned int sign:1;
};

union DBL {
	struct DOUBLE vals;
	double        flt;
};

void shownum(union DBL val)
{
   unsigned int bit;
   unsigned long lbit;

   printf ("%le\n", val.flt);
   printf ("   %u     %u               %lu\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("   %u  ", val.vals.sign);
   for (bit=0x400; bit>0;  bit >>= 1)  printf ("%u", (val.vals.exp & bit)?1:0);
   printf ("  ");
   for (lbit=0x8000000000000L; lbit>0;  lbit >>= 1)  printf ("%u", (val.vals.mantissa & lbit)?1:0);
   printf("\n");
}


int main()
{
   union DBL val;

   //val.flt = INFINITE;
   val.vals.sign = 0;
   val.vals.exp = 0x7ff;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp = 0x7fe;
   val.vals.mantissa = 0xfffffffffffffUL;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 0x3ff;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 1;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0xfffffffffffffUL;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x0000000000001UL;
   shownum(val);

   // zero

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000000UL;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000000UL;
   shownum(val);


// -

   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x0000000000001UL;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0xfffffffffffffUL;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 1;
   val.vals.mantissa = 0;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 0x3ff;
   val.vals.mantissa = 0;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 0x7fe;
   val.vals.mantissa = 0xfffffffffffffUL;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 0x7ff;
   val.vals.mantissa = 0;
   shownum(val);

   // QNaN
   val.vals.sign = 0;
   val.vals.exp = 0x7ff;
   val.vals.mantissa = 0x7ffffffffffffUL;
   shownum(val);
   val.vals.sign = 0;
   val.vals.exp = 0x7ff;
   val.vals.mantissa = 0x4000000000000UL;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 0x7ff;
   val.vals.mantissa = 0x4000000000000UL;
   shownum(val);

   return 0;
}
