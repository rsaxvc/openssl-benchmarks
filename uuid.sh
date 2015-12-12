#!/bin/bash

# Generate a pseudo UUID
# Found: http://serverfault.com/a/597626/326845
for (( N=0; N < 16; ++N ))
do
    B=$(( $RANDOM%255 ))

    if (( N == 6 ))
    then
            printf '4%x' $(( B%15 ))
    elif (( N == 8 ))
    then
        C='89ab'
        printf '%c%x' ${C:$(( $RANDOM%${#C} )):1} $(( B%15 ))
    else
        printf '%02x' $B
    fi

    for T in 3 5 7 9
    do
        if (( T == N ))
        then
            printf '-'
            break
        fi
    done
done
echo