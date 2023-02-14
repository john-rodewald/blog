---
title: Process Creation
tags: [programming]
---
To create a process from a program, the OS:
- Allocates memory and loads the program code into it from disk (lazily in modern systems)
- Allocates additional run-time memory (stack, sometimes heap)
- Sets up IO (e.g. UNIX file descriptors)