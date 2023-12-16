require_relative "lib/map"

input = File.read("input.txt")

sections = input.split("\n\n")

def parse_seeds(section)
  _, seeds = section.split(": ")
  seeds.split(" ").each_slice(2).map do |start, length|
    [start.to_i, start.to_i + length.to_i]
  end
end

def parse_map(section)
  lines = section.split("\n")
  lines.shift

  map = Map.new
  lines.each do |line|
    dest_start, source_start, length = line.split(" ").map(&:to_i)
    map.add_range_from_input(dest_start, source_start, length)
  end
  map
end

seeds = parse_seeds(sections.shift)
maps = sections.map { |section| parse_map(section) }

one_big_map = maps.reduce(:compose)

lowest = seeds
  .map { |min, max| one_big_map.lowest(min, max) }
  .min

puts lowest
