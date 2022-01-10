#include <stdio.h>
#include <stdlib.h>
#include "xtime.h"
#include "pi.h"

int
main(int argc, char *argv[]) {

    int 	i, loops, nparts;
    double	ts, te_pi, ts_main, te_main, pi_hat;

    if ( argc >= 2 ) {
	loops = atoi(argv[1]);
    } else {
	loops = 1;
    }
    if ( argc == 3 ) {
	nparts = atoi(argv[2]);
    }

    fprintf(stderr, "Running Pi version with %d terms and %d loops.\n",
            nparts, loops);


    init_timer();

    ts = xtime();

    te_pi  = 0.0;
    ts_main = xtime();

    for( i = 0; i < loops; i++ ) {
	ts = xtime();
	pi_hat = pi(nparts);
	te_pi += (xtime() - ts);
    }
    te_main = xtime() - ts_main;

    /*
    printf("%7.2lf %le %le %le %le\n", 
	   memory, te_init, te_dist, te_check, te_main);
    */
    printf(" \n %le %le\n", 
	   te_pi, te_main);

    return(0);
}
