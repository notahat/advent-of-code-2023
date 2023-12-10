require "minitest/autorun"
require_relative "../lib/map"

describe Map do
  before do
    @map = Map.new
    @map.add_range(10, 15, 10)
  end

  it "correctly maps numbers around a range" do
    _(@map[9]).must_equal(9)
    _(@map[10]).must_equal(20)
    _(@map[14]).must_equal(24)
    _(@map[15]).must_equal(15)
  end

  it "iteratates over each range" do
    enumerator = @map.each_range
    _(enumerator.next).must_equal([0, 10, 0])
    _(enumerator.next).must_equal([10, 15, 10])
    _(enumerator.next).must_equal([15, Map::HUGE, 0])
    assert_raises StopIteration do
      enumerator.next
    end
  end

  it "iterates over ranges between values" do
    enumerator = @map.each_range_between(5, 20)
    _(enumerator.next).must_equal([5, 10, 0])
    _(enumerator.next).must_equal([10, 15, 10])
    _(enumerator.next).must_equal([15, 20, 0])
    assert_raises StopIteration do
      enumerator.next
    end
  end

  it "composes" do
    _(@map.compose(@map)).must_equal(@map)
  end
end
