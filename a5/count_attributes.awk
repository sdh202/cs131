#!/usr/bin/awk -f

BEGIN {
    FS = ","
}

{
    for (i = 1; i < NF; i++) {
        if ($i < 0) {
            attributeCount[i]++
        }
    }
}

END {
    for (attribute in attributeCount) {
        print attribute, attributeCount[attribute]
    }
}
