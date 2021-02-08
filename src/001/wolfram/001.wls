S := Range[2,999]
P := Mod[x,3]==0
Q := Mod[x,5]==0
R = Sum[x*If[P||Q, 1,0],{x,  S}]
Print[R]
