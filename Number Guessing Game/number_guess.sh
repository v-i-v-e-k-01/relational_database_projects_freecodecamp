#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

#main user
echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

USERDATA=$($PSQL "SELECT COUNT(*), MIN(guesses) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")  
else
  echo "$USERDATA" | while IFS="|" read GPLAYED BESTG
  do
    echo "Welcome back, $USERNAME! You have played $GPLAYED games, and your best game took $BESTG guesses."
  done
fi

#game 

echo "Guess the secret number between 1 and 1000:"
read GUESSED_NUMBER

RANDOM_NUMBER=$(($RANDOM%1000 + 1))

for (( i=1 ;; i++))
do
  if [[ ! $GUESSED_NUMBER =~ (^[1-9][0-9]{0,2}|1000)$ ]]
  then 
    echo "That is not an integer, guess again:"
  elif [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESSED_NUMBER -gt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $i tries. The secret number was $RANDOM_NUMBER. Nice job!"
    CURR_GUESSES=$i
    break
  fi
  read GUESSED_NUMBER
done

INSERT_CURR_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES('$USER_ID','$CURR_GUESSES')")


