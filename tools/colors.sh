	for clfg in {30..38} ; do
		for attr in 0 1 7 ; do
			echo -en "\e[${attr};${clfg}m ^[${attr};${clfg}m \e[0m"
		done
		echo #Newline
	done

exit 0
