# Other stuff

* multi-datacenter and multi-region aware
* run jobs as jars, docker, rkt, qemu, fork/exec
* schedulers include service, batch and system
* supports rolling updates

Note:

Nomads model supports defining jobs that are multi-datacenter and multi-region aware.

It can run Java jars directly, Docker of course, has support for Rocket and you can run queue - emju VMs directly. Or you can run executables directly, isolated through cgroups or with no isolation.

The jobs can run as a service, long running, like a webapp. Or as a batch job, shorter running and can be run periodically. System means you typically want one instance running on each machine. This can be used for jobs like log collecting and monitoring.
