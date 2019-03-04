# Apache Kafka

Kafka is a central nervous system that handles trillions of messages and petabytes of data every day, all in real-time.

## Components:

### ZooKeeper:
ZooKeeper is a centralized service for managing distributed processes and is a mandatory component in every Apache Kafka cluster.

### Kafka Brokers:
Kafka brokers are the main storage and messaging components of Apache Kafka. The Kafka cluster maintains streams of messages called topics; the topics are sharded into partitions (ordered, immutable logs of messages) and the partitions are replicated and distributed for high availability. You will usually want at least 3 Kafka brokers in a cluster, each running on a separate server. This way you can replicate each Kafka partition at least 3 times and have a cluster that will survive a failure of 2 nodes without data loss.


### Kafka Connect:
Kafka Connect is a component of Apache Kafka that allows it to integrate with external systems to pull data from source system and push data to sink systems. It works as a pluggable interface, so you plug in Connectors for the systems you want to integrate with. For example, you deploy Kafka Connect with JDBC and Elasticsearch Connectors to copy data from MySQL to Kafka and from Kafka to Elasticsearch. Kafka Connect can be deployed in one of two modes: Standalone and Clustered


### Kafka Clients:
Apache Kafka clients are used in the applications that produce and consume events.

### Kafka Streams API:
Kafka Streams, a component of open source Apache Kafka, is a powerful, easy-to- use library for building highly scalable, fault-tolerant, stateful distributed stream processing applications on top of Apache Kafka. Kafka Streams will use parallel-running tasks for the different partitions and processing stages in the application, and as such will benefit from higher core count. If you deploy multiple instances of the application on multiple servers (recommended!), Kafka Streams library will handle load-balancing and failover automatically. In order to maintain its application state, Kafka Streams uses embedded RocksDB database.


### Confluent Rest Proxy:
The Confluent REST Proxy is an open source HTTP server that provides a RESTful interface to a Kafka cluster. It makes it easy to produce and consume messages, view the state of the cluster, and perform administrative actions without using the native Kafka protocol or clients.


### Confluent KSQL Server
Confluent KSQL is a an open source streaming SQL engine that implements continuous queries against Apache Kafka. It allows you to query, read, write, and process data in Apache Kafka in real-time, at scale using SQL-like semantics. The

### Confluent Schema Registry:
Confluent Schema Registry is an open source serving layer for your metadata. It provides a RESTful interface for storing and retrieving Avro schemas. It stores a versioned history of all schemas, provides multiple compatibility settings, and allows evolution of schemas according to the configured compatibility setting. The Schema Registry uses a leader-followers architecture. Only the leader is capable of publishing writes to the underlying Kafka log, but all nodes are capable of directly serving read requests. Follower nodes forward write requests them to the current leader.

## Pricing: Ex: Confluent
1. Throughput
2. Retention Period

## Targeted Design Outcomes:
1. High Throughput
2. Low latency
3. Automatic Failover
4. Automatic Load Balancing
