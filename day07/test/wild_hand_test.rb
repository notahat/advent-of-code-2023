require "minitest/autorun"
require_relative "../lib/wild_hand"

describe WildHand do
  it "identifies five of a kind" do
    _(WildHand.new("AAAAA").type).must_equal WildHand::FIVE_OF_A_KIND
    _(WildHand.new("AAJAA").type).must_equal WildHand::FIVE_OF_A_KIND
    _(WildHand.new("JJAJJ").type).must_equal WildHand::FIVE_OF_A_KIND
    _(WildHand.new("JJJJJ").type).must_equal WildHand::FIVE_OF_A_KIND
  end

  it "identifies four of a kind" do
    _(WildHand.new("AAAA5").type).must_equal WildHand::FOUR_OF_A_KIND
    _(WildHand.new("AA5AA").type).must_equal WildHand::FOUR_OF_A_KIND
    _(WildHand.new("AA5JJ").type).must_equal WildHand::FOUR_OF_A_KIND
  end

  it "identifies a full house" do
    _(WildHand.new("AAA55").type).must_equal WildHand::FULL_HOUSE
    _(WildHand.new("A5A5A").type).must_equal WildHand::FULL_HOUSE
    _(WildHand.new("A5A5J").type).must_equal WildHand::FULL_HOUSE
  end

  it "identifies three of a kind" do
    _(WildHand.new("AAA53").type).must_equal WildHand::THREE_OF_A_KIND
    _(WildHand.new("AA53A").type).must_equal WildHand::THREE_OF_A_KIND
    _(WildHand.new("AA53J").type).must_equal WildHand::THREE_OF_A_KIND
  end

  it "identifies two pair" do
    _(WildHand.new("AA553").type).must_equal WildHand::TWO_PAIR
    _(WildHand.new("AA355").type).must_equal WildHand::TWO_PAIR
    _(WildHand.new("A535A").type).must_equal WildHand::TWO_PAIR
    _(WildHand.new("2A2KK").type).must_equal WildHand::TWO_PAIR
  end

  it "identifies one pair" do
    _(WildHand.new("AA573").type).must_equal WildHand::ONE_PAIR
    _(WildHand.new("AJ573").type).must_equal WildHand::ONE_PAIR
  end

  it "identifies high card" do
    _(WildHand.new("AKQT3").type).must_equal WildHand::HIGH_CARD
  end
end
