module Calibrate
  DIGITS = {
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9
  }

  MATCH_DIGITS = Regexp.union(DIGITS.keys)

  def self.first_digit(line)
    /(#{MATCH_DIGITS})/o =~ line
    DIGITS[$1]
  end

  def self.last_digit(line)
    /.*(#{MATCH_DIGITS})/o =~ line
    DIGITS[$1]
  end

  def self.line_value(line)
    first = first_digit(line)
    last = last_digit(line)
    "#{first}#{last}".to_i
  end
end
