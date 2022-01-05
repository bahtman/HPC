#define MIN(x, y) (((x) < (y)) ? (x) : (y))
void
matmult_blk(int m, int n, int k, double **A, double **B, double **C, int bs) {
  int i1, i2, j, l1, l2;

  /* initializing C to be zero */
  for ( i1 = 0; i1 < m; i1+=bs ) {
    for ( j = 0; j < n; j++ ) {
        for ( i2 = 0; i2<MIN(m-i1, bs); i2++){
            C[i1+i2][j] = 0;
        }
    }
  }

  /* matrix multiplication */
  for ( i1 = 0; i1 < m; i1+=bs ) {
    for ( l1 = 0; l1 < k; l1+=bs) {
        for ( j = 0; j < n; j++ ) {
            for ( l2=0; l2<MIN(k-l1,bs); l2++){
                for ( i2 = 0; i2<MIN(m-i1, bs); i2++){
                    C[i1+i2][j] += A[i1+i2][l1+l2]*B[l1+l2][j];
                }
            }
        }
    }
  }
}