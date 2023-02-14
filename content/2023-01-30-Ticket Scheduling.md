---
title: Ticket Scheduling
tags: [programming]
---
A non-deterministic method of splitting up CPU time proportionally rather than based on time. Each process has a number of tickets (based on priority) and a 'winning' number is drawn at set intervals to determine the next process to run. 

This random approach is:
- Simple to implement
- Performant due to its simplicity
- Good at handling edge cases

Processes can own tickets in their own ' currency'. The scheduler will convert as needed. They can also transfer their own tickets to other processes. 

In systems where processes trust each other, a process can also boost its number of tickets temporarily (' ticket inflation'). 