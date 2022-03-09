# gif_scripts
Simple FFmpeg scripts to generate gif files.

### Notes:
1. Written and tested with the bash shell (GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu))
2. The .sh script files must be executable and readable by the user running the script `chmod 740 imgs_to_gif.sh`
3. Executed with `sh imgs_to_gif.sh`
4. The filesize of the output can be quite large e.g: 20 MiB+

### Requirements:
Shell (Tested with GNU Bash 5.1.16(1)) but should be sh compatible.

ffmpeg (Tested with ffmpeg 2:5.0-4) but earlier version should also work provided they support the following filters:

    palettegen - https://ffmpeg.org/ffmpeg-filters.html#palettegen-1

    paletteuse - https://ffmpeg.org/ffmpeg-filters.html#toc-paletteuse

    crop - https://ffmpeg.org/ffmpeg-filters.html#crop

    fps - https://ffmpeg.org/ffmpeg-filters.html#fps-1

    trim - https://ffmpeg.org/ffmpeg-filters.html#trim


### To-Do:
 1. Impliment a more complex filter-chain that doesn't require an intermediate palette.png file.
 2. Add cli input options (fps/source/dest).
 3. Add options to adjust quality vs size.
