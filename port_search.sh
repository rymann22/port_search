#!/bin/bash

awk '{print $2}' /etc/services | grep "/">>services_list.txt
## CHANGE PORT LIST
input_list=$(cat port_list.txt)                                                         

#$services_list>>temp_list.txt

#create temp file
for i in $input_list; do
  grep "\b$i\b" services_list.txt>>temp_list.txt
done

#search services

for x in `cat temp_list.txt`; do  
  grep "\b$x\b" /etc/services
done

#cleanup
rm -rf services_list.txt temp_list.t
