#!/bin/bash
mkdir -p db_collection # insure db_collection folder is always available
find ~+ -type f,d | xargs chmod a+x # give permission  to all files and dirs in the project

tput setaf 10 #Matrix color
# Later we can edit the $USER to force capitalization on first letter and lower on the rest of username.
# this will do for now though.
echo ---------------------------------------------------------------------------
echo
echo "                Welcome ${USER} to Bash-DBMS System 🥳"
echo "                 Developed by: M.Elsayed and M.Mohy"
echo
echo ---------------------------------------------------------------------------

tput setaf 2
echo Please choose an action:
curr_db="\0" # equal to nothing
PS3="Action:"
select db_input in "Create DB" "List DBs" "Select DB" "Drop DB" "Exit"
do
    case $db_input in
    "Create DB" )
        echo Enter DB name:
        read
        bash db_layer/create_db.sh $REPLY
    ;;
    "List DBs" )
        bash db_layer/list_db.sh 
    ;;
    "Select DB" )
        echo 'Choose DB number to select'
        curr_db=$(db_layer/select_db.sh $REPLY)
        echo $curr_db
    ;;
    "Drop DB" )
        echo Choose a DB number to drop
        bash db_layer/drop_db.sh 
    ;;
    "Exit" )
        exit
    ;;
    * )
        echo Not valid input, please choose a number from the menu.
    esac
done
