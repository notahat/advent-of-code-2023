class Map
  HUGE = 2**64

  def initialize
    @boundaries = [0, HUGE]
    @offsets = [0]
  end

  attr_reader :boundaries
  attr_reader :offsets

  def add_range_from_input(dest_start, source_start, length)
    add_range(source_start, source_start + length, dest_start - source_start)
  end

  def add_range(min, max, offset)
    index = @boundaries.bsearch_index { |boundary| boundary > min }
    @boundaries.insert(index, min, max)
    @offsets.insert(index, offset, 0)
  end

  def [](value)
    index = @boundaries.bsearch_index { |boundary| boundary > value }
    value + @offsets[index - 1]
  end

  def each_range(&block)
    if block
      @offsets.each_with_index do |offset, index|
        yield [@boundaries[index], @boundaries[index + 1], offset]
      end
    else
      to_enum(:each_range)
    end
  end

  def each_range_between(min, max)
  end
end

def compose(other)
  c = Map.new

  a.each_range do |a_min, a_hax, a_offset|
    b.each_range_between(a_min + a_offset, a_max + a_offset) do |b_min, b_max, b_offset|
      c.add_range(b_min - offset, b_max - offset, a_offset + b_offset)
    end
  end

  c
end
