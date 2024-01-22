#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align --tuples-only -c"

# get user info
echo -e "\nEnter your username:"
read USER_NAME
USER_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USER_NAME'")

# if user doesn't exist
if [[ -z $USER_RESULT ]]
then
    # get new user name
    echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
    # insert new user
    INSERT_USER_RESULT=$($PSQL "insert into users(username) values ('$USER_NAME')")     
else
    # get all user info
    USER_RESULT=$($PSQL "SELECT username,count(games_id),min(guesses) FROM games WHERE username = '$USER_NAME' group by username")
    arrIN=(${USER_RESULT//\|/ })
    #echo "$USER_RESULT" | read USERNAME GAMES_PLAYED BEST_GAME
    echo -e "\nWelcome back, ${arrIN[0]}! You have played ${arrIN[1]} games, and your best game took ${arrIN[2]} guesses."
fi

n1=$[($RANDOM % 1000) +1]
guesses=1
echo -n "Guess the secret number between 1 and 1000:"

while read n2; do
if [[ ! $n2 =~ ^[0-9]+$ ]]; then
   echo -n "That is not an integer, guess again:"        
   continue
fi      
if [[ $n2 -eq $n1 ]]; then
   break;  
else
   echo        
   if [[ $n2 -gt $n1 ]]; then 
      echo -n "It's lower than that, guess again:"
   elif [[ $n2 -lt $n1 ]]; then
      echo -n "It's higher than that, guess again:"
   fi      
fi
guesses=$((guesses+1))

done
echo
echo "You guessed it in $guesses tries. The secret number was $n2. Nice job!"

INSERT_GAMES_RESULT=$($PSQL "insert into games(guesses, username) values($guesses, '$USER_NAME')") 
