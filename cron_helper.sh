#!/bin/bash

source ~/.bash_profile
cd $(dirname `echo $0`)
bundle exec ruby ./run.rb > ~/.tmux-right
