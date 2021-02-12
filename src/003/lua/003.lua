local n = 600851475143
local f = math.floor(math.sqrt(n))
local A = {}

-- sieve - the table is fliped so we
-- do not need to initialize it
for i=2, math.floor(math.sqrt(f)) do
  if not A[i] then
    for j = math.pow(i, 2), f, i do
      A[j] = true
    end
  end
end

-- prime fator
local F, t = {}, n
for i = 2, #A do
  if not A[i] then
    while t % i == 0 do
      F[i] = true
      t = t / i
    end
  end
end

-- find the max prime factor
local maxdiv = 0
for k, _ in pairs(F) do
  if k > maxdiv then
    maxdiv = k
  end
end

print(maxdiv)
