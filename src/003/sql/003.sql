with
-- sqrt newtown approximation
sqrt_approx(g, x, c) as (
  select 1000, 600851475143, 600851475143
  union all
  select x, ((c/g) + g)/2, c from sqrt_approx limit 1000
),
-- simple counter 2, 3, 4, 5 ...
counter(n) as (
  select 2
  union
  select n + 1 from counter where n <
  -- max counter since primes factor must be p < sqrt(x)
    (select x from sqrt_approx group by x, g having x == g)
),
-- find primes
primes(p) as (
  select c1.n as prime
  from counter c1
  where not exists
    (select 1 from counter c2
      where c2.n < c1.n AND c1.n % c2.n = 0)
)
select max(p) from primes
  where p < (select x from sqrt_approx group by x, g having x == g)
  and 600851475143 % p == 0;
