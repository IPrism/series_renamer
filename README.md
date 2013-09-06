[![Build Status](http://travis-ci.org/IPrism/series_renamer.png)](http://travis-ci.org/IPrism/series_renamer)

#Series renamer
Rename the series episodes (video and subtitles) withe the following convention Serie_name - S[season_number]E[episode_number].[extention]

Usefull with media players like xbmc
## Prerequisites
You need to have a folder organization like this and put files into correct folders
	
	./
		Serie name/
			Season 1/
			Season 2/
		Serie 2/
			Season 1/
		
## Installation
	git clone https://github.com/IPrism/series_renamer.git
	cd series_renamer
	rake install

## Usage
	srenamer path
