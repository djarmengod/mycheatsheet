# Installating Elasticsearch 5.5.1

1. Includes fix to the ES boot bug

Docker Build
```
docker build .
```

Docker Tag - Applying a latest tag
```
docker tag ac70c6095ba9 quay.io/kiran01bm/elasticsearch
```

Docker Push
```
docker push quay.io/kiran01bm/elasticsearch
```
