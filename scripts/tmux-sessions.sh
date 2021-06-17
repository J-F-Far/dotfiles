#!/bin/bash

WORK_DIR=~/Work
NOTES="$WORK_DIR/notes"
FRDR_DEPLOY="$WORK_DIR/frdr_deploy"
FRDR_PUBLISH="$WORK_DIR/frdr_publish"

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | grep "$window")
    echo "$hasWindow"
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d"
        if [ $# -gt 0 ]; then
            cmd="$cmd $@"
        fi
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    window=$2
    shift
    shift
    cmd="tmux new -s $session -d -n $window $@ > /dev/null 2>&1"

    echo "Creating Session: $cmd"
    eval $cmd
}

# Get or create the notes file for the current year/month
getOrCreateNotes() {
    year=$(date +%Y)
    month=$(date +%B)
    month=${month,}

    if [[ ! -e $NOTES/$year ]]; then
        mkdir $NOTES/$year
    fi
    if [[ ! -e $NOTES/$year/$month ]]; then
        touch $NOTES/$year/$month
    fi
    echo "$NOTES/$year/$month"
}

createSession work primary -c $WORK_DIR
createWindow work notes -c $NOTES nvim $(getOrCreateNotes)
createWindow work frdr_deploy -c $FRDR_DEPLOY; tmux send-keys -t work:frdr_deploy 'source ~/ansible/bin/activate' Enter
createWindow work frdr_publish -c $FRDR_PUBLISH nvim .
