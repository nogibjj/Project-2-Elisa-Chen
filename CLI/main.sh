#!/usr/bin/env bash

#build a function to take in a file and break it into n smaller files
function split_file() {
    #take in the file name - REQUIRED FIELD
    FILENAME=$1

    # max size of each file - OPTIONAL FIELD
    SIZE=${2:-25M}

    # indicate whether header exists or not. By default it's true - OPTIONAL FIELD
    HEADER=${3:-true}

    # indicate whether you want the file shuffled or not. By default it's true - OPTIONAL FIELD
    SHUFFLE=${4:-true}

    #take in the output file name. By default it'll take the file name and append _Part to it - OPTIONAL FIELD
    output_file=${5:-${FILENAME%.*}"_part."}

    #name of shuffled file
    SHUFFLED_FILE="shuffled_file."${FILENAME##*.}
    
    #check if the file exists
    if [ ! -f $FILENAME ]; then
        echo "File $filename does not exist"
        exit 1
    fi

    mkdir split_data_files

    #if shuffle is true, shuffle the file
    if [[ $SHUFFLE == true ]]; then
        if [[ $HEADER == true ]]; then
        #if header is true, shuffle the file and save the header
            ( head -n 1 $FILENAME ; tail -n +1 $FILENAME|shuf ) > split_data_files/$SHUFFLED_FILE
        else
            #if header is false, shuffle the file
            shuf $FILENAME > split_data_files/$SHUFFLED_FILE
        fi
    fi

    cd split_data_files

    #if header is true, split the file and save the header in each file
    if [[ $HEADER == true ]]; then
        tail -n +2 $SHUFFLED_FILE | split -b $SIZE - --filter='sh -c "{ head -n1 '$SHUFFLED_FILE'; cat; } > $FILE"' ${output_file}
    else
        split -b $SIZE $SHUFFLED_FILE $output_file
    fi

    #remove the shuffled file
    #rm $SHUFFLED_FILE
}

split_file $1 $2 $3 $4 $5

