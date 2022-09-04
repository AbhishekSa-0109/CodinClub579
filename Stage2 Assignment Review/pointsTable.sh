echo "Select Your favourite team here"
echo "hint : CSK RCB MI"
read teamName
teamName=${teamName^^}

win=0
lose=0
points=0
runRate=""
MATCH_PLAYED=14
rcbTeam=("Maxwell" "Virat" "Abd" "Chahal")
miTeam=("Pollard" "Ishan" "Bumrah" "Rohit")

declare -A cskTeam
cskTeam[batsman]="Duplesis"
cskTeam[bowler]="Saha"
cskTeam[allrounder]="Jadeja"
cskTeam[captain]="Dhoni"

function errorHandler() {
	echo "Your Given Input Is Out of Syllabus Yaar, Please Try Again..."
}

function playoffEligibility() {
	case $1 in
	1|2|3|4)
		echo -e "\a$2 is Eligible for PlayOffs"
		;;
	*)
		echo "$2 is Not Eligible for PlayOffs"
		;;
	esac
}

function roles(){
echo "$1 is a $3 of team $2"
}

function responsibility(){
	echo -e "Player Roles:\n"
	case $1 in

		MI)
			for item in ${miTeam[@]}
			do
				case $item in
					"Pollard")
						roles $item $1 "Allrounder"
						;;
					
					"Ishan")
						roles $item $1 "Batsman"
						;;

					"Bumrah")
						roles $item $1 "Bowler"
						;;

					"Rohit")
						roles $item $1 "Captain"
						;;

					*)
						;;
				esac

			done
			;;

		CSK)
			for item in ${cskTeam[@]}
			do
				case $item in
					"Jadeja")
						roles $item $1 "Allrounder"
						;;
					
					"Duplesis")
						roles $item $1 "Batsman"
						;;

					"Saha")
						roles $item $1 "Bowler"
						;;

					"Dhoni")
						roles $item $1 "Captain"
						;;

					*)
						;;
				esac

			done

			;;
		

		RCB)
			for item in ${rcbTeam[@]}
			do
				case $item in
					"Maxwell")
						roles $item $1 "Allrounder"
						;;
					
					"Abd")
						roles $item $1 "Batsman"
						;;

					"Chahal")
						roles $item $1 "Bowler"
						;;

					"Virat")
						roles $item $1 "Captain"
						;;

					*)
						;;
				esac

			done

			;;

		*)
			;;


	esac
}


function pointsEstimation(){
	lose=$((MATCH_PLAYED-$1))
	points=$(($1*2))
	echo -e "\n***********************************"
	echo "Team You Choosen: $teamName"
	echo "Place Secured : $2"
	echo "Matched Played : $MATCH_PLAYED"
	echo "Won $1 , Lost $lose"
	echo "Points : $points"
	echo "-----------------------------------"
	playoffEligibility $2 $teamName
	echo "-----------------------------------"
	responsibility $teamName
	echo -e "\n***********************************"
}


case $teamName in
	MI)
		position=10
		win=4
		runRate="-0.506"
		pointsEstimation $win $position $runRate
		;;

	CSK)
		position=9
		win=4
		runRate="-0.203"
		pointsEstimation $win $position $runRate
		;;

	RCB)
		position=4
		win=8
		runRate="-0.253"
		pointsEstimation $win $position $runRate
		;;
	*)
		errorHandler
		;;
esac