+++
title = "Processor Modes"
tags = ["programming", "ostep"]
+++
Process code runs directly on the CPU. But the OS needs to retain control over processes to implement time sharing ([CPU Virtualisation](https://john-rodewald.github.io/blog/CPU-Virtualisation)) and to make sure a process doesn't do anything we don't want it to do (like performing arbitrary IO actions).

This can be solved by introducing two distinct modes: *user mode* and *kernel mode*. In user mode, a process cannot perform IO or other privileged actions. Such actions are possible only in kernel mode. A user mode process can request certain procedures to be executed in kernel mode via *system calls* supplied by the OS. The process never exits user mode - this would be dangerous. ^87e725

When performing a system call (e.g. opening a file), a special *trap* instruction is executed that hands off control to the OS until a *return from trap* instruction is encountered.[1] What exactly the OS does when handling a trap instruction is specified in a *trap table* at boot time.

[1]: This varies by architecture. The example illustrates behaviour on x86 systems. The concept stays similar.