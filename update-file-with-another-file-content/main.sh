#!/bin/bash

# author ANTELME Mathis

# DEAFULT VALUES
DEFAULT_DESTINATION_FILE="data.conf"
DEFAULT_SOURCE_FILE="dataToAdd.conf"

# this function is used to append the content of an config file to another one
# only if they are not in the destination file
function updateFileFromOtherFileContent {
    if [ $# -eq 2 ]; # if the function is called with 2 parameters 
    then
        DST=$1 # the destination file
        SRC=$2 # the source file

        # displaying confirmation message
        echo "[status]: trying to update $DST with $SRC content"

        # checking if files exists, else leaving programm with error code
        if [[ -f $DST ]];
        then
            echo "[status]: found $DST" 
        else
            echo "[fatal]: cannot find $DST";
            exit 1
        fi

        if [[ -f $SRC ]];
        then
            echo "[status]: found $SRC" 
        else
            echo "[fatal]: cannot find $SRC";
            exit 1
        fi

        # backing up the destination file
        cp "$DST" "$DST.backup"

        if [ $? -ne 0 ]; # if the copy of the content failed
        then
            echo "[warning]: cannot backup $DST"
        else
            echo "[status]: backed up $DST as $DST.backup"
        fi 

        echo "[status]: looking for $SRC content in $DST"
        
        # checking if SRC content is not present in the DST file
        if [ "$(diff --unchanged-line-format= --old-line-format= --new-line-format='%L' "$DST" "$SRC" | wc -l)" -eq "0" ];
        then # if so, nothing left to do
            echo "[status]: $SRC content already present in $DST - Done"
        
        else # else, appending the content of SRC in DSTs
            echo "[status]: $SRC content not found in $DST, appending it"

            # we append the content of SRC to DST
            echo "" >> "$DST"
            cat "$SRC" >> "$DST"

            if [ $? -ne 0 ]; # if the copy of the content failed
            then
                echo "[fatal]: cannot append $SRC content in $DST, quitting"
                exit 1 # leaving program with error code
            else
                echo "[status]: $SRC content has been appended to $DST - Done"
                exit 0 # leaving program
            fi 
        fi
    else # if the function is called with the wrong number of arguements
        echo -e "[fatal]: wrong number of arguements. Function should be called as follows:\n\t updateFileFromOtherFileContent <destinationFile> <sourceFile>"
        exit 1 # quitting program with error code
    fi
}

# calling the function
updateFileFromOtherFileContent "$DEFAULT_DESTINATION_FILE" "$DEFAULT_SOURCE_FILE"