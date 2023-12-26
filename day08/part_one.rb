#!/usr/bin/env ruby

require_relative "lib/network"

input = File.read("input.txt")
directions, network_input = input.split("\n\n")
network = Network.new(network_input.split("\n"))

step_count = 0
current_node = "AAA"

directions.split("").cycle do |direction|
  current_node = network.navigate(current_node, direction)
  step_count += 1
  break if current_node == "ZZZ"
end

puts step_count
