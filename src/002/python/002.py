import functools

# recursive solution but
# using memoization with lru_cache()

@functools.lru_cache()
def fib(n):
    if n in (0, 1):
        return 1
    else:
        return fib(n-1) + fib(n-2)

c,f,s=0,0,0
while f < 4000000:
    f=fib(c)
    c += 1
    if (f % 2) == 0:
        s += f

print(s)
