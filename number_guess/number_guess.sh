#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(( ( RANDOM % 1001 )  + 1 ))
echo "Enter your username:"
read USERNAME
SEARCH_RESULT=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")

if [[ -z $SEARCH_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$USERNAME')")
else
  echo $SEARCH_RESULT | while IFS="|" read USER_ID NAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
echo "Guess the secret number between 1 and 1000:"
TRIES=0
GUESS=-1
while [[ $GUESS -ne $NUMBER ]]
do
  read GUESS
  let "TRIES += 1"
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -lt $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
  fi
done
SEARCH_RESULT=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")
echo $SEARCH_RESULT | while IFS="|" read USER_ID NAME GAMES_PLAYED BEST_GAME
do
  echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
  let "GAMES_PLAYED += 1"
  if [[ -z "$BEST_GAME" ]]
  then
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$TRIES WHERE name='$NAME'") 
  elif [[ "$tries" -lt "$BEST_GAME" ]]
  then
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$TRIES WHERE name='$NAME'")
  else
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE name='$NAME'")
  fi
done





