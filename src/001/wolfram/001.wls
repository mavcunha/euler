Print[
  Total[
    Select[Range[1000],
      Divisible[#, 3] || Divisible[#, 5] &]
  ]
]
