# General Notes

## coalesce
The coalesce method reduces the number of partitions in a DataFrame. ex: consolidate the data in two partitions
```
val sampleDataFrame = sourceDf.coalesce(2)
sampleDataFrame.rdd.partitions.size // => 2
```

## repartition
The repartition method can be used to either increase or decrease the number of partitions in a DataFrame. 
```
val sampleDataFrame = sourceDf.repartition(8)
sampleDataFrame.rdd.partitions.size // => 8
```
