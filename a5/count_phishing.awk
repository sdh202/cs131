#!/usr/bin/awk -f

BEGIN {
    FS = ","
    count = 0
}

{
    if ($30 == "-1")
        count++
}

END {
    print count
}

