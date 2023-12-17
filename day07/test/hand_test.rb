require "minitest/autorun"
require_relative "../lib/hand"

describe Hand do
  it "identifies five of a kind" do
    _(Hand.new("AAAAA").type).must_equal Hand::FIVE_OF_A_KIND
  end

  it "identifies four of a kind" do
    _(Hand.new("AAAA5").type).must_equal Hand::FOUR_OF_A_KIND
    _(Hand.new("AA5AA").type).must_equal Hand::FOUR_OF_A_KIND
  end

  it "identifies a full house" do
    _(Hand.new("AAA55").type).must_equal Hand::FULL_HOUSE
    _(Hand.new("A5A5A").type).must_equal Hand::FULL_HOUSE
  end

  it "identifies three of a kind" do
    _(Hand.new("AAA53").type).must_equal Hand::THREE_OF_A_KIND
    _(Hand.new("AA53A").type).must_equal Hand::THREE_OF_A_KIND
  end

  it "identifies two pair" do
    _(Hand.new("AA553").type).must_equal Hand::TWO_PAIR
    _(Hand.new("AA355").type).must_equal Hand::TWO_PAIR
    _(Hand.new("A535A").type).must_equal Hand::TWO_PAIR
    _(Hand.new("2A2JJ").type).must_equal Hand::TWO_PAIR
  end

  it "identifies one pair" do
    _(Hand.new("AA573").type).must_equal Hand::ONE_PAIR
  end

  it "identifies high card" do
    _(Hand.new("AKQT3").type).must_equal Hand::HIGH_CARD
  end
end
