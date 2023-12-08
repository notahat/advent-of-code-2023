# typed: strict

require "sorbet-runtime"
require_relative "lib/scratchcards"

result = File.readlines("input.txt")
  .map { |line| Scratchcards.parse_card(line) }
  .map { |_, winning_numbers, numbers_you_have| Scratchcards.count_matches(winning_numbers, numbers_you_have) }
  .map { |match_count| (match_count > 0) ? 2**(match_count - 1) : 0 }
  .sum

p result
