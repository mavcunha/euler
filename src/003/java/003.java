import java.math.*;
import java.util.stream.*;

public class PrimeFactors {
  public static void main(String... args) {

    long target = 600851475143l;

    Long l = LongStream
      .range(1, (long) Math.floor(Math.sqrt(target)))
      .filter(i -> BigInteger.valueOf(i).isProbablePrime(5))
      .filter(i -> target % i == 0)
      .max()
      .orElse(0);

    System.out.println(l);

  }
}
