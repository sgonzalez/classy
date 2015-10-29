#!/bin/bash

###############################################################
### Copyright 2015 by Santiago Gonzalez <slgonzalez@me.com> ###
###############################################################

gem install colorize

ln -sf "$(cd "$(dirname "classy.rb")"; pwd)/$(basename "classy.rb")" /usr/local/bin/classy