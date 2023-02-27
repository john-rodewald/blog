+++
title = "Page Table"

[taxonomies]
tags = ["programming", "ostep"]
+++
The page table maps virtual page numbers to physical page numbers per process. Any data structure could be used for this. The simplest choice is a *linear page table*: an array with virtual page numbers as indices. While simple, it is also space-inefficient ([Multi-level-Page-Tables](https://john-rodewald.github.io/blog/multi-level-page-tables)). 

Besides the physical page number that maps to the virtual page number, additional bits are stored in each entry:

|Name|Description|
|-|-|
|Valid bit|Is this page currently allocated or unused?|
|Protection bits|Can this be read from, written to, or both?|
|Present bit|Is this page swapped out to disk?|
|Dirty bit|Has this page been modified since its allocation?|
|Reference bit|Has this page been accessed since its allocation?|
|Mode bit|Can this page be accessed by user-mode processes?|

The valid bit in particular helps reduce memory usage: physical page numbers are huge, so we only want to map them to virtual page numbers when memory is actually allocated.