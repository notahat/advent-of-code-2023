class WildHand
  include Comparable

  CARD_ORDER = "J23456789TQKA"

  HIGH_CARD = 1
  ONE_PAIR = 2
  TWO_PAIR = 3
  THREE_OF_A_KIND = 4
  FULL_HOUSE = 5
  FOUR_OF_A_KIND = 6
  FIVE_OF_A_KIND = 7

  def initialize(cards, bid = 1)
    @cards = cards
    @bid = bid
  end

  attr_reader :bid

  def type
    return FIVE_OF_A_KIND if @cards == "JJJJJ"

    @type ||= case sorted_cards
    when /(.)\1\1\1\1/
      FIVE_OF_A_KIND
    when /(.)\1\1\1/
      FOUR_OF_A_KIND
    when /(.)\1\1(.)\2/, /(.)\1(.)\2\2/
      FULL_HOUSE
    when /(.)\1\1/
      THREE_OF_A_KIND
    when /(.)\1.*(.)\2/
      TWO_PAIR
    when /(.)\1/
      ONE_PAIR
    else
      HIGH_CARD
    end
  end

  def sorted_cards
    @sorted_card ||= cards_with_wilds_replaced.split("").sort.join
  end

  def <=>(other)
    type_order = type <=> other.type
    (type_order != 0) ? type_order : card_values <=> other.card_values
  end

  def card_values
    @card_values ||= @cards
      .split("")
      .map { |card| CARD_ORDER.index(card) }
  end

  def cards_with_wilds_replaced
    @cards_with_wilds_replaced ||= @cards.gsub("J", most_common_card)
  end

  def most_common_card
    cards_without_wilds = @cards.delete("J")
    card_frequency = Hash.new(0)
    cards_without_wilds.each_char { |card| card_frequency[card] += 1 }
    card_frequency.max_by { |card, count| count }.first
  end
end
