constant TARGET = 999;

sub sum_div ($n) {
  my $p = floor(TARGET / $n);
  $n * ($p * ($p + 1)) / 2
}

put sum_div(3) + sum_div(5) - sum_div(15);
