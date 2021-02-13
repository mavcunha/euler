zmodload zsh/mathfunc

function is_prime {
  local n=${1?"missing"}
  local c=2
  while [[ $(( int(n / 2) )) -ge ${c} ]]; do
    [[ $(( n % c )) -eq 0 ]] && echo "false" && return
    ((c++))
  done
  echo "true"
}

target=600851475143

for ((i=int(sqrt(target)/2); i > 0; i--)); do
  if [[ $(( target % i )) -eq 0 && \
    $(is_prime ${i}) == "true" ]]; then
    echo ${i}
    break
  fi
done
