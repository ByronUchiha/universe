PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -n $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SELECTED_ELEMENT=$($PSQL "SELECT e.name, e.symbol, e.atomic_number, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e INNER JOIN properties AS p USING(atomic_number) INNER JOIN types AS t USING(type_id) WHERE e.atomic_number=$1")
  else
    SELECTED_ELEMENT=$($PSQL "SELECT e.name, e.symbol, e.atomic_number, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e INNER JOIN properties AS p USING(atomic_number) INNER JOIN types AS t USING(type_id) WHERE e.name='$1' OR e.symbol='$1'")
  fi
  if [[ -z $SELECTED_ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$SELECTED_ELEMENT" | while IFS="|" read NAME SYMBOL ATOMIC_NUMBER ATOMIC_MASS TYPE MP BP
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi

