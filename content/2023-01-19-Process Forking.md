---
title: Process Forking
tags: [programming]
---
In C, `fork()` is a system call that, when called by a parent process, will immediately create a new and nearly identical child process. It has a copy of its parent's address space, registers, program counter, etc. The child process will immediately continue execution in parallel to the parent, as though it had itself called `fork()`. Without special logic in place, due to [[CPU Virtualisation]] and scheduling, the program effectively becomes non-deterministic after calling `fork()`. We don't know for sure whether the parent or child will finish executing first.

To write deterministic code, the return value of `fork()` must be taken into account. The parent receives the child's process ID (PID) as a return value. The child receives `0` as a return value.

Together with the `waitpid()` system call (waits for a certain PID to finish before continuing), we can ensure the two processes finish in a certain order.

### `exec`
After calling `exec()`, the current process is essentially replaced with a new program. Memory is reinitialised and the code loaded into memory is replaced by the new program.