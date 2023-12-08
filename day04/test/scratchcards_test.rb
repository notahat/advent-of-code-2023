# typed: strict

require "sorbet-runtime"
require "minitest/spec"
require "scratchcards"

describe Scratchcards do
  describe ".parse_line" do
    before do
      @line = T.let("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53", String)
    end

    it "extracts all the numbers" do
      card_number, winning_numbers, numbers_you_have = Scratchcards.parse_card(@line)
      _(card_number).must_equal 1
      _(winning_numbers).must_equal Set[41, 48, 83, 86, 17]
      _(numbers_you_have).must_equal Set[83, 86, 6, 31, 17, 9, 48, 53]
    end
  end

  describe ".count_matches" do
    before do
      @winning_numbers = T.let(Set[41, 48, 83, 86, 17], T::Set[Integer])
      @numbers_you_have = T.let(Set[83, 86, 6, 31, 17, 9, 48, 53], T::Set[Integer])
    end

    it "correctly counts the matches" do
      _(Scratchcards.count_matches(@winning_numbers, @numbers_you_have)).must_equal 4
    end
  end
end
