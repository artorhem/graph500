set -x
set -e
export TMPFILE=graph500_debug.txt
#export TMPFILE=/mnt/disks/disk_sdb/Graphs/gen_graphs/graph500_debug.txt
#export REUSEFILE=1
export VERBOSE=1
export SKIP_BFS=1
export SKIP_VALIDATION=1
export GENERATOR_USE_PACKED_EDGE_TYPE=0

#./graph500_reference_bfs 16 16 1>out_st 2> err_st #> /mnt/disks/disk_sdb/Graphs/gen_graphs/graph_out 2>/mnt/disks/disk_sdb/Graphs/gen_graphs/graph_s15_e16_.txt
#mv graph_e16_s graph_e16_s16_

for ((scale=14; scale <=30; scale ++ )); do
	mpirun -np 4 ./graph500_reference_bfs "$scale" 16 1>out_st 2> "graph_e16_s$scale"
	if [ -f $TMPFILE ]; then
		rm $TMPFILE
	fi
	rm out_st
	#rm err_st
	sleep 5
done
