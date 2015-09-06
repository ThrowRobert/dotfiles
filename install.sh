#!/bin/bash
echo "if you havent, BACK STUFF UP INCASE THIS FAILS"
read -p "this will delete all files in your home directory with matching names to the files in this directory and replace them with symlinks to this directory, are you sure you want to continue? [y/N] " -n 1 -r -s
echo ""
if [[ $REPLY != "y" ]] && [[ $REPLY != "Y" ]]
then
    echo "doing nothing"
    exit 1
fi


echo "linking files to: " $PWD

for i in $(ls -a | grep -v .config | grep -v ".git*" | grep -v ".*~" | grep -v install.sh)
do
    if test "$i" != "." && test "$i" != ".."
    then
	rm -r ~/$i #remove existing files and directories, even existing symlinks
	ln -s $PWD"/"$i ~/$i # create new symlink to here
    fi
done

PFIX=".config" # do the config directory, since its special case
for i in $(ls -a .config)
do
    if test "$i" != "." && test "$i" != ".."
    then
	rm -r ~/$PFIX/$i
	ln -s $PWD/$PFIX/$i ~/$PFIX/$i
    fi
done

echo "script done, files should be synced now"
