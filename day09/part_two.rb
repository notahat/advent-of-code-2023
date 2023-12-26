#!/usr/bin/env ruby

def extrapolate(values)
  return 0 if values.all? { |value| value == 0 }

  differences = values.each_cons(2).map { |a, b| b - a }
  values.first - extrapolate(differences)
end

values = File.readlines("input.txt").map do |line|
  history = line.split(" ").map(&:to_i)
  extrapolate(history)
end

puts values.sum
