#!/bin/sh

# Notes:
# The script will save the output in the same location as the script.
# It was written and tested with the bash shell.
# You must have ffmpeg installed (tested on ffmpeg 2:5.0-4).
# This file is executable and readable by the user running the script `chmod 740 gif.sh`
# The script is executed with `sh gif.sh`
# The filesize of the output can be quite large e.g: 20 MiB+


# Name/path of the file to convert to a gif.
# Defaults to looking in the same directory as the script.
in_file="file.ext";

# The size of the end result (starting from the top left) in this case 800px by 600px. The next two numbers are
# the offset from the top left in width:height, in this case we start the box at width=0 but start it at 25 from
# the top as to crop off the top 25px (The window bar). To make things easier you likely want to position your
# processing display window in the upper left corner of the screen. rather than try to calculate the offset required
# if it was in the middle of the screen.
crop="800:600:0:25";

# Trip the video-stream to the range between "start" and "end".
trim="start='00\:00\:02.333':end='00\:00\:05.800'";

# Names the output file as the current unix time in seconds.
outfile=`date +%s`;

# Generate a color-pallete based on the input file and saves it as "pallette.png" in the current working directory
ffmpeg -i "$in_file" -lavfi trim="$trim",crop="$crop",palettegen=reserve_transparent=on pallette.png;

# Uses the pallete and the video to create a gif.
ffmpeg -i "$in_file" -i "pallette.png" -lavfi trim="$trim",crop="$crop",paletteuse "$outfile"".gif"
