require "minitest/autorun"
require "cubes"

describe Cubes do
  describe ".parse_game" do
    before do
      @line = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
    end

    it "pulls out the game ID" do
      game = Cubes.parse_game(@line)
      _(game[:id]).must_equal 4
    end

    it "pulls out the right number of handfuls" do
      game = Cubes.parse_game(@line)
      _(game[:handfuls].count).must_equal 3
    end

    it "gets the first handful right" do
      game = Cubes.parse_game(@line)
      _(game[:handfuls][0]).must_equal(green: 1, red: 3, blue: 6)
    end
  end

  describe ".fewest_cubes" do
    before do
      @handfuls = [{green: 1, red: 3, blue: 6}, {green: 3, red: 6}, {green: 3, blue: 15, red: 14}]
    end

    it "gives the right answer" do
      _(Cubes.fewest_cubes(@handfuls)).must_equal({
        red: 14,
        green: 3,
        blue: 15
      })
    end
  end
end
