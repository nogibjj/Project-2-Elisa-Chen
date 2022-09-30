[![Bash Command Line](https://github.com/nogibjj/Project-2-Elisa-Chen/actions/workflows/manual.yml/badge.svg)](https://github.com/nogibjj/Project-2-Elisa-Chen/actions/workflows/manual.yml)
# Project-2-Elisa-Chen
This project was built as part of IDS 706 Data Engineering Class at Duke University. The overall task was to build a Bash command-line tool that performs a useful data preparation task such as truncating data, sorting it, cleaning data, or doing ETL. 

## Description
This is a repository for a CLI Tool that takes in a data input and partitions it into smaller datasets. 

## Architecture
Remember to add a graph

## Motivation
We are provided a vast amount of data in today's digital world. This has enabled us as humans to make better decisions and to expand our capabilities in AI and Machine Learning. However, at times, we might need to partition our data into smaller parts for convenience or for processing purposes:
1. Certain systems / platforms have limitations on the size of data they can send / receive (EX: emails can typically only attach 25MB worth of data, Standard GitHub can only commit up to 100Mb worth of data)
2. Data Scientists might want to partition data for cross-validation or general model testing purposes
3. Data Engineers can control data pipelines better if input files are distributed (EX: any corrupted files can be removed without breaking the whole pipeline)

## Instructions To Use The CLI Tool
To run the function, simply type in `docker something something main.sh *filename* *filesize* *header* *shuffle* *prefix*` where
- `filename` is the name of the file that is located in the same directory in which the command is run. This CLI tool supports .csv, .txt and .tsv files. 
- `filesize` is the maximum size of each partitioned file. By default this is set to 25MB. The symbols for filesizes are 'K' for KB, 'M' for MB and 'G' for GB. If you wanted files that were the size of 100MB then you would type in 100M. 
- `header` is a "boolean" (bash doesn't really have booleans) that is used to denote whether the file has a header row or not. If the file has a header row (`header` = true) then the header row will be included as the header of each partitioned file, otherwise the first row will be treated as any other row in the data body. By default this value is set to true.
- `shuffle` is a "boolean" that is used to denote whether the partitioned files should be shuffled or not. By default the value is set to true, which means that before the file is partitioned into smaller chunks, the rows of the data body (not included header if it exists) are shuffled. 
- `prefix` is a parameter that can be used to name the prefix of the partitioned files. By default it's set to `filename`_part. As an example, if the file that is partitioned is called `sample.csv`, then the first three partitioned files would be called `sample_part.aa`, `sample_part.ab`, `sample_part.ac`

An example command could be `docker something something main.sh sample.csv 100M true false custom_prefix.` which would partition the sample file into 100MB chunk files in the order they appear in the original file, each file named as custom_prefix.xx

## TODO
1. Test the docker thing in cloud9. Maybe bring a big data source to ECR and then apply this command tool to it.
2. Update docker link
3. Finish writing up read me (add the diagram)
4. Record final demo
