TARGET=999

def sumDiv(n)
  p = TARGET / n
  n * (p * (p + 1)) / 2
end

puts sumDiv(3) + sumDiv(5) - sumDiv(15)
