set title "Negative Counts for Phishing Attributes"
set xlabel "Attribute Number"
set ylabel "Negative Count"
set style data histogram
set style histogram clustered
set style fill solid
plot "~/a5/common_phishing.txt" using 2:xtic(1) with histogram title "Negative Counts for Phishing Attributes""

