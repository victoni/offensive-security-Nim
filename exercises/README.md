## 1. Build a Simple Port Scanner

Objective: Write a basic TCP port scanner in Nim. This exercise will help you get familiar with Nim's syntax, networking libraries, and concurrency features.
Steps:
- Implement a function to check if a port is open on a given IP address.
- Use Nim's async or threads to scan multiple ports concurrently.
- Extend the scanner to take command-line arguments for target IP and port range.
Learning Outcomes: Learn about Nim's networking capabilities, error handling, and concurrency.

#### Status: COMPLETED

## 2. Create a Command and Control (C2) Server and Client

Objective: Develop a basic C2 server-client model where the server can send commands to the client, and the client can execute those commands and return the output.
Steps:
- Write a server that listens for incoming connections and sends commands.
- Write a client that connects to the server, executes the received commands, and sends the results back.
- Add basic encryption (e.g., using Nim's openssl module) to secure the communication.
Learning Outcomes: Gain experience with sockets, process execution, and basic encryption in Nim.

#### Status: COMPLETED

## 3. Develop a File Downloader with URL Obfuscation

Objective: Write a Nim program that downloads a file from a remote server, with the URL obfuscated to bypass simple detection mechanisms.
Steps:
- Implement a basic HTTP GET request to download a file.
- Create a function that obfuscates the URL (e.g., base64 encoding, URL encoding).
- Extend the downloader to decode the obfuscated URL before downloading.
Learning Outcomes: Practice using Nim's httpclient module and learn about string manipulation and obfuscation techniques.

#### Status: COMPLETED

## 4. Implement a Basic Reverse Shell

Objective: Write a reverse shell in Nim that connects back to an attacker-controlled machine.
Steps:
- Create a client that spawns a shell and redirects input/output to a TCP connection.
- Handle multiple connections on the server side using Nim's async or multithreading.
- Add a basic persistence mechanism (e.g., autorun on system startup).
Learning Outcomes: Understand process management, TCP socket programming, and basic persistence techniques in Nim.

#### Status: UNFINISHED
