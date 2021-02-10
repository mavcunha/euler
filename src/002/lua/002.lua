function fib(n)
  if n == 0 or n == 1 then
    return 1
  else
    return fib(n - 1) + fib(n - 2)
  end
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
