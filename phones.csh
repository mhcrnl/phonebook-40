#
# @author george
#

clear

#Write out the menu options...
menu:	
echo "Select an option..."
echo "1: EISAGWGH NEOU SYNDROMHTH"
echo "2: EMFANISH SYNDROMHTWN"
echo "3: EMFANISH OLWN TWN SYNDROMHTWN"
echo "4: DIAGRAFH SYNDROMHTWN"
echo "5: DIAGRFH OLWN TWN SYNDROMHTWN"
echo "6: EXODOS"

#Read the user input
set SEL=$<
switch ($SEL)
case 1:
	clear
	set EP=yes
	echo "\t EISAGWGH SYNDROMHTH"
	echo "-------------------------------------"
	#epanalhptikh eisagwgh syndromhtwn apo ton xrhsth sto arxeio 'phones'
	while ($EP == yes)
		echo -n "EPWNYMO     : "; set EPWNYMO=$<
		echo -n "ONOMA       : "; set ONOMA=$<
		echo -n "THLEFWNO    : "; set THLEFWNO=$<
		echo -n $EPWNYMO"   " >>phones; echo -n $ONOMA"   " >>phones; echo $THLEFWNO >>phones
		echo "--------------------------------------"
		echo "Eisagwgh neou syndromhth? [y/]: \c"
		set EP=$<
		#epilogh gia synexeia eisagwghs
		if ($EP == 'Y' || $EP == 'y' ) then
			set EP=yes
		else
			#epistrofh sto menu epilogwn 
			goto menu
		endif
	end	
	breaksw
case 2:
	clear
	echo "EMFANISH SYNDROMHTWN"
	echo "-------------------------------------"
	set FILE=phones
	#eisagwgh symvoloseiras apo to xrhsth gia anazhthsh
	echo -n "Search for:  "; set STRING=$<
	echo "-------------------------------------"
	#elegxos gia thn ypar3h tou thlefwnikou katalogou
	if ( -s $FILE ) then
		@ counter = 1
		#elegxos gia tautish ths symvoloseiras tou xrhsth me kapoia epafh tou katalogou
		foreach line ( `cat $FILE | grep -i $STRING $FILE` )
			echo $line
			@ c = $counter % 3
			if ( $c == 0 ) then
				echo "------------------------------------\n"
			endif
			@ counter += 1
		end
	else 
		echo "\nFile does not exist or is empty. Aborting...\n"
	endif
	echo -n "... press enter"
	set SEL=$<	
	goto menu
	breaksw
case 3:
	clear
	echo "EMFANISH OLWN TWN SYNDROMHTWN"
	echo "--------------------------------------\n"
	set FILE=phones
	#elegxos gia ypar3h tou arxeiou
	if ( -s $FILE ) then
		@ counter = 1
		#emfanish gia ka8e mia grammh tou arxeiou
		foreach line ( `cat $FILE` )
			echo $line
			@ c = $counter % 3
			if ( $c == 0 ) then
				echo "-------------------------------------\n"
			endif
			@ counter += 1
		end
	else
		echo "File $FILE does not exist or is empty! Aborting...\n"
	endif
	echo "Telos arxeiou...\n"
	goto menu	
	breaksw
case 4:
	clear
	set FILE=phones
	echo "\tDIAGRAFH SYNDROMHTWN"
	echo "----------------------------------"
	#eisagwgh symvoloseiras apo to xrhsth
	echo -n "Search for: "; set STRING=$<
	echo "----------------------------------"
	#elegxos gia thn ypar3h tou arxeiou
	if ( -s $FILE ) then
		@ counter = 1
		#elegxos ka8e grammhs tou arxeiou gia tautish me th symvoloseira tou xrhsth
		foreach line ( `cat $FILE | grep -i $STRING $FILE` )
			echo $line
			@ c = $counter % 3
			if  ($c == 0 ) then
				echo "\n-------------------------------"
				#epilogh tou xrhsth gia diagrafh
				echo -n "Na diagrafei ? [y/]:\t"
				set SEL=$<
				if ( $SEL == 'Y' || $SEL == 'y' ) then
					#diagrafh 
					sed -e /$line/d $FILE >tmp
					mv tmp $FILE
					echo "\ndiagrafh egine ...\n"
				else
					echo "\ndiagrafh den egine ...\n"
					echo "-------------------------"
				endif
			endif
			@ counter += 1
		end
	else 
		echo "\nFile does not exist or is empty. Aborting...\n"
	endif
	goto menu
	breaksw
case 5:
	clear
	set FILE=phones
	#epilogh tou xrhsth gia diagrafh olwn
	echo -n "Diagrafh olwn? [y/]: "
	set EP=$<
	if ($EP == 'Y' || $EP == 'y' ) then
		#elegxos gia ypar3h tou arxeiou
		if (-s $FILE ) then
			#diagrafh
			rm $FILE
		else 
			echo "\nFile $FILE does not exist or is empty!\n"
		endif
	else
		echo "\nDiagrafh den egine...\n"
	endif
	goto menu
	breaksw
case 6:
	clear
	#exodos apo thn efarmogh
	echo "Bye!"; exit
	breaksw
default: 
	clear
	#default epilogh meta apo la8os eisagwgh tou xrhsth
	echo "Wrong input! Try again...\n"
	goto menu
	 
endsw
