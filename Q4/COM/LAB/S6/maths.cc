int mathloop(int op1, int op2, int op3){
	int i, j, k, cont = 0;

	for (i=0; i<op1; i++){
		for (j=0; j<op2; j++){
			for (k=0; k<op3; k++){
				cont += (i*j)+k;
			}		
		}
	}

	return cont;
}
