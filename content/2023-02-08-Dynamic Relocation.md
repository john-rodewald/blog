+++
title = "Dynamic Relocation"

[taxonomies]
tags = ["programming", "ostep"]
+++
The MMU ([Address Translation](https://john-rodewald.github.io/blog/Address-Translation)) also helps in ensuring that addresses generated by a process are *legal*. What does this mean?

A process has a block of physical memory allocated to it. This block of memory has a start address and an end address. Both of these addresses are stored on the MMU's *base and bound registers*. They are part of the context of each process ([Context Switching](https://john-rodewald.github.io/blog/Context-Switching)).

When context switching to a process that has already been initialised, the bounds of the descheduled process are stored to memory while the bounds of the scheduled process are restored from memory into the MMU. 

When translating addresses, each virtual process address is added to the *base* register value: `process_addresses[0] == base` and `process_addresses[10] == base + 10`

The MMU provides special instructions to the OS to allow it to modify the *base and bounds registers* in kernel/privileged mode only ([Processor Modes](https://john-rodewald.github.io/blog/Processor-Modes)).

The OS also needs to set up handlers for when processses try to access memory they are not allowed to.