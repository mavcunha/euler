local target = 999

function sumDiv(n)
  local p = math.floor(target / n)
  return n * (p * (p + 1)) / 2
end

print(sumDiv(3) + sumDiv(5) - sumDiv(15))
