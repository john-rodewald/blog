+++
title = "CPU Virtualisation"
tags = ["programming", "ostep"]
+++
We *usually* only have one CPU in a system. But we want to run many processes at once. One technique we can use to accomplish this is time sharing. 

The CPU runs one process for a certain amount of time, then pauses it, then unpauses the next process, runs it for some time, and so on. The OS decides the schedule of when and how long to run each process for. Processes are unaware of this.