# Set the output to a png file
set terminal png size 500,500
# The file we'll write to
set output 'plot.png'

set logscale x; set xtics 64, 4, 262144
set xrange [64:262144]
set yrange [0:2000]
set xlabel "Memory footprint (Kbyte)"
set ylabel "Performance (Mflop/s)"

p 'ratio_1_mnk.gcc.dat' u 1:2 w lp