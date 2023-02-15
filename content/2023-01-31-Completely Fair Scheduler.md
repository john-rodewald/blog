+++
title = "Completely Fair Scheduler"

[taxonomies]
tags = ["programming", "ostep"]
+++
One of the schedulers in the Linux kernel is CFS. It implements a variant of fair-share [Ticket Scheduling](https://john-rodewald.github.io/blog/ticket-scheduling). The goal of CFS is perfect fairness or perfect multitasking: two running processes should receive 50% of CPU time exactly.

CFS keeps track of how much CPU time each process has received (`vruntime`). When deciding which process to run next, processes with the lowest values for `vruntime` are preferred. `vruntime` scales with real time.

Some [Scheduling Strategies](https://john-rodewald.github.io/blog/Scheduling-Strategies) are queue-based. CFS keeps track of running (*and only running!*) processes in a [red-black tree](https://john-rodewald.github.io/blog/red-black-tree). this ensures scheduling decisions in `o(lg n)` time.

Time slices are not present in CFS. When multiple processes are running, it divides CPU time between them equally - though the runtime per process cannot be less than `min_granularity`. 

To establish process priorities, each process can be given a `nice` level. CFS then maps this `nice` level to a `weight`. The `vruntime` of a process scales inversely with its `weight`. In other words, a process with `nice = -20` will receive more CPU time than one with `nice = 10`. 

The reason the `weight` mapping exists is so that proportionality is preserved: 
`nice`$_A$ `= 5` and `nice`$_B$ `= 0`  share CPU time in the same way as `nice`$_A$ `= 10` and `nice`$_B$ `= 15`

Imagine two processes A and B. A is running and racking up `vruntime` while B is performing I/O. Once B gets scheduled, won't its `vruntime` be so low it will monopolise the CPU? No: CFS avoids starvation by modifying the `vruntime` of a process when it's scheduled. B's `vruntime` is set to the lowest `vruntime` of all running processes. Unfortunately, this punishes processes that perform I/O frequently. 