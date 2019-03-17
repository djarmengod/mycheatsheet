# Demo the image layers

## Docker file content
```
dd
~/Downloads/Test ⌚ 10:09:31
$ cat Dockerfile
FROM busybox
RUN echo 'layer1' > /tmp/layer1.txt
RUN echo 'layer2' >> /tmp/layer2.txt
```


## Build the image
```
~/Downloads/Test ⌚ 10:10:24
$ docker build -t layertest:v1 .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM busybox
latest: Pulling from library/busybox
697743189b6d: Pull complete
Digest: sha256:061ca9704a714ee3e8b80523ec720c64f6209ad3f97c0ff7cb9ec7d19f15149f
Status: Downloaded newer image for busybox:latest
 ---> d8233ab899d4
Step 2/3 : RUN echo 'layer1' > /tmp/layer1.txt
 ---> Running in 326c54743362
Removing intermediate container 326c54743362
 ---> 3f31fbd2a8ee
Step 3/3 : RUN echo 'layer2' >> /tmp/layer2.txt
 ---> Running in b383180ff8b0
Removing intermediate container b383180ff8b0
 ---> fa3df7cc77d9
Successfully built fa3df7cc77d9
Successfully tagged layertest:v1
```

## Test the Image layers
```
~/Downloads/Test ⌚ 10:10:54
$ docker run --rm 3f31fbd2a8ee cat /tmp/layer1.txt
layer1

~/Downloads/Test ⌚ 10:11:53
$ docker run --rm 3f31fbd2a8ee cat /tmp/layer2.txt
cat: can't open '/tmp/layer2.txt': No such file or directory

~/Downloads/Test ⌚ 10:12:16
$ docker run --rm fa3df7cc77d9 cat /tmp/layer1.txt
layer1

~/Downloads/Test ⌚ 10:12:37
$ docker run --rm fa3df7cc77d9 cat /tmp/layer2.txt
layer2
```
