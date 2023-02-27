+++
title = "Cache Locality"

[taxonomies]
tags = ["programming", "ostep", "literature"]
+++
There are two types of locality to be aware of in the context of caching:

### Temporal locality
Any piece of data that has recently been accessed will likely be accessed again in the near future.

### Spatial locality
Given a piece of data that has been accessed, it's likely that surrounding pieces of data will be accessed in the near future.

+++
Both types of locality are especially relevant in the context of [Virtual-memory](https://john-rodewald.github.io/blog/virtual-memory). 

Memory pages ([Paging](https://john-rodewald.github.io/blog/paging)) are likely to take advantage of temporal locality. 

Contiguous memory is generally desirable because it allows us to take advantage of spatial locality (any time arrays are used, for instance).