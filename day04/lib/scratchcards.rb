# typed: strict

module Scratchcards
  extend T::Sig

  sig { params(line: String).returns([Integer, T::Set[Integer], T::Set[Integer]]) }
  def self.parse_card(line)
    card, numbers = line.split(": ")
    winning_numbers, numbers_you_have = T.must(numbers).split(" | ")
    [
      T.must(card).split(" ")[1].to_i,
      T.must(winning_numbers).split(" ").map(&:to_i).to_set,
      T.must(numbers_you_have).split(" ").map(&:to_i).to_set
    ]
  end

  sig { params(winning_numbers: T::Set[Integer], numbers_you_have: T::Set[Integer]).returns(Integer) }
  def self.count_matches(winning_numbers, numbers_you_have)
    winning_numbers.intersection(numbers_you_have).count
  end
end
