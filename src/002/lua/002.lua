-- non-recursive solution
function fib(n)
  f = {}
  f[0], f[1] = 1, 1
  for i = 2, n do
    f[i] = f[i - 1] + f[i - 2]
  end
  return f[n]
end

local i, sum, f = 0, 0, 0

while f < 4000000 do
  f = fib(i)
  if f % 2 == 0 then
    sum = sum + f
  end
  i = i + 1
end

print(sum)
