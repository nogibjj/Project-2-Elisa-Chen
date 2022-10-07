#!/usr/bin/env bash

#build a function to take in a file and break it into n smaller files
function split_file() {
    #take in the file name - REQUIRED FIELD
    FILENAME=$1

    # number of files to split into - OPTIONAL FIELD
    NUM_FILES=${2:-2}

    #split the file into n files
    split -l $NUM_FILES $FILENAME $FILENAME"_part."
}