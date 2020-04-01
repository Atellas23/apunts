#include <math.h>
#include <stdio.h>

struct FLOAT {
	unsigned int mantissa:23;
	unsigned int exp:8;
	unsigned int sign:1;
};

union FLT {
	struct FLOAT vals;
	float        flt;
};

void shownum(union FLT val)
{
   unsigned int bit;
   //printf ("%4.15f\n", val.flt);
   printf ("%e\n", val.flt);
   printf ("   %u     %u               %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("   %u  ", val.vals.sign);
   for (bit=0x80; bit>0;  bit >>= 1)  printf ("%u", (val.vals.exp & bit)?1:0);
   printf ("  ");
   for (bit=0x400000; bit>0;  bit >>= 1)  printf ("%u", (val.vals.mantissa & bit)?1:0);
   printf("\n");
}


int main()
{
   union FLT val;

   //val.flt = INFINITE;
   val.vals.sign = 0;
   val.vals.exp = 255;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp = 254;
   val.vals.mantissa = 0x7fffff;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 127;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 1;
   val.vals.mantissa = 0;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x7fffff;
   shownum(val);

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000001;
   shownum(val);

   // zero

   val.vals.sign = 0;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000000;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000000;
   shownum(val);


// -

   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x000001;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 0;
   val.vals.mantissa = 0x7fffff;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 1;
   val.vals.mantissa = 0;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp  = 127;
   val.vals.mantissa = 0;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 254;
   val.vals.mantissa = 0x7fffff;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 255;
   val.vals.mantissa = 0;
   shownum(val);

   // QNaN
   val.vals.sign = 0;
   val.vals.exp = 255;
   val.vals.mantissa = 0x3fffff;
   shownum(val);
   val.vals.sign = 0;
   val.vals.exp = 255;
   val.vals.mantissa = 0x400000;
   shownum(val);
   val.vals.sign = 1;
   val.vals.exp = 255;
   val.vals.mantissa = 0x400000;
   shownum(val);

#if 0

   val.vals.sign = 0;
   val.vals.exp  = 127;
   val.vals.mantissa = 0;

   printf ("%2.15f\n", val.flt);

   val.flt = 1.0f;

   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);

   val.vals.sign = 1;
   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);

   val.vals.mantissa |= 0x400000;
   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);

   val.vals.mantissa |= 0x200000;
   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);

   val.vals.sign = 0;
   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);

   val.vals.sign = 1;
   val.vals.exp = 0;
   val.vals.mantissa = 0;
   printf (" %u  %u  %u\n", val.vals.sign, val.vals.exp, val.vals.mantissa);
   printf ("%2.15f\n", val.flt);
#endif
   return 0;
}
