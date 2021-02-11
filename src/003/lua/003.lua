local n = 100
local A = {}

for i = 2, n do
  A[i] = true
end

for i=2, math.floor(math.sqrt(n)) do
  if A[i] then
    for j = math.pow(i, 2), n, i do
      A[j] = false
    end
  end
end

for i = 2, #A do
  if A[i] then
    print(i)
  end
end

