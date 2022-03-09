#!/bin/sh

# Notes:
# Written and tested with the bash shell (GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu))
# You must have ffmpeg installed (tested on ffmpeg 2:5.0-4).
# This file must be executable and readable by the user running the script `chmod 740 imgs_to_gif.sh`
# The script is executed with `sh imgs_to_gif.sh`
# The filesize of the output can be quite large e.g: 20 MiB+


# Name/path of the file(s) to convert to a gif.
# Defaults to looking in the same directory as the script.
# Expects the format '####.png' by default AKA `saveFrame("####.png");` in processing.
in_file="%04d.png";

# Saves the file in the same directory as the script.
# Names the output file as the current unix time in seconds by default.
# May run into issues if you try and generate more than 1 gif per second.
outfile=`date +%s`;

# Generate a color-pallete based on the input file and saves it as "pallette.png" in the current working directory.
# If it asks you if you want to overwrite the pallete you want yes `y`
ffmpeg -i "$in_file" -lavfi palettegen=reserve_transparent=on pallette.png;

# Uses the pallete and the video to create a gif.
# framerate is the number of "Frames Per Second" of input and fps is the output (Can be used to speed-up/Slow-down the video).
# By default you probably want them both to be equal to `frameRate()`.
ffmpeg -framerate 60 -i "$in_file" -i "pallette.png" -lavfi fps=fps=60,paletteuse "$outfile"".gif"
