zmodload zsh/mathfunc

declare -a A

target=13195
sqrt1=$(( [#_] int(sqrt(${target})) ))
sqrt2=$(( [#_] int(sqrt(${sqrt1})) ))

# sieve of eratosthenes
for (( i=2; i < sqrt2; ++i )); do
  if [[ -z ${A[${i}]} ]]; then
    for (( j=i*i; j < sqrt1; j=j+i )); do
      A[${j}]=true
    done
  fi
done

declare -a F
t=${target}
for i in $(seq 2 ${#A[@]}); do
  if [[ -z ${A[$i]} ]]; then
    while [[ $(( t % i )) -eq 0 ]]; do
      F[$i]=true
      (( t = t / i ))
    done
  fi
done

max=0
for i in $(seq 2 ${#F[@]}); do
  if [[ -n ${F[$i]} ]]; then
    [[ ${i} -gt ${max} ]] && max=${i}
  fi
done

echo ${max}
