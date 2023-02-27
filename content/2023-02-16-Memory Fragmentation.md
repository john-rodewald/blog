+++
title = "Memory Fragmentation"

[taxonomies]
tags = ["literature", "programming", "ostep"]
+++
Segmented memory suffers from two types of fragmentation:

## Internal fragmentation
When a process has memory allocated to it that is unusued, the process memory is internally fragmented.

## External fragmentation
When multiple processes have memory segments allocated to them, there will be small gaps between segments that are not very useful. Eventually, there might be no more large, contiguous blocks of memory available. This is external fragmentation.

### Compaction
By rearranging segments, we can 'eliminate' external fragmentation by filling those small gaps. However:
- This operation is computationally expensive
- Existing segments will have a lot of trouble growing unless more expensive rearrangements are made

### Free list
Instead of compaction, there are *free-list management algorithms* that try to keep large blocks of memory available for new allocations. There are many such algorithms and techniques and no one solution is optimal for every use case.