Print[
  Total[
    Select[
      TakeWhile[
        Table[Fibonacci[n], {n, 100}], # < 4000000 &], EvenQ]]]
