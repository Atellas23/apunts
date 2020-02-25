
// https://www.unicode.org/versions/Unicode12.0.0/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>
#include <langinfo.h>
#include <unicode/umachine.h>
#include <unicode/ustring.h>
#include <unicode/utf16.h>
#include <unicode/ucnv.h>
#include <unicode/ucnv_err.h>

static UConverter *cnv=NULL;

void init_u(void)
{
   UErrorCode err = U_ZERO_ERROR;
   cnv = ucnv_open(NULL, &err);
   if (U_FAILURE(err)) {
      fprintf (stderr, "error %s opening the default converter\n", 
         u_errorName(err));
      exit(1);
   }
   ucnv_setFromUCallBack(cnv, UCNV_FROM_U_CALLBACK_ESCAPE, UCNV_ESCAPE_C, NULL,
          NULL, &err);
   if(U_FAILURE(err)) {
      fprintf(stderr, 
        "error %s setting the escape callback in the default converter\n", 
        u_errorName(err));
      ucnv_close(cnv);
      exit(1);
   }
}

void fini_u(void)
{
   ucnv_close(cnv);
}

void print_u(const UChar * s, int length)
{
   char out[80*30];
   UErrorCode err=U_ZERO_ERROR;

   ucnv_fromUChars(cnv, out, sizeof(out), s, length, &err);
   if (U_FAILURE(err) || err==U_STRING_NOT_TERMINATED_WARNING) {
        fprintf(stderr, 
          "problem converting string from Unicode: %s\n", u_errorName(err));
        ucnv_close(cnv);
        exit(1);
   }
   printf("%s", out);
}


int main()
{
   int res;

   setlocale(LC_CTYPE, "");

   printf ("langinfo codeset: %s\n", nl_langinfo(CODESET));


   init_u();

   printf ("sizeof UChar %ld  UChar32  %ld\n",
            sizeof(UChar), sizeof(UChar32));

   //printf ("%hn\n", u"hola à");

   UChar s[] = u"hola à\n";

   printf ("strlen %ld, length %d, sizeof %ld\n", strlen(s), u_strlen(s), sizeof(s));

   res = write(1, s, sizeof(s));

   print_u(s, u_strlen(s));

   UChar c[2] = u"\0";
   while (c[0] < 0xffff) {
      if (u_isprint(c[0])) print_u(c, u_strlen(c));
      else                 printf("%c%c", 0302, 0267);
      if ((c[0] & 0x001f) == 0x001f) printf ("\n");
      else printf (" ");
      ++c[0];
   }
   if (u_isprint(c[0])) print_u(c, u_strlen(c));
   else                 printf("%c%c", 0302, 0267);

   printf ("\n");
   
   fini_u();
   return 0;
}

