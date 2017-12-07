# Dynalite

[![Docker Automated build](https://img.shields.io/docker/build/countingup/dynalite.svg)](https://hub.docker.com/r/countingup/dynalite/builds/)

A docker image for [Dynalite](https://github.com/mhart/dynalite) which provides a Node.js based implementation of [AWS DynamoDB](https://aws.amazon.com/dynamodb/), a No-SQL database. This can then be used in development and testing.

Based on the latest Node.js 8 (LTS) Alpine library image from Docker Hub.

Supports passing all options to Dynalite (also see the [README](https://github.com/mhart/dynalite/blob/master/README.md)):

```
$ docker run -p 4567:4567 countingup/dynalite --help

Usage: dynalite [--port <port>] [--path <path>] [options]

A DynamoDB http server, optionally backed by LevelDB

Options:
--help                Display this help message and exit
--port <port>         The port to listen on (default: 4567)
--path <path>         The path to use for the LevelDB store (in-memory by default)
--ssl                 Enable SSL for the web server (default: false)
--createTableMs <ms>  Amount of time tables stay in CREATING state (default: 500)
--deleteTableMs <ms>  Amount of time tables stay in DELETING state (default: 500)
--updateTableMs <ms>  Amount of time tables stay in UPDATING state (default: 500)
--maxItemSizeKb <kb>  Maximum item size (default: 400)

Report bugs at github.com/mhart/dynalite/issues
```

## Build locally

```
$ cd docker-dynalite
$ docker build -t countingup/dynalite .
```

## Run (will pull from dockerhub)

```
# Default
$ docker run -d -p 4567:4567 countingup/dynalite

# With additional options
$ docker run -d -p 4567:4567 countingup/dynalite --maxItemSizeKb 512

# With persistent data
$ docker run -d -p 4567:4567 -v /some/host/path:/some/container/path countingup/dynalite --path /some/container/path
```
