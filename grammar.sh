#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
LOCAL_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
DIR_BIN="$HOME/voxforge/bin" 
DIR_HTK="$DIR_BIN/htk" 
DIR_JULIUS="$DIR_BIN/julius-4.3.1" 
DIR_GRAMMAR="$LOCAL_DIR/scripts" 
DIR_TUTORIAL="$HOME/voxforge/tutorial" 
DIR_CLARA="$LOCAL_DIR/clara" 

enterDir()
{ 
	cd "$1" || exit
	echo "-----Enter folder $1-----"
}

enterDir "$DIR_TUTORIAL"
echo "----------Generating dict files----------"
julia ../bin/mkdfa.jl clara
echo "----------Done dict----------"

echo "----------Generating word lists from prompt file----------"
julia ../bin/prompts2wlist.jl prompts.txt wlist
echo "----------Done word lists----------"

echo "----------Generating monophones----------"
python ../bin/dict2phone.py 
echo "----------Done monophones----------"