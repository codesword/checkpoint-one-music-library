# Ruby Music Library

## Overview
This is a command line based music library that parses a directory of MP3 files and imports them into a library. Users are then able to run the commands listed in the commands section below.


## Installation
 - First ensure you have ruby installed on your system. 
 - Download or clone this repo.
 - Open the command line
 - Navigate to the repo folder
 - Run 'bundle install'
 - Run 'ruby bin/musiclibrary' to start the music library

## How does it work
When the Music Library is called, it reads from the directory of music files.
The default path is "./db/mp3s"
To change this path, open lib/musiclibrarycontroller.rb and change the path.
The music files are expected to be named in the following format: 'Artist - Song - Genre'
The music files are parsed and stored in an array

## Commands
The valid commands of the application are
1.) 'list songs' to list all songs
2.) 'list artists' to list all artists
3.) 'list genres' to list all genres
4.) 'play song' plays specified song
5.) 'list artist' to list an artist's songs
6.) 'list genre' to list a genre's songs
7.) 'help' to list the commands
8.) 'exit' closes the music library

## Testing
 - Make sure 'rspec' is installed
 - Run rspec