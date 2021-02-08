def m(n):
    if n % 3 == 0 or n % 5 == 0:
        return n
    elif n % 15 == 0:
        return -n
    else:
        return 0

sum = 0
for n in range(1,1000):
    sum = sum + m(n)

print(sum)
