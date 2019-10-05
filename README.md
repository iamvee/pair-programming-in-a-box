# Pair Programming in a Box

## Using `pair` docker image 

Start a server on your local machine, that allows you to share a development environment with another user.

### Building the server (on server)


     $ docker build -t pair

### Starting the server (on server)


     $ docker run -p 8080:22 -dt pair

### Connecting to the server (everyone)


     $ ssh -X -p 8080 root@<your-machine-ip>

This will fireup the following
* a shared emacsclient session with all connected users
* a shared terminal session via tmux


## alternative online tools:

### pair coding websites

* [codeshare.io](https://codeshare.io)
* add more

### realtime boards

* [witeboard](https://witeboard.com/)
* [realtimeboard](http://realtimeboard.com/)
* [Google's Jamboard](https://jamboard.google.com/) : easy to access, limited features, easily links to other google tools, say, keep, docs, calendar, ... 
*
