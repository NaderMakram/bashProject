#!/bin/bash

options=("Show Databases" "Create New Database" "Use Database" "Delete Database" "Quit")
while [[ "$option" != "Quit" ]] 
do
	select option in "${options[@]}"
	do
		case $option in
			"Show Databases") . ./showDB.sh; break ;;
			"Create New Database"). ./createDB.sh; break ;;
			"Use Database") . ./useDB.sh break ;;
			"Delete Database") . ./deleteDB.sh; break ;;
			"Quit")  break; exit $?;;
			*) echo "Invalid option $REPLY";;
		esac
	done
done
