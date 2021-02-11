import java.util.Map;
import java.util.HashMap;

public class fibsum {

  Map<Integer, Integer> memoize = new HashMap<>();

  public static void main(String... args) {
    fibsum fs = new fibsum();

    int i = 0, f = 0, sum = 0;
    do {
      f = fs.fib(i);
      if (f % 2 == 0) {
        sum += f;
      }
      i++;
    } while (f < 4000000);

    System.out.println(sum);

  }

  int fib(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    else {
      if (memoize.containsKey(n)) {
        return memoize.get(n);
      } else {
        memoize.put(n, fib(n - 1) + fib(n - 2));
        return memoize.get(n);
      }
    }
  }
}
