#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t  --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games, teams;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
do
  if [[ $YEAR != 'year' ]]
  then
    # check winner team in teams
    WINNER_TEAM_PRESENT=$($PSQL "select team_id from teams where name='$WINNER'")
    if [[ -z $WINNER_TEAM_PRESENT ]];
    then
      # insert winner team in teams
      WINNER_TEAM_INSERTED=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $WINNER_TEAM_INSERTED == "INSERT 0 1" ]]
      then
        echo -e "\n Winner Team $WINNER inserted"
      fi
    fi
    # check opponent team in teams
    OPPONENT_TEAM_PRESENT=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $OPPONENT_TEAM_PRESENT ]];
    then
      # insert opponent team in teams
      OPPONENT_TEAM_INSERTED=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $OPPONENT_TEAM_INSERTED == "INSERT 0 1" ]]
      then
        echo -e "\n Opponent Team $OPPONENT inserted"
      fi
    fi
    # Enter Game info in games table
    # get winner team id
    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    # get opponent team id
    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    
    GAME_INFO_INSERTED=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $GAME_INFO_INSERTED == "INSERT 0 1" ]]
    then
      echo Inserted Game info, $YEAR $ROUND $WINNER $OPPONENT
    fi
  fi
done