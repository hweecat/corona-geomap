#!/usr/bin/env bash
set -e # Prevents script from running if there are any errors.
git stash save # Stashes everything away in case you didn't commit them.
python main.py # insert build script here
git add .
git commit -m "Deploy new geomap using shell script"
git push --all