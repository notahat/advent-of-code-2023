require "calibrate"

describe Calibrate do
  describe ".first_digit" do
    it "handles a numeral at the start of the line" do
      _(Calibrate.first_digit("123")).must_equal 1
    end

    it "handles a numeral in the midle of the line" do
      _(Calibrate.first_digit("xy123")).must_equal 1
    end

    it "handles a word at the start of the line" do
      _(Calibrate.first_digit("one23")).must_equal 1
    end

    it "handles a word in the middle fo the line" do
      _(Calibrate.first_digit("xyone23")).must_equal 1
    end
  end

  describe ".last_digit" do
    it "picks out the last digit on the line" do
      _(Calibrate.last_digit("12three4fivexyz")).must_equal 5
    end
  end
end
