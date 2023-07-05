# todo 
# create a program that runs a for-loop for each aa file in the the mote (..).
# for 1..3, for each aa file, for each aa file, make a new aa file with the contents of both 
# alligators can reproduce a-sexually.


#!/bin/bash

echo "grr... chomp! chomp! " > Aaaligator.txt

for i in {1..3}
do
    echo "Its gator breeding time..."
    aaFiles=$(ls -1 | grep aa)
    for aa in $aaFiles
    do
        new=${aa/Aa/Aaa}
        cat $aa > $new
    done
done

N=$(ls -1 | grep aa | wc -l)
echo "Now there are $N aligators!"

