#!/usr/bin/env ruby

require_relative "lib/network"

input = File.read("input.txt")
directions, network_input = input.split("\n\n")
network = Network.new(network_input.split("\n"))

step_count = 0
last_count = 0

network.starting_nodes.each do |starting_node|
  p starting_node

  i = directions.split("").cycle
  node = starting_node

  2.times do
    step_count = 0
    i.each do |direction|
      node = network.navigate(node, direction)
      step_count += 1
      break if node.end_with?("Z")
    end
    p step_count
  end
end
