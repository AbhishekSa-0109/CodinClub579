echo -e "\nProgram to Count Occurrence of each alphabet in the string."
read -p "Enter a string: " word
word=${word^^}

lengthOfWord=${#word}

declare -A Data

for((i=0;i<$lengthOfWord;i++))
do
	letter=${word:$i:1}
		
	for items in ${!Data[@]}
	do
		if [ "$items" == "$letter" ]
		then
			continue 2
		fi
	done
	
	#Get word count for each letter in the string "word".
	t="$(echo -n $word | grep -io "$letter" | wc -l)" 
	
	Data[$letter]=$t

done

#Display all the letters and their count.

for items in ${!Data[@]}
do
	echo "$items: ${Data[$items]} times." 
done |
sort