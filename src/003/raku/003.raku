# this is really nice
my @primes = grep {.is-prime }, 1..*;

sub prime-factors (UInt $num-in) {
  my @factors;
  my $num = $num-in;

  # this is similar to the lua solution
  for @primes -> $div {
    while ($num %% $div) {
      push @factors, $div;
      $num div= $div;
    }
    return @factors if $num == 1;
  }
  return @factors;
}

say prime-factors(600851475143).max;
