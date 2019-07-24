# Tmux Spanish Lesson

Purpose. This script reads in a spanish verb database and converts it into a random,
short blurb intended to be displayed by a tmux status bar.

# License 

I am using the spanish database from https://github.com/ghidinelli/fred-jehle-spanish-verbs
which is released under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

So I will release mine under the same thing in license.txt.

# How to make the software ready for use

I have ruby installed, and then from the directory with this project,
I run 'bundle'.

From here, the run.rb script should output a random verb each time you run it.

# Crontab example

I have mine update every minute, but you can do whatever you like. Or just call this
manually for it to update the blurb when you like.

```
* * * * * /home/username/src/tmux_spanish_tutor/cron_helper.sh > ~/.tmux-right
```

# Tmux configuration

Tmux is too configurable for me to give you a full example config, but if you are familiar with it,
I basically have as a partial snippet:

```
status_right="$right_separator#(tail -1 ~/.tmux-right)${right_separator}"
```

# Show me a picture

Here's a little highlighted area I took a snapshot of while writing this readme.

![Imgur Image](https://i.imgur.com/XrtYncE.jpg)
