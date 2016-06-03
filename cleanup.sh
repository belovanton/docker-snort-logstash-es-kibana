#!/bin/bash

for i in $(curl -s '10.100.210.151:9200/_cat/indices?v' | grep log | cut -d'-' -f2 | cut -d' ' -f1 | sort -r | tail -n+0)
do 
   echo $i
   curl -XDELETE "10.100.210.151:9200/logstash-$i?pretty" 
done
