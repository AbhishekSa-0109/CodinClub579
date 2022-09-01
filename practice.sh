mkdir -p ../backup
for items in `ls *.*`
do
	fileName=`echo $items | awk -F. {'print $1'}`
	fileExtension=`echo $items | awk -F. {'print $2'}`	
	
	if [[ $fileExtension != "sh" && $fileExtension != "txt" ]];
	then
		mkdir -p ../backup/$fileName/$fileExtension/
		mv  $items ../backup/$fileName/$fileExtension/

		echo "Found a $fileExtension file. And moved to /backup/$fileName/$fileExtension/"	
	else
		echo "Found a $fileExtension file. Skipping."
	fi
done
