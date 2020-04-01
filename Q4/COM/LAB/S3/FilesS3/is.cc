
// https://www.unicode.org/versions/Unicode12.0.0/

#include <cctype>
#include <locale>
#include <langinfo.h>
#include <iostream>
#include <unicode/utypes.h>
#include <unicode/uchar.h>
#include <unicode/unistr.h>
#include <unicode/ustring.h>


int main()
{
   setlocale(LC_CTYPE, "");

   std::cout << nl_langinfo(CODESET) << std::endl;

   icu::UnicodeString s = u'\1';

   while ((int) s.charAt(0) < 0xfffe) {
      char out[10];
      out[s.extract(0, 1, out, sizeof(out))] = 0;
      std::cout << (int) s.charAt(0) << ": " << out;
      if (u_isalpha(s.charAt(0)))
        std::cout <<
           " isdefined: " << (u_isdefined(s.charAt(0))?'1':'0') <<
           " isalpha: " << (u_isalpha(s.charAt(0))?'1':'0') << 
           " islower: " << (u_islower(s.charAt(0))?'1':'0') <<
           " isupper: " << (u_isupper(s.charAt(0))?'1':'0') <<
           " isdigit: " << (u_isdigit(s.charAt(0))?'1':'0') <<
           " isgraph: " << (u_isgraph(s.charAt(0))?'1':'0') << std::endl;
      else
        std::cout <<
           " isdefined: " << (u_isdefined(s.charAt(0))?'1':'0') <<
           " isprint: " << (u_isprint(s.charAt(0))?'1':'0') <<
           " iscntrl: " << (u_iscntrl(s.charAt(0))?'1':'0') <<
           " isblank: " << (u_isblank(s.charAt(0))?'1':'0') << 
           " isdigit: " << (u_isdigit(s.charAt(0))?'1':'0') <<
           " isgraph: " << (u_isgraph(s.charAt(0))?'1':'0') << std::endl;
      s.setCharAt(0, s.charAt(0)+1);
   }
  
   std::cout << std::endl;
   return 0;
}
