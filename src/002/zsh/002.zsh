declare -a f

function fib {
  readonly n=${1:?"missing"}
  f[1]=1
  f[2]=1

  if [[ ${n} -gt 2 ]]; then
    for i in {3..$n}; do
      f[${i}]=$(( ${f[(($i-1))]} + ${f[(($i-2))]} ))
    done
  fi

  echo ${f[${n}]}
}

c=1; sum=0;
while true; do
  r=$(fib ${c});
  if [[ $((${r} % 2)) -eq 0 ]]; then
    ((sum = sum + r))
  fi
  [[ ${r} -lt 4000000 ]] || break
  ((c++))
done

echo ${sum}
