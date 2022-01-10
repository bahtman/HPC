#include<stdio.h>
#include<math.h>

double pi(int N) {
    double sum=0;
    int i;
    for (i=1; i<=N; i++) {
        sum += 4/(1+pow((i-0.5)/N,2));

    }
    sum /=N;
    printf("\nPI = %.6lf", sum);


    return sum;
}