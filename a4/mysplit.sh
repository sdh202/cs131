#!/bin/bash
inputdataset=$1

#Count total lines in input dataset excluding header
total_lines=$(tail -n +2 "$inputdataset" | wc -l) 

#Get 80% of lines into train
train_lines=$(echo "$total_lines * 0.8 / 1" | bc)

#Add header line to both new data files
head -n 1 "$inputdataset" > a4/train/data.csv
head -n 1 "$inputdataset" > a4/test/data.csv

#Don't include header in a temporary file
tail -n +2 "$inputdataset" > temp.csv

#if comma seperator not present, replace it and save as a temporary file
if [[ $(head -n 1 temp.csv | grep ";") ]]; then
    sed 's/;/,/g' temp.csv > temp2.csv
    mv temp2.csv temp.csv
fi

# Split dataset using the temp file
head -n $train_lines temp.csv >> a4/train/data.csv
tail -n +$(($train_lines+2)) temp.csv >> a4/test/data.csv

#finish by removing temporary file
rm temp.csv
