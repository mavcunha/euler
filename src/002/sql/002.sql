WITH fib(prevn, n) AS (
     SELECT 1, 1
     UNION ALL
     SELECT n, prevn + n FROM fib WHERE n < 4000000
  )
SELECT SUM(prevn) FROM fib where prevn % 2 = 0;
