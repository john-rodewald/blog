+++
title = "Context Switching"

[taxonomies]
tags = ["programming", "ostep"]
+++
A context switch occurs when execution of one process is paused so that another process can run instead while preserving all of the necessary context of the process that was paused.

If process A is running and the OS decides to run process B - e.g. by encountering a *trap* ([Switching Processes](https://john-rodewald.github.io/blog/Switching-Processes)):
- Program execution is paused
- Context of the currently-executing process is saved
- If they exist, register values from the to-be-run process are restored
- Program execution is resumed (*return-from-trap* instruction)

Context values include:
- Register values
- Program counter
- Kernel stack pointer