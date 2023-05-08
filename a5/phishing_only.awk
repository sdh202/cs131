#!/usr/bin/awk -f

BEGIN {
    FS = ","
}

$30 == "-1" {
    print
}

