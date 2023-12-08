# typed: strict

require "sorbet-runtime"
require_relative "lib/scratchcards"

copies = T.let([], T::Array[Integer])
card_count = 0

File.readlines("input.txt").each do |line|
  card_number, winning_numbers, numbers_you_have = Scratchcards.parse_card(line)
  match_count = Scratchcards.count_matches(winning_numbers, numbers_you_have)

  card_number -= 1

  copies[card_number] = (copies[card_number] || 0) + 1

  ((card_number + 1)..(card_number + match_count)).each do |i|
    copies[i] = (copies[i] || 0) + T.must(copies[card_number])
  end

  card_count += 1
end

p T.must(copies[0, card_count]).sum
