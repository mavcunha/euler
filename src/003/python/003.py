from math import floor, sqrt

t = 600851475143

def isprime(n):
    for i in range(2, n+1//2):
        if n % i == 0:
            return False
    return True

for d in reversed(range(2, floor(sqrt(t)))):
    if t % d == 0 and isprime(d):
        print(d)
        break
