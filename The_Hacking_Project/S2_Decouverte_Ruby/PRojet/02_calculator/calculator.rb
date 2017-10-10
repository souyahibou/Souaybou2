#write your code here


def add(a, b)
  a+b

end

def subtract(a, b)
  a-b

end

def sum(a)
    res = 0
    a.each { |i| res += i }
    res

end

def multiply(a)
    res = 1
    a.each { |i| res *= i }
    res
end

def product(array)
  final = 0.0
  array.each do |i|
    final *= i
  end
  return final
end


def power(a, b)
  a**b
end

def factorial(a)
  res = 1
  unless a == 0
    for i in 1..a
      res *= i
    end
  end
  return res.abs
end

puts sum([1,2,3,4]);
puts multiply([5,4,8]);
puts power(3,3);
puts factorial(10);
puts factorial(1);
puts factorial(0);
