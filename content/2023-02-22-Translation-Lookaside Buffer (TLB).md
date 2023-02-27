+++
title = "Translation-Lookaside Buffer (TLB)"

[taxonomies]
tags = ["programming", "ostep"]
+++
In the context of [Virtual memory]] and-[[Paging]],-we-realise-that-address-translation-via-a-[[Page-Table](https://john-rodewald.github.io/blog/virtual memory]] and-[[paging]],-we-realise-that-address-translation-via-a-[[page-table) can quickly become expensive in terms of computational overhead. Accessing the page table each time an instruction has to be fetched costs a lot of time. A *translation-lookaside buffer* (TLB) tries to mitigate this.

The TLB is a fast, hardware-supported cache. We want to hit this cache instead of accessing the page table of a process as much as possible. The cached addresses follow the principle of [Cache-Locality](https://john-rodewald.github.io/blog/cache-locality).

### Misses
A TLB miss means we must consult the page table one way or another. On CISC architectures (*complex instruction set computers*) like Intel x86, this is entirely handled by hardware. More modern RISC architectures (*reduced instruction set computers*) leave handling cache misses to the OS. 

In either case, a page table lookup must be made and the TLB will be updated. Then, when the instruction is retried, it will hit the cache.

### OS handling
There are some extra considerations in the case of OS-handled TLB misses:

- After a miss, a trap handler will be called. But contrary to handling system call traps, we want to resume process execution *before* the instruction that caused an exception, not after.
- Because we're retrying the current instruction after a cache miss, we need to be very careful not to land in an infinite loop of TLB misses. One technique is to reserve some permanently-valid TLB entries for the trap handler code itself.