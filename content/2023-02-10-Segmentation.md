---
title: Segmentation
tags: [programming]
---
[[Dynamic Relocation]] introduced a simplified model of memory and address translation. One of the problems with it is that there is a lot of empty, allocated memory between the base and bounds addresses of each process. We call this a *sparse address space*. Segmentation is a simple way to allocate memory more efficiently.

We no longer allocate the entire address space of a process. Instead, we split the space into three *variable-sized segments*: code, stack, and heap. Each segment: 
- gets its own set of base and bounds registers 
- has a small starting size and can grow as needed
- can sit anywhere in memory
Thus, we no longer need a continous block of sparse memory for the entire process.

From the perspective of the process, segmentation has no effect. It still thinks it owns its entire address space as a continuous block. 

There is an implication for address translation: to map from a virtual address to a physical address, we need to know *which segment we're in*. We also need to deduct the segment's *offset* from the virtual address. Thus, virtual addresses encode a segment (2 bits) and an offset into that segment.

```
Segment            Offset
|------|----------------------------------------|
 [0][1] [2][3][4][5][6][7][8][9][10][11][12][13]
```