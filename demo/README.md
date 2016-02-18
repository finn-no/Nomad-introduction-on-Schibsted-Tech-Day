# nomad-intro

Just a short demo for Schibsted leaning heavily on the demo shown in the SysAdvent article
["Introduction to Nomad"](http://sysadvent.blogspot.com/2015/12/day-12-introduction-to-nomad.html)

Run list for demo:

* Explain setup
  * vagrant status
  * 1 nomad server, 1 consul server, 3 docker with nomad and consul agents
* Show microbot.nomad
  * A job defines a logical application
  * service is the default type, no need to define
  * definition of rolling updates
  * group -> tasks that must run on the same machine, like Kubernetes pods, useful for proxies, exporting statistics, etc.
  * number of groups to run at the same time -> scaling
  * service -> registered with consul to get service discovery, also sets up health checks
  * resources -> what resources do this task need?

* Nomad is client/server -> same binary
* node-status -> all nodes in cluster
* Scale up/down -> change to 20
* Upgrade -> takes some time, 5 at a time, 10 seconds between each round, health checks in between

* Show simplecounter.nomad
  * 2 groups, 1 web and 2 database
  * Uses service discovery; db is registered under postgres in consul -> docker is setup to use consul as a DNS -> can use postgres.service.consul
  * Go to web page and show counter; refresh

* Show batchdecreaser.nomad
  * a batch job which runs periodically
  * runs a command directly

* Show cadvisor.nomad
  * runs cAdvisor which is a monitor tool
