g++ random_graph_generator.cpp -o _generate
./_generate testcases/csr_graph.in

printf "*************************************************************************\n\n"

g++ serial.cpp -o _serial
printf "Running Serial Version of Code\n"
./_serial testcases/csr_graph.in testcases/csr_graph.out
printf "*************************************************************************\n\n"

nvcc parallel-vertex.cu -o _parallel_vertex
printf "Using Parallel Vertex Method\n"
./_parallel_vertex testcases/csr_graph.in testcases/csr_graph.out
printf "*************************************************************************\n\n"

nvcc parallel-edge.cu -o _parallel_edge
printf "Using Parallel Edge Method\n"
./_parallel_edge testcases/csr_graph.in testcases/csr_graph.out
printf "*************************************************************************\n\n"

nvcc parallel-work.cpp -o _parallel_work
printf "Using Work efficient method (fine-grained parallelism)\n"
./_parallel_work testcases/csr_graph.in testcases/csr_graph.out
printf "*************************************************************************\n\n"

nvcc parallel-work-coarse.cu -o _parallel_work_coarse
printf "Using Work distributed method with coarse-grained parallelism\n"
./_parallel_work_coarse testcases/csr_graph.in testcases/csr_graph.out
printf "*************************************************************************\n\n"