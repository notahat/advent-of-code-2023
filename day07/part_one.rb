#!/usr/bin/env ruby

require_relative "lib/hand"

hands = File.readlines("input.txt").map do |line|
  cards, bid = line.split(" ")
  Hand.new(cards, bid.to_i)
end

result = hands
  .sort
  .each_with_index.map { |hand, index| (index + 1) * hand.bid }
  .sum

puts result
