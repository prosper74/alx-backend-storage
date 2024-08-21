# Redis basic

### Introduction to Redis
Redis (Remote Dictionary Server) is an open-source, in-memory data structure store, which can be used as a database, cache, and message broker. It supports various data structures such as strings, lists, sets, hashes, and more. Redis is known for its high performance, flexibility, and simplicity, making it widely used in various applications for caching, session management, real-time analytics, and more.

### Key Concepts
In-Memory Storage: Redis stores data in memory, which allows for very fast read and write operations. However, it can persist data to disk, ensuring that data is not lost in the event of a server failure.

Data Structures: Redis supports a variety of data structures:

Strings: Simple key-value pairs.
Lists: Ordered collections of strings.
Sets: Unordered collections of unique strings.
Hashes: Collections of key-value pairs (like a dictionary).
Sorted Sets: Sets with a score associated with each member.
Bitmaps, HyperLogLogs, Streams, etc.
Persistence: Redis can be configured to save data to disk periodically (snapshotting) or append every write operation to a log file (AOF - Append Only File).

Replication: Redis supports master-slave replication, where data from the master is copied to one or more slave instances.

Pub/Sub: Redis can act as a message broker with its publish/subscribe messaging paradigm.
