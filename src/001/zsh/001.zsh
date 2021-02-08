readonly target=999

function sumDiv {
  readonly n=${1:?"Missing argument"}
  ((p = target / n))
  echo $((n * (p * (p + 1) ) / 2))
}

echo $(( $(sumDiv 3) + $(sumDiv 5) - $(sumDiv 15) ))
