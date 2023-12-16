#!/usr/bin/env ruby

lines = File.read("input.txt").split("\n")

times = lines[0].split(": ").last.split(" ").map(&:to_i)
distances = lines[1].split(": ").last.split(" ").map(&:to_i)

races = times.zip(distances)

def range_of_button_times_that_travel_at_least_the_distance(race_time, distance)
  temp = Math.sqrt(race_time * race_time - 4 * distance)
  lo = (race_time - temp) / 2
  hi = (race_time + temp) / 2
  (lo..hi)
end

def to_integer_range(range)
  (range.begin.ceil..range.end.floor)
end

result = races
  .map { |race_time, distance| range_of_button_times_that_travel_at_least_the_distance(race_time, distance) }
  .map { |range| to_integer_range(range).size }
  .reduce(&:*)

puts result
