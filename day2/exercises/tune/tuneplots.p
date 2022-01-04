# Set the output to a png file
set terminal png size 500,500
# The file we'll write to
set output 'plot.png'
# The graphic title
set title 'Data structure comparison: AoS vs SoA'
set logscale x; set xtics 64, 4, 262144
set yrange [0:2000]
set xlabel "Memory footprint (Kbyte)"
set ylabel "Performance (Mflop/s)"

titleprefix="dummy calc re-use total"
#plot the graphic
p for [col = 2:4] "aos.gcc.dat" u 1:col title "AoS - ".word(titleprefix,col) w lp pt col-1, \
    for [col = 2:4] "soa.gcc.dat" u 1:col t "SoA - ".word(titleprefix,col) w lp pt col-1
set grid
