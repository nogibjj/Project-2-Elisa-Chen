#!/usr/bin/env bash

#build a function to take in a file and break it into n smaller files
function split_file() {
    #take in the file name - REQUIRED FIELD
    filename=$1
    # max size of each file - OPTIONAL FIELD
    size=${2:-25M}
    # indicate whether header exists or not. By default it's true - OPTIONAL FIELD
    header=${3:true}
    # indicate whether you want the file shuffled or not. By default it's true - OPTIONAL FIELD
    SHUFFLE=${4:true}
    #take in the output file name. By default it'll take the file name and append _Part to it - OPTIONAL FIELD
    output_file=${5:-${filename%.*}"_part."${filename##*.}}
    #name of shuffled file
    SHUFFLED_FILE="shuffled_file."${filename##*.}
    
    #check if the file exists
    if [ ! -f $filename ]; then
        echo "File $filename does not exist"
        exit 1
    fi

    mkdir split_data_files
    #touch split_data_files/$SHUFFLED_FILE

    #if shuffle is true, shuffle the file
    if [[ $SHUFFLE = true ]]; then
        echo "you got here for sure"
        if [[ $header = true ]]; then
        #if header is true, shuffle the file and save the header
            ( head -n 1 $filename ; tail -n +1 $filename|shuf ) > split_data_files/$SHUFFLED_FILE #I'm not sure about this. I wanted to find the extension.
        else
            #if header is false, shuffle the file
            shuf $filename > split_data_files/$SHUFFLED_FILE
            echo "you got here"
        fi
    fi

    cd split_data_files

    #split the file
        #if header is true, split the file and save the header in each file
    if [[ $header = true ]]; then
        tail -n +2 $SHUFFLED_FILE | split -b $size - --filter='sh -c "{ head -n1 $shuffled_file; cat; } > $FILE"' split_data_files${output_file}
    else
        split -b $size $SHUFFLED_FILE > $output_file
    fi

    #remove the shuffled file
    #rm $SHUFFLED_FILE
}

split_file $1 $2 $3 $4 $5

