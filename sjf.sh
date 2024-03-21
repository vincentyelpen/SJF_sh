calculate_waiting_time() {
    local arrivals=("$@")
    local waiting_time=0
    local current_time=0
    for arrival in "${arrivals[@]}"; do
        if [ $current_time -lt $arrival ]; then
            current_time=$arrival
        fi
        waiting_time=$((waiting_time + current_time - arrival))
        current_time=$((current_time + 1))
    done

    echo $waiting_time
}
processes=() 
execution_times=() 
while [ "$#" -gt 0 ]; do
    processes+=("${1%%:*}")
    execution_times+=("${1##*:}")
    shift  
done

IFS=$'\n' sorted_processes=($(paste -d: <(printf "%s\n" "${processes[@]}") <(printf "%s\n" "${execution_times[@]}") | sort -t: -nk2 | cut -d: -f1))
IFS=$'\n' sorted_execution_times=($(printf "%s\n" "${execution_times[@]}" | sort -n))
waiting_time=$(calculate_waiting_time "${sorted_execution_times[@]}")
switching_overhead=2 
total_waiting_time=0
previous_execution_time=0
for execution_time in "${sorted_execution_times[@]}"; do
    total_waiting_time=$((total_waiting_time + previous_execution_time))
    previous_execution_time=$((previous_execution_time + execution_time))
done
total_waiting_time=$((total_waiting_time + waiting_time + switching_overhead * (${#sorted_processes[@]} - 1)))
echo "Execution order of processes：
${sorted_processes[*]}"
echo "Total waiting time (including process switch overhead, assumed 2)：$total_waiting_time"
echo "Average waiting time (including process switch overhead, assumed 2)：$(($total_waiting_time / ${#sorted_processes[@]}))"
