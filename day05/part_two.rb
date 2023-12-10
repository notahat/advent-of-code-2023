require_relative "lib/map"

input = File.read("input.txt")

sections = input.split("\n\n")

def parse_seeds(section)
  _, seeds = section.split(": ")
  seeds.split(" ").each_slice(2).map do |start, length|
    Range.new(start, start + length, true)
  end
end

def parse_map(section)
  lines = section.split("\n")
  lines.shift

  map = Map.new
  lines.each do |line|
    dest_start, source_start, length = line.split(" ").map(&:to_i)
    map.add_range(dest_start, source_start, length)
  end
  map
end

def map_map_map(maps, value)
  maps.reduce(value) { |value, map| map[value] }
end

seeds = parse_seeds(sections.shift)
maps = sections.map { |section| parse_map(section) }

puts seeds.map { |range| }

# puts seeds.map { |value| map_map_map(maps, value) }.min
