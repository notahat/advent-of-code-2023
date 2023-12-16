#!/usr/bin/env ruby

lines = File.read("input.txt").split("\n")

race_time = lines[0].split(": ").last.split(" ").join.to_i
distance = lines[1].split(": ").last.split(" ").join.to_i

def range_of_button_times_that_travel_at_least_the_distance(race_time, distance)
  temp = Math.sqrt(race_time * race_time - 4 * distance)
  lo = (race_time - temp) / 2
  hi = (race_time + temp) / 2
  (lo..hi)
end

def to_integer_range(range)
  (range.begin.ceil..range.end.floor)
end

range = range_of_button_times_that_travel_at_least_the_distance(race_time, distance)
result = to_integer_range(range).size

puts result
