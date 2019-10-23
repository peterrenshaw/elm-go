#!/bin/bash

#=========
# name: elm-go.sh
# date: 2019OCT23
# desc: ELM compiler wrapper
#       because I want to format and make without typing in the same
#       paths all the time, I have a script to do this
# todo
#       * check elm / elm-format exist
#
# recs: bourne shell / bash
#
# opts: Compile and format
#         -a
#       Format only
#         -f
#       Compile only
#         -c
#       Input filename
#         -i
# usge: 
#      
#       --compile a file
#       $ ./go.sh -i src/hello.elm -c
#       File <src/hello.elm>
#       Success! Compiled 1 module.                                          
#       Status: format (0) compile (1)
#
#       -- format a file
#       $ ./go.sh -i src/hello.elm -f
#       File <src/hello.elm>
#       Processing file src/hello.elm
#       Status: format (1) compile (0)
#
#       -- compile then format
#       $ ./go.sh -i src/hello.elm -a
#       File <src/hello.elm>
#       Success! Compiled 1 module.                                          
#       Processing file src/hello.elm
#       Status: format (1) compile (1)
#=========


{
  # declare
  format=0
  compile=0
  filename=""

  # process file options supplied
  #   -i input source file
  #
  #   -a all, compile then format
  #   -f format only
  #   -c compile only
  #
  while getopts  "afci:" flag
  do
    # get the filepathname 
    if [ $flag = 'i' ] 
    then
    	filename=$OPTARG
        echo "File <$filename>"
    fi

    # get ALL option
    if [ $flag = 'a' ]
    then
        if [ $filename ]
        then
          format=1
          compile=1  	  
          elm make "$filename"      
          elm-format --yes "$filename"
        fi
    fi

    # get the format option
    if [ $flag = 'f' ]
    then
	format=1
 	if [ $filename ]
        then   
	  elm-format --yes "$filename"
        fi     
    fi

    # get the compile option
    if [ $flag = 'c' ]
    then
        compile=1
	if [ $filename ]
        then
          elm make "$filename"
        fi     
    fi
  done

  # show status of args
  echo "Status: format ($format) compile ($compile)"
  echo ""

} >&2

