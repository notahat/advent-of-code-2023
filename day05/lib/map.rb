class Map
  HUGE = 2**64

  def initialize
    @boundaries = [0, HUGE]
    @offsets = [0]
  end

  attr_reader :boundaries
  attr_reader :offsets

  def ==(other)
    @boundaries == other.boundaries && @offsets == other.offsets
  end

  def add_range_from_input(dest_start, source_start, length)
    add_range(source_start, source_start + length, dest_start - source_start)
  end

  def add_range(min, max, offset)
    index = @boundaries.bsearch_index { |boundary| boundary > min }
    @boundaries.insert(index, min, max)
    @offsets.insert(index, offset, 0)

    # TODO: Rather than deleting afterwards, can I avoid inserting in the first place?

    if @boundaries[index + 1] == @boundaries[index + 2]
      @boundaries.delete_at(index + 1)
      @offsets.delete_at(index + 1)
    end

    if @boundaries[index - 1] == @boundaries[index]
      @boundaries.delete_at(index - 1)
      @offsets.delete_at(index - 1)
    end
  end

  def [](value)
    index = @boundaries.bsearch_index { |boundary| boundary > value }
    value + @offsets[index - 1]
  end

  def each_range
    if block_given?
      @offsets.each_with_index do |offset, index|
        yield [@boundaries[index], @boundaries[index + 1], offset]
      end
    else
      to_enum(:each_range)
    end
  end

  def each_range_between(min, max)
    if block_given?
      low_index = @boundaries.bsearch_index { |boundary| boundary > min }
      high_index = @boundaries.bsearch_index { |boundary| boundary >= max } - 1

      if high_index >= low_index
        yield [min, @boundaries[low_index], @offsets[low_index - 1]]
        (low_index...high_index).each do |index|
          yield [@boundaries[index], @boundaries[index + 1], @offsets[index]]
        end
        yield [@boundaries[high_index], max, @offsets[high_index]]
      else
        yield [min, max, @offsets[low_index - 1]]
      end
    else
      to_enum(:each_range_between, min, max)
    end
  end

  def compose(other)
    result = Map.new

    each_range do |a_min, a_max, a_offset|
      # puts "a: #{a_min}...#{a_max}, #{a_offset}"
      other.each_range_between(a_min + a_offset, a_max + a_offset) do |b_min, b_max, b_offset|
        # puts "b: #{b_min}...#{b_max}, #{b_offset}"
        result.add_range(b_min - a_offset, b_max - a_offset, a_offset + b_offset)
      end
    end

    result
  end
end
