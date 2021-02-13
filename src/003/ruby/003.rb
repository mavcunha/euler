require "Prime"

target=600851475143

p (1..Math.sqrt(target)).select { |n|
  target % n == 0 and Prime.prime?(n) }.max
