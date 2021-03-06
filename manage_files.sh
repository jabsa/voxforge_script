#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
LOCAL_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

DIR_SCRIPTS="$LOCAL_DIR/scripts" 
DIR_CLARA="$LOCAL_DIR/clara_minimal" 
DIR_SPEAKER_01="$DIR_CLARA/wav/speaker_01" 

DIR_VF="$HOME/voxforge"

DIR_BIN="$DIR_VF/bin/" 
DIR_HTK="$DIR_BIN/htk" 
DIR_JULIUS="$DIR_BIN/julius-4.3.1" 

DIR_TUTORIAL="$DIR_VF/tutorial" 
DIR_TRAIN="$DIR_VF/train" 
DIR_MANUAL="$DIR_VF/manual" 
DIR_WAV="$DIR_TRAIN/wav" 
DIR_MFCC="$DIR_TRAIN/mfcc" 
DIR_MFCC_01="$DIR_MFCC/speaker_01" 

createHMMs()
{
	for i in {0..21}
	do
		createDir "$DIR_TUTORIAL/hmm$i"
	done
}

createDir()
{
	if [ ! -d "$1" ]; then
		mkdir "$1" || exit
		echo "-----Folder $1 created-----"
	else 
		echo "-----Folder $1 already exists-----"
	fi
}

enterDir()
{
	createDir "$1"  
	cd "$1" || exit
	echo "-----Enter folder $1-----"
}

copyFiles()
{
	cp -R "$1" "$2" || exit
	echo "-----Copy file $1 to folder $2-----"
}

createDir "$DIR_VF"
createDir "$DIR_BIN"
createDir "$DIR_TUTORIAL"
createDir "$DIR_TRAIN"
createDir "$DIR_MANUAL"
createDir "$DIR_WAV"
createDir "$DIR_MFCC"
createDir "$DIR_MFCC_01"
createHMMs

copyFiles "$DIR_CLARA/clara.grammar" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/clara.voca" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/prompts.txt" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/clara_lexicon" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/codetrain.scp" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/train.scp" "$DIR_TUTORIAL"
copyFiles "$DIR_CLARA/clara.gram" "$DIR_TUTORIAL"

copyFiles "$DIR_SCRIPTS/tieSil.py" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/macros.py" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/formatHmmdefs.py" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/dict2phone.py" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/mkdfa.jl" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/prompts2wlist.jl" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/prompts2mlf.jl" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/mktrihed.jl" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/fixfulllist.jl" "$DIR_BIN"
copyFiles "$DIR_SCRIPTS/mkclscript.jl" "$DIR_BIN"

copyFiles "$DIR_SCRIPTS/maketriphones.ded" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/mktri.led" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/sil.hed" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/wav_config" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/proto" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/config" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/mkphones0.led" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/mkphones1.led" "$DIR_TUTORIAL"
copyFiles "$DIR_SCRIPTS/tree.hed" "$DIR_TUTORIAL"

copyFiles "$DIR_CLARA/clara.jconf" "$DIR_MANUAL"

copyFiles "$DIR_SPEAKER_01" "$DIR_WAV"
