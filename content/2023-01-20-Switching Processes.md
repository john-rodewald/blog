+++
title = "Switching Processes"
tags = ["programming", "ostep"]
+++
A CPU can only execute one program at a time. Once a program is running on the CPU, the OS is effectively not running. So how can it take back control over the system?

### Cooperative approach
In this model, the OS trusts processes to periodically give back control to the OS. Also, every time a process makes system calls or performs illegal actions, the OS regains control. But if a process ever gets stuck (with malicious intent or not), the only way to free the system is to reboot it.

### Interrupt on a timer
Instead of trusting programs to behave reasonably, we can enforce periodical OS control by sending interrupts on a timer. An interrupt handler runs at certain intervals at all times to give the OS a chance to make scheduling decisions. The timer is started at boot time.