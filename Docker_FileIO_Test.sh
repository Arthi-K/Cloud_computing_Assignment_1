#! /bin/bash
#
file_mode='rndwr rndrw seqwr'
tests=5


for mode in $file_mode;  do

for(( i = 1; i <= tests; i++ ))
do
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode prepare
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode run 
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode cleanup
	echo Test $i finished in Docker 
sync && sudo purge
done
done
