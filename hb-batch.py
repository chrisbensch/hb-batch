# Original credit to Geoffrey Tuttle
# https://geoffreytuttle.wordpress.com/2016/08/07/batch-converting-video-files-with-handbrake-and-python/
# This script reads the *.mkv files in a given directory, and uses Handbrake
# to convert them to a smaller filesize and specific naming scheme.
# This script written by Geoffrey Tuttle
 
# Import necessary modules
from pathlib import Path  # manipulates computer directories
from subprocess import call  # call(command, shell=True) runs command from cmd
 
# Define locations and show name
input_path = Path('C:/Temp/MoviesTemp/')  # Input directory
output_path = Path('C:/Temp/MoviesDone/')  # Output directory
#show_name = 'Daria'
 
# Create list of files to be converted
handles = [x.stem for x in input_path.iterdir()]
input_path = 'C:\\Temp\\MoviesTemp\\'
output_path = 'C:\\Temp\\MoviesDone\\'
 
# Iterate through list of video files, converting them using Handbrake
for old_filename in handles:
    # Create new filename in a readable format for Plex
    #new_filename = show_name + ' S{}E{}'.format(old_filename[:2],
    #                                            old_filename[2:])
    # Create the command for running Handbrake for each path and filename
    command = ('"C:\Program Files\HandbrakeCLI\HandBrakeCLI.exe" -i "' + input_path + '{}.mkv" -o "'output_path + '{}.mp4" --preset-import-file=Bensch4k-HW-Handbrake.json -Z "Bensch4kHW"')
 
    print(old_filename + ' conversion started')
    call(command, shell=True)
    #print(new_filename + ' converted')
