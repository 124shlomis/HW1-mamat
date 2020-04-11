#!/bin/bash

# script to check log files:
for i in {1..6};do
	diff ./logs/$i.compile.log ./logFiles/$i.compile.log
	diff ./logs/$i.inout.log ./logFiles/$i.inout.log
	diff ./logs/$i.memory.log ./logFiles/$i.memory.log
done
