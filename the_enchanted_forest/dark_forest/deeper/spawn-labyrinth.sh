#!/bin/bash

# terms to use as subdirectory names in the labyrinth
TERMS=("tree" "oaktree" "stump" "mushroom" "shrub" "elmtree" "hollytree" "elderberrytree")

# size of term list
# SIZE=8
SIZE=${#TERMS[@]}

# how big is the labyrinth?
DEPTH=7
WIDTH=3

echo "In this place,"
echo "Let there be... a LABYRINTH!!! Wha ha ha!!!"
mkdir Labyrinth

echo "Watch me make $((WIDTH**DEPTH)) terminal subdirectories..."
echo "(with $DEPTH layers to get to each one!)"

# N=1 would be the initial labyrinth dir itself.
N=1

for D in $(seq 1 1 $DEPTH)
do
   echo "Only $N spaces so far..."
   echo "Let there be a ${D}-th layer of the labyrinth!"
   # make a list of all the directorys / spaces in the previous layer
   dirs=$(find $PWD -maxdepth $D -type d -mindepth $D)
   for dir in $dirs
   do
      for W in  $(seq 1 1 $WIDTH)
      do
         N=$((N + 1))
         # modulus operator (%) takes the remainder after division
         LOOPER=$((N % SIZE))
         term=${TERMS[$LOOPER]}
         # create a new space
         mkdir ${dir}/$term
         # Add a readme
         echo "When the Labyrinth was created, this space was the ${N}-th space created." > ${dir}/${term}/README
         echo "This is the $D-th layer down." >> ${dir}/${term}/README
         echo "This space was the $W-th space within ints parent directory." >> ${dir}/${term}/README
         echo "This space is called $term because the value of LOOPER is $LOOPER." >> ${dir}/${term}/README
      done
   done
done

echo "I made a maze with $N spaces."
echo -e "Hoo wow! That's a labyrinth! \nIf you got something you want to find again, don't put it here! "


