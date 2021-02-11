class Fibsum
  attr_accessor :mfib

  def initialize()
    self.mfib = {}
    (self.mfib[0], self.mfib[1]) = [1, 1]
  end

  def fib(n)
    mfib[n] ||= begin
     mfib[n] = self.fib(n-1) + self.fib(n-2)
    end
  end

end

fs = Fibsum.new
sum, i = 0, 0
loop do
  f = fs.fib(i)
  sum += f if f.even?
  break if f > 4000000
  i += 1
end

puts sum
