#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
LEN=$($PSQL "SELECT COUNT(*) FROM games")
if [[ $LEN!=32 ]]
then
    $PSQL "TRUNCATE TABLE games, teams" 
fi

insert (){
    local TABLE=$1
    local COL=$2
    local VALUE=$3
    local INSERT_STATUS
    INSERT_STATUS=$($PSQL "INSERT INTO $TABLE($COL) VALUES('$VALUE')")
    if [[ $INSERT_STATUS='INSERT INTO 0 1' ]]
    then
      echo "Inserted $VALUE into $TABLE" 
    fi
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS 
do
    if [[ $YEAR != year ]]
    then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        if [[ -z $WINNER_ID ]]
        then
            insert teams name "$WINNER"
            WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        fi
        if [[ -z $OPPONENT_ID ]]
        then
            insert teams name "$OPPONENT"
            OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        fi
        GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID' AND year=$YEAR")
        if [[ -z $GAME_ID ]]
        then
            INSERT_STATUS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $OGOALS)")
            if [[ $INSERT_STATUS='INSERT INTO 0 1' ]]
            then
              echo "Inserted game into games succesfully!" 
            fi
        fi
    fi
done