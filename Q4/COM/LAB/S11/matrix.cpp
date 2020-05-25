#include <stdio.h>
#include <sys/time.h>
#include <malloc.h>
#include <cmath>
#include "matrix.h"


// Alternative sizes and block sizes

//#define SIZE 2
//#define BSIZE 2
//#define TYPE float
//

#define SIZE 960
#define BSIZE (160)
#define TYPE float


//#define SIZE 1208
//#define BSIZE (151*2)
//#define TYPE float
//

//#define SIZE 1752
//#define BSIZE (219)
//#define TYPE float
//




int main(int argc, char * argv [])
{
   int BSize = BSIZE;

   // process block size argument
   if (argc > 2) { std::cerr << "Us: " << argv[0] << " [blocksize]"
                             << std::endl;
                   std::exit(1);
   }
   if (argc > 1) {
      BSize = atoi(argv[1]);
   }

   if ( (SIZE % BSize) != 0 ) {
      std::cerr << "Error: BSize(" << BSize 
                << ") should perfectly divide the matrix Size(" << SIZE
                << ")" << std::endl;
      std::exit(3);
   }

   // Allocate matrices

   matrix<TYPE,SIZE,SIZE> * mA = nullptr;
   try { mA = new matrix<TYPE,SIZE,SIZE>(54); } catch(std::exception & e) {
         std::cerr << "Exception catched: " << e.what() << std::endl;
         perror("new");
         std::cout << "mA pointer " << static_cast<void*>(mA) << std::endl;
         std::exit(2);
      }
   matrix<TYPE,SIZE,SIZE> * mB = nullptr;
   try { mB = new matrix<TYPE,SIZE,SIZE>(1); } catch(std::exception & e) {
         std::cerr << "Exception catched: " << e.what() << std::endl;
         perror("new");
         std::cout << "mB pointer " << static_cast<void*>(mB) << std::endl;
         return 2; // equivalent to std::exit(2);
      }
   matrix<TYPE,SIZE,SIZE> * mC = nullptr;
   try { mC = new matrix<TYPE,SIZE,SIZE>; } catch(std::exception & e) {
         std::cerr << "Exception catched: " << e.what() << std::endl;
         perror("new");
         std::cout << "mC pointer " << static_cast<void*>(mC) << std::endl;
         return 2; // equivalent to std::exit(2);
      }

   int loop, res, i, j, k;
   struct timeval tv0, tv1;

    // main loop for default matrix product

 for (loop = 0; loop < 5; loop++) {
   std::clog << "loop " << loop + 1 << std::endl;

   mC->product_transposed(mA, mB);

   mA->display();
   mB->display();
   mC->display();
 }

    // main loop for blocked matrix product, with simd reduction

 for (loop = 0; loop < 5; loop++) {
   std::clog << "loop " << loop + 1 << std::endl;

   mC->product_reduction(mA, mB, BSize);

   mA->display();
   mB->display();
   mC->display();
 }

    // main loop for blocked matrix product, with loop interchange and simd

 for (loop = 0; loop < 5; loop++) {
   std::clog << "loop " << loop + 1 << std::endl;

   mC->product(mA, mB, BSize);

   mA->display();
   mB->display();
   mC->display();
 }

 std::clog << "matrix size " << SIZE << "x" << SIZE 
        <<  "  block size " << BSize << "x" << BSize << std::endl;

 return 0;
}
