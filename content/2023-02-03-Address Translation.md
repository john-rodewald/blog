+++
title = "Address Translation"

[taxonomies]
tags = ["programming", "ostep"]
+++
[Virtual memory](https://john-rodewald.github.io/blog/virtual-memory) touches on the topic of memory addresses. While physical memory indeed consists of addresses that correspond to precise locations, virtualised memory addresses are a matter of perspective. 

In an OS, from the perspective of each process, its address space starts at 0. The physical location of this virtual address is tracked by the OS. This illusion is transparent to the process ([Transparency](https://john-rodewald.github.io/blog/transparency)). 

Some benefits of this include:
- The OS can effortlessly rearrange memory as needed without the process noticing.
- Processes cannot touch memory locations they're not supposed to.

Address translation takes place on the part of the processor called the *memory management unit (MMU)*.
