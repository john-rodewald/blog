---
title: Scheduling Strategies
tags: [programming]
---
### SJF (Shortest Job First)
When choosing a job, the one with the shortest runtime is chosen and run until it's completed. Once a job is running, it cannot be interrupted (non-preemptive scheduling) This will lead to the Convoy Effect where one large job blocks the execution of many smaller jobs in the queue. 

### STCF (Shortest Time to Complete First)
At any point, the job with the shortest time to complete is run. If a new job with a shorter time to complete is queued up, it will take priority (preemptive scheduling). This will avoid the Convoy Effect and optimises for turnaround time but has a slow response time ([Scheduling Metrics](https://john-rodewald.github.io/blog/Scheduling-Metrics)).

### RR (Round Robin)
An entirely fair strategy: a time slice is defined and each job in the queue is run for the duration of that time slice, then the next job is run, and so on. This optimises for response time but is not effective on turnaround time. 