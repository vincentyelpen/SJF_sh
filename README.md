# Implementation Explanation
1. This script implements a simulation of an enhanced version of the Shortest Job First (SJF) scheduling algorithm, including waiting time calculation and process switching overhead. Here are the main steps of the script:
2. Definition of a function calculate_waiting_time to compute waiting times.
3. Reading process information from command-line arguments and sorting processes based on execution time.
4. Using the calculate_waiting_time function to compute process waiting times.
5. Computing process switching overhead.
6. Calculating the total waiting time, including each process's waiting time and process switching overhead.
7. Outputting the execution order of processes, total waiting time, and average waiting time.
8. In this implementation, the script first sorts processes based on execution time, calculates waiting time for each process, computes process switching overhead, and finally aggregates waiting times and overhead to obtain total waiting time. Finally, the script outputs the execution order of processes along with total and average waiting times.

## For Run
```bash
./sjf.sh "P1:7" "P2:6" "P3:9"
```
Where "P1:7" "P2:6" "P3:9" are the identifiers and execution times for each process.

## Input and Output Examples

1. input
```bash
./sjf.sh "P1:7" "P2:6" "P3:9"
```

2. output
```bash
Execution order of processes：
P2
P1
P3
Total waiting time (including process switch overhead, assumed 2)：23
Average waiting time (including process switch overhead, assumed 2)：7

```
