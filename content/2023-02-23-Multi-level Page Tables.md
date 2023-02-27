+++
title = "Multi-level Page Tables"

[taxonomies]
tags = ["programming", "ostep"]
+++
A [Page-Table](https://john-rodewald.github.io/blog/page-table) is a concept that can be represented by many different data structures. The simplest representation is a linear page table: an array of physical page numbers (plus other metadata) indexed by virtual page numbers. This data structure is not space-efficient as we have to store this exhaustive mapping for each process. With a 4KB page size and hundreds of processes, we would need hundreds of megabytes of memory.

A *multi-level page table* is a tree-like data structure:
- Each node is the size of one page
- Each node contains an array of page table entries
- A non-leaf node is called a *page directory* that points to pages further down the tree 
	- Each directory entry is either valid or not
- The leaf node we arrive to contains the final `VPN -> PFN` mapping we're interested in

Two main benefits arise from using this data structure:
- We only use memory for valid page directory entries. A valid directory entry points to a set of page table entries where at least one entry is valid (i.e. allocated)
- Page-sized nodes make this data structure easy to grow and manage for the OS. We no longer need contiguous memory like with a linear page table

We pay a price in increased implementation complexity and in having to make multiple memory accesses as we work our way down the tree. More generally, we trade off some speed to save a lot of space.