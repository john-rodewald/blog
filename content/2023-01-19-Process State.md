---
title: Process State
tags: [programming]
---
Each process is in a state and can transition from its current state to a new state. This is helpful for scheduling (see [CPU Virtualisation](https://john-rodewald.github.io/blog/CPU-Virtualisation)) - a `Ready` process can be scheduled while another is `Blocked`, for example.

Common states include:
- `Running`
- `Ready`
- `Blocked`

Common state transitions include:
- `Ready` -> `Running`: Schedule
- `Running` -> `Ready`: Deschedule
- `Running` -> `Blocked`: Initiate IO
- `Blocked` -> `Ready`: Finish IO