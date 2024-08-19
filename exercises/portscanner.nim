# ./portscanner [IP] [ports]

#need to add multithreading

import std/net
import std/os
import std/cmdline
import std/strutils

# IP
let ip = paramStr(1)

# Scan a single port
proc scanPort(port: int) =
    let socket = newSocket()
    try:
        socket.connect(ip, Port(port)) # returns void
        echo "Port ", port, " is open"
    except OSError as e:
        discard e.msg


# For all ports given
for port_str in commandLineParams()[1..^1]:
    let port = parseInt(port_str)
    scanPort(port)