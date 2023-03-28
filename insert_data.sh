#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Script to insert data from games.csv into worldcup database

echo $($PSQL "truncate table games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $WINNER != winner ]]; then
    #get team_id -- winner
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    
    #if not found
    if [[ -z $WINNER_ID ]]; then
      #insert winner
      INSERT_WINNER_RESULT=$($PSQL "insert into teams (name) values ('$WINNER');")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]; then
      echo "Inserted into teams, $WINNER"
      fi
      #get new team_id
      WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    fi
  fi
  if [[ $OPPONENT != opponent ]]; then
    #get team_id -- opponent
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")
    #if not found
    if [[ -z $OPPONENT_ID ]]; then
      # insert course
      INSERT_OPPONENT_RESULT=$($PSQL "insert into teams (name) values ('$OPPONENT');")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]; then
        echo "Inserted into teams, $OPPONENT"
      fi      
      # get new team_id -- opponent
      OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")
    fi
  fi  
done
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $ROUND != round ]]; then  
    # get team_id --winner
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER';")
    # if not found
    if [[ -z $WINNER_ID ]]; then
      # set to null
      WINNER_ID=null
    fi    
    # get team_id --opponent
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT';")
    # if not found
    if [[ -z $OPPONENT_ID ]]; then
      # set to null
      OPPONENT_ID=null
    fi    
    
    # insert games
    INSERT_GAME_RESULT=$($PSQL "insert into games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR,'$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]; then
      echo "Inserted into games, $ROUND $WINNER_ID"
    fi              
  fi
done
