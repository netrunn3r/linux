#!/bin/bash
# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
# On Wisconsin!
#GRUB_INIT_TUNE="600 294 5 277 2 330 4 294 5"
# Close Encounters
#GRUB_INIT_TUNE="220 900 2 1000 2 800 2 400 2 600 3"
# Twinkle, Twinkle
#GRUB_INIT_TUNE="300 294 1 294 1 440 1 440 1 494 1 494 1 440 2"
# Shave and a Haircut
#GRUB_INIT_TUNE="400 523 2 392 1 392 1 440 2 392 2 1 2 494 2 523 2"
# Mario 1
#GRUB_INIT_TUNE="1000 334 1 334 1 0 1 334 1 0 1 261 1 334 1 0 1 392 2 0 4 196 2"
# Mario 2
#GRUB_INIT_TUNE="480 165 2 165 2 165 3 554 1 587 1 554 2 370 1 554 1 523 2 349 1 523 1 494 3 165 2 165 2 165 2"
# Star Wars Imperial Death March
GRUB_INIT_TUNE="480 440 4 440 4 440 4 349 3 523 1 440 4 349 3 523 1 440 8 659 4 659 4 659 4 698 3 523 1 415 4 349 3 523 1 440 8"

function test-tune
{
	TEMPO=""
	FREQ=""
	TUNE=""
	for VAL in $GRUB_INIT_TUNE; do 
		if [ "$TEMPO" == "" ]; then
			TEMPO=$((60000 / VAL))
		elif [ "$FREQ" == "" ];then 
			FREQ=$VAL;
		elif [ "$TUNE" == "" ]; then
			TUNE=" -d $TEMPO -f $FREQ -l $((TEMPO * VAL))"
			FREQ=""
		else
		test "$FREQ" == "0" || TUNE="$TUNE -n -f $FREQ -l $((TEMPO * VAL))"
			FREQ=""
		fi;
	done
	beep $TUNE
}

# *** MAIN ***
if [ "$GRUB_INIT_TUNE" == "" ]; then
	source /etc/default/grub
fi
test-tune
echo "GRUB_INIT_TUNE=\"$GRUB_INIT_TUNE\""
# EOF
