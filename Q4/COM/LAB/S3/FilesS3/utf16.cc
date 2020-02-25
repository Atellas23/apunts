
// https://www.unicode.org/versions/Unicode12.0.0/

#include <unistd.h>
#include <cctype>
#include <locale>
#include <langinfo.h>
#include <iostream>
#include <unicode/utypes.h>
#include <unicode/uchar.h>
#include <unicode/locid.h>
#include <unicode/umachine.h>
#include <unicode/ustring.h>
#include <unicode/utf16.h>
#if 0
#include <unicode/ucnv.h>
#include <unicode/ucnv_err.h>
#endif
#include <unicode/unistr.h>
#include <unicode/ustream.h>

#if 0
static UConverter *cnv=NULL;

void init_u(void)
{
   UErrorCode err = U_ZERO_ERROR;
   cnv = ucnv_open(NULL, &err);
   if (U_FAILURE(err)) {
      std::cerr << "error i" << u_errorName(err) << 
              "opening the default converter" << std::endl;
      exit(1);
   }
   ucnv_setFromUCallBack(cnv, UCNV_FROM_U_CALLBACK_ESCAPE, UCNV_ESCAPE_C, NULL,
          NULL, &err);
   if(U_FAILURE(err)) {
      std::cerr << "error " << u_errorName(err) << 
         "setting the escape callback in the default converter" << std::endl;
      ucnv_close(cnv);
      exit(1);
   }
}


void fini_u(void)
{
   ucnv_close(cnv);
}
#endif

void print_u(const icu::UnicodeString &s, int length)
{
   char out[80*30];
   UErrorCode err=U_ZERO_ERROR;

   out[s.extract(0, length, out, sizeof(out))] = 0;
   std::cout << out;
}




int main()
{
   int res;

#if 0
   init_u();
#endif

   setlocale(LC_CTYPE, "");
   std::cout << nl_langinfo(CODESET) << std::endl;
   std::cout << sizeof( UChar ) << ' ' << sizeof( char16_t ) << std::endl;

     // initializing s with \1 as \0 is not a valid character and
     // s.charAt(0) returns 65535
   icu::UnicodeString s = u"\1";
  
   while (s.charAt(0) < 0xffff) {
      //print_u(s, s.length());
      if (u_isprint(s.charAt(0))) print_u(s, s.length());
      else                 std::cout << (char) 0302 << (char) 0267;
      if ((s.charAt(0) & 0x001f) == 0x001f) std::cout << std::endl;
      else std::cout << " ";

    s.setCharAt(0, s.charAt(0)+1);
   }
   if (u_isprint(s.charAt(0))) print_u(s, s.length());
   else                        std::cout << (char) 0302 << (char) 0267;

   std::cout << std::endl;

#if 0
   fini_u();
#endif

   return 0;
}
