awk '{
if ($1>99)
    {print $1,$3}
else {print $1,$2}
}' OFS='\t' wave.dat > wave2.dat