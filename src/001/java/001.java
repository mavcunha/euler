public class multi {
  private final int target = 999;

  public static void main(String... args) {
    multi m = new multi();

    System.out.println(m.sumDiv(3) + m.sumDiv(5) - m.sumDiv(15));
  }

  private double sumDiv(int n) {
    final double p = Math.floor(this.target / n);
    return  n * (p * (p + 1)) / 2;
  }
}
