#!/usr/bin/env bash

#create a function to repeat the process
repeat() {
    for i in `seq 1 $1`; do
        echo $2
    done
}

repeat $1 $2
