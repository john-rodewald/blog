+++
title = "Multi-Level Feedback Queues"

[taxonomies]
tags = ["programming"]
+++
In a system with this type of scheduler, each process is in one of many queues. Queues have different priorities and a job in a higher-priority queue will always run before a job in a lower-priority queue. 

A new job is always inserted into the top-priority queue. 

To avoid *starvation* of lower-priority queues, every queue is *boosted* at a certain time interval. This also avoids gaming the scheduler. 

Jobs of the same priority alternate running in a Round Robin manner.

In each queue, there exists a time allotment. If a job runs for longer than this allotment (regardless of how many times it gives up the CPU), it will be dropped to a lower priority. Otherwise it keeps its priority
