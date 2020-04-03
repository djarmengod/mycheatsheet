## Heap Sizing - OpenJ9 and JVM Running in a Containerised Environment

-XX:+UseContainerSupport -XX:InitialRAMPercentage=50 -XX:MaxRAMPercentage=90

```
-XX:+UseContainerSupport is enabled by default but dont trust defaults so explicitly set them.
This also reads the cgroup limits for the container in which the JVM is running.
```
