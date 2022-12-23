#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
input_data="./games.csv"

# clear tables
clear_res=$($PSQL "TRUNCATE teams, games")

# input teams info
cat $input_data | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $WINNER != winner ]]
	then
		winner_exist=$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")
		if [[ -z $winner_exist ]]
		then
			# winner doesn't exist so insert
			win_insert_res=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
			if [[ $win_insert_res="INSERT 0 1" ]]
			then
				echo inserted $WINNER to teams
			fi
		fi
		oppo_exist=$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")
		if [[ -z $oppo_exist ]]
		then
			# oppo doesn't exist so insert
			oppo_insert_res=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
			if [[ $oppo_insert_res="INSERT 0 1" ]]
			then
				echo inserted $OPPONENT to teams
			fi
		
		fi
	fi

done

# read through file again making games info
cat $input_data | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $WINNER != winner ]]
	then
		winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
		oppo_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
		insert_game_res=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$winner_id,$oppo_id,$WINNER_GOALS,$OPPONENT_GOALS)")
	fi
done
 
