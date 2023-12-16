require_relative "lib/map"

input = File.read("input.txt")

sections = input.split("\n\n")

def parse_seeds(section)
  _, seeds = section.split(": ")
  seeds.split(" ").map(&:to_i)
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

puts seeds.map { |value| one_big_map[value] }.min
