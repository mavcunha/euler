use MONKEY-TYPING;

augment class Int {
  method even { self % 2 == 0 }
}

sub F(Int $n) {
  return 0 if $n == 0;
  return 1 if $n == 1 | 2;

  my $k = $n.even ?? ($n / 2).floor !! (($n + 1) / 2).floor;

  if $n.even {
    return (2 * F($k - 1) + F($k)) * F($k);
  } else {
    return F($k)**2 + F($k - 1)**2;
  }
}

(gather {
  my $i = 0;
  while (my $f = F(++$i)) < 4_000_000 {
    take $f;
  }
}).grep(*.even).sum.say
