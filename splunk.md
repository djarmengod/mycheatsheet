## General

List all the Index names in your Splunk Instance
```
| eventcount summarize=false index=* index=_* | dedup index | fields index
| rest /services/data/indexes | dedup title | table title
```

List all hosts that are logging to a particular index. In this example ,we use apachelog as the index.
```
index=weblogs | table host | dedup host
```

List all hosts that log to an index with eventcount per host.
```
index=weblog | stats count by host
```

Top 10 entries or bottom 10 entries
```
index=weblog | head 10
index=weblog | tail 10
```

Reverse
```
index=weblog | reverse
```

Search
```
index=weblog OR index=applog | search 404
```

Search a pattern and sort by count. This query will sort the results based on the output field “count”.
```
index=weblog OR index=applog | stats count by host | sort - count | head 15
```
