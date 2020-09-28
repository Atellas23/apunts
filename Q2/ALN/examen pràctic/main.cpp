#include "funcions.h"

using namespace std;

int main (int argc, char *argv[]){

    if (argc < 2) {
        cout << "Error: the data file is missing" << endl;
        return 0;
    }

    ifstream data;

    data.open(argv[1], ifstream::in);

    if (data.fail()) {
      cout << "Error: document not found" << endl;
      return 0;
    }
    
    int n, m, i, j;
    data >> n >> m;     

    vec b(n, 0);
    matriu A(n, vec(n, 0));

    while (m--) data >> i >> j >> A[i][j];

    // SI NO HI HA VECTOR AIXO FORA
    data >> m;       
    while (m--) data >> i >> b[i];

    data.close();
    cout << scientific << setprecision(11);
    //cout.setf(ios::fixed);
    //cout.precision(2);

    n = A.size();
    
    ofstream fitxer;
    fitxer.open("m15.txt",ofstream::out);
    fitxer << scientific << setprecision(12);
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            fitxer << A[i][j] << ' ';
        }
        fitxer << b[i] << endl;
    }    
    fitxer.close();
    
    //~ vector <int> perm (n, 0);
    //~ matriu LU = A;
    //~ lu(LU, perm);

    //~ for (int i = 0; i < n; ++i) cout << perm[i] << ", ";
    //~ cout << endl;
    //~ matriu L = lowLU(LU);
    //~ matriu U = upperLU(LU);
    //~ cout << condition_one(L) << ' ' << condition_one(U) << endl;
    //~ cout << condition_inf(L) << ' ' << condition_inf(U) << endl;

}
