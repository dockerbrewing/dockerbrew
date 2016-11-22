dockerbrew
==========

Any Command, Anywhere!

# Overview

DockerBrew lets you have instant access to almost any computer command you can
think of; without compiling it or installing it. Say you want to show someone
the ever popular, but fairly silly command `cowsay`:

```
> cowsay 'Hello World!'
-bash: cowsay: command not found
> bash      # Start a new shell (just to show it is temporary)
> dockerbrew use cowsay     # Create a bash function called `cowsay`
> cowsay 'Hello World!'
 ______________
< Hello World! >
 --------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
> exit
exit
> cowsay 'Hello World!'
-bash: cowsay: command not found
```

You installed and used a command that goes away when you exit the shell. To
install it permanently, just add a line like this to your shell startup file:

```
dockerbrew use cowsay
```

# How it Works

The DockerBrew project creates a Docker container for every command it
supports. The `dockerbrew use <command-name>` command creates a shell function
to run that container; setting all the appropriate flags and options for the
`docker run` command to run the command.

# Installation

This is the instructions for installing the dockerbrew command itself:

```
git clone https://github.com/dockerbrewing/dockerbrew
source dockerbrew/.rc
```

To make the installation permanent, add it to your shell startup file like:

```
echo "source /path/to/dockerbrew/.rc" >> ~/.bashrc
```

After installation you can start brewing new commands at will!

# Status

This is a brand new prototype. Run away now!

# To Do

Lots! Join in on irc.freenode.net/#dockerbrew
