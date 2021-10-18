#! /bin/bash
#

prime_values='20000 40000 80000'
tests=5


for prime in $prime_values;  do

for(( i = 1; i <= tests; i++ ))
do
	docker run csminpp/ubuntu-sysbench sysbench --test=cpu --cpu-max-prime=$prime run
	echo Test $i in Docker done 
done
done
