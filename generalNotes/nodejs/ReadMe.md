## General Notes

### Heap Dump without killing the node process
1. `require('heapdump')` in the current worker
2. Heapdump gets written into the current working directory of the node process
3. Ways to trigger a heapdump:
3a. `kill -SIGUSR2 PID` to initiate a heapdump
3b `heapdump.writeSnapshot()` in the JS

#### Worker Master Stuff
```
if (worker.isMaster) { /* master stuff */ } else { require('heapdump') }
```
