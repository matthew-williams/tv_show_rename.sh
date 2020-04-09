#!/bin/bash

#----------------------------------------
# A shell script for renaming and converting TV Show files on Linux Servers
# Written by: Matthew Williams
# Last updated on: 2019.Nov.24
# Distributed under The MIT License (MIT)
#
# Dependencies
# rename
# ffpeg
#
#			---- IMPORTANT ----
# 	This script is completely unsupported and can remove files
# USE at your own risk!
#----------------------------------------

# Error out script on errors
set -e

rename 's/^[1-9]x/S1E/' *.mkv && rm *.ignore && rename 's/.mkv/ (720p).mkv/' *.mkv

for file in *.mkv
    do sudo ffmpeg -i "$file" -codec copy '/usr/share/tvshows/Friends/Season 3/'"${file/.mkv/.mp4}"
done
