class Mitaka
  def method1
    a = 1
    @b = 2
    puts a+@b
  end

  def method2
    a = 2
    puts a+@b
  end
end

c = Mitaka.new
c.method1
c.method2
