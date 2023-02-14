+++
title = "Virtual memory"

[taxonomies]
tags = ["programming", "ostep"]
+++
Computers generally only have a single unit of physical memory with a number of physical *memory addresses*. In the early days, only one process could run at a time and it could use up the entire physical memory. With the rise of multiprocessing, there are a few good reasons we no longer want all processes to share the same set of memory addresses. An obvious one: Process A should not be able to alter process B's memory. 

That's why the modern OS virtualises memory: Each process is only aware of the memory allocated to it by the OS, and the addresses it sees are not real:

From the perspective of a running process A, its memory addresses start at 0 and it can use the entirety of the memory available to it. In reality, the chunk of physical memory that is reserved for process A may be anywhere in the physical address space - only the OS knows. We call A's address space a *virtual address space*.

We have a few goals in mind when virtualising memory:
- Protection: A process should only be able to alter its own context/memory
  (as mentioned above).
- Transparency: A process should not be aware of the fact that its allocated physical memory is actually virtualised.
- Efficiency: Virtualisation should not have too large of a time and space cost. 
   A most difficult goal - the OS receives hardware-level aid for this.

A final, easy-to-remember takeaway: *Every address printed by the OS is virtual*.
Whether it's printing out a pointer in C or an address in an error message.