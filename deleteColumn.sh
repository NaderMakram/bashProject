#! /bin/bash

# read column name from user
read -p "Enter column name: " colName;

# get column names from Metadata/$tableName
colNames=($(awk -F: '{print $1}' Databases/$currDB/Metadata/$tableName.metadata))

colFlag=1   #false

# get column number
for i in "${!colNames[@]}"
do 
    if [[ $colName == "${colNames[$i]}" ]]; then
        colFlag=0   #true
        colNum=$(($i+1));  #column-Number
    fi   
done

# validate colName
if [[ $colFlag == 0 ]]; then
# valid colName

    # delete column from Data/$tableName
    cut -d':' --complement -f$colNum Databases/$currDB/Data/$tableName > Databases/$currDB/Data/$tableName.tmp
    mv Databases/$currDB/Data/$tableName.tmp Databases/$currDB/Data/$tableName

    # delete line containing column from Metadata/$tableName
    sed -i "$colNum"d Databases/$currDB/Metadata/$tableName.metadata
else
    echo "ERROR:In-valid column name.";
fi