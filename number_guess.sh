#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

GUESS_NUMBER(){
 SECRET_NUMBER=$((RANDOM % 1000 + 1))
 CONTINUE_LOOP=true
 NUMBER_OF_GUESSES=0
 echo "$SECRET_NUMBER"
 echo "Guess the secret number between 1 and 1000:"
 while  [ $CONTINUE_LOOP = true ]
 do
  ((NUMBER_OF_GUESSES++))
  read GUESS
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
   CONTINUE_LOOP=false
   echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
   PLAYER_INFO=$($PSQL "SELECT username, games_played, best_game FROM game WHERE username='$USERNAME'")
   echo "$PLAYER_INFO" | while read NAME BAR GP BAR BG
   do
   if [[ $NUMBER_OF_GUESSES -lt $BG || -z $BG ]]
   then
  
    BEST_RECORD=$($PSQL "UPDATE game SET games_played=$GP+1, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
   fi
   done
  else
   if [[ ! $GUESS =~ [0-9] ]]
   then
   echo "That is not an integer, guess again:"
   fi
   if [[ $GUESS -gt $SECRET_NUMBER ]] 
   then
   echo "It's lower than that, guess again:"
   fi
   if [[ $GUESS -lt $SECRET_NUMBER ]]
   then
   echo "It's higher than that, guess again:"
   fi
  fi
 done
}

echo "Enter your username:"
read USERNAME

CHECK_USERNAME=$($PSQL "SELECT username FROM game WHERE username='$USERNAME'")
if [[ -z $CHECK_USERNAME ]]
then
 INSERT_USERNAME=$($PSQL "INSERT INTO game(username,games_played) VALUES('$USERNAME',0)")
 echo "Welcome, $USERNAME! It looks like this is your first time here."
 GUESS_NUMBER
else
 PLAYER=$($PSQL "SELECT username, games_played, best_game FROM game WHERE username='$USERNAME'")
 echo "$PLAYER" | while read NAME BAR GAMES_PLAYED BAR BEST_GAME
 do
 echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
 done
 GUESS_NUMBER 
fi

