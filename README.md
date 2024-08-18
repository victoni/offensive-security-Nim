# Notes for Nim and offensive security Nim

Nim for offensive security.

## Dockerfile for Windows compilation environment

```
# Use the nimlang/nim image as the base image
FROM nimlang/nim

# Update the package lists and install mingw-w64
RUN apt-get update && apt-get install -y mingw-w64

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Define the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
#COPY . .

# Install winim package
RUN nimble install winim

# Define the command to run the Nim compiler by default
CMD ["nim", "--version"]

```

then

`docker build -t nim-mingw .`

### Compile for Linux:

`docker run --rm -v /dir/path/to/program:/usr/src/app -w /usr/src/app nimlang/nim nim c -r program.nim`

or

`docker run --rm -v /dir/path/to/program:/usr/src/app -w /usr/src/app nim-mingw:latest nim c -r program.nim`

**Hint: if you want extra stealth-ness, compile with `--app:gui`**

### Compile for Windows:
`docker run --rm -v /dir/path/to/program:/usr/src/app -w /usr/src/app nim-mingw:latest nim c -d:mingw program.nim`

## Documentation

- [Docs and tutorial](https://nim-lang.org/docs/tut1.html)

To cross-compile for Windows from Linux or macOS using the MinGW-w64 toolchain:

```bash
nim c -d:mingw myproject.nim
# nim r also works, running the binary via `wine` or `wine64`:
nim r -d:mingw --eval:'import os; echo "a" / "b"'
```
Use `--cpu:i386` or `--cpu:amd64` to switch the CPU architecture.

The MinGW-w64 toolchain can be installed as follows:

```bash
apt install mingw-w64   # Ubuntu
yum install mingw32-gcc
yum install mingw64-gcc # CentOS - requires EPEL
brew install mingw-w64  # OSX
```

## Pracical learning

- [Nim by example](https://nim-by-example.github.io/)
- [Learn X in Y minutes - Nim](https://learnxinyminutes.com/docs/nim/)

## Docker

- [Nim official docker registry](https://hub.docker.com/r/nimlang/nim/)


## Offensive security

- [Offensive Nim](https://github.com/byt3bl33d3r/OffensiveNim)
- [Simple C2 implant in Nim](https://posts.specterops.io/deep-sea-phishing-pt-1-092a0637e2fd)
