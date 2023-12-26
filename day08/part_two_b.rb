#!/usr/bin/env ruby

def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

def lcm(a, b)
  (a * b) / gcd(a, b)
end

cycles = [17621, 18673, 20777, 12361, 19199, 16043]

steps = cycles.reduce { |steps, cycle| lcm(steps, cycle) }

puts steps
