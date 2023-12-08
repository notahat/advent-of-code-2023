module Cubes
  def self.parse_game(line)
    game, handfuls = line.split(": ")
    game_id = game.match(/\d+/).to_s.to_i

    handfuls = handfuls.split("; ")

    handfuls = handfuls.map do |handful|
      cubes = handful.split(", ")

      cubes = cubes.map do |cube|
        count, colour = cube.split(" ")
        [colour.to_sym, count.to_i]
      end

      Hash[cubes]
    end

    {
      id: game_id,
      handfuls: handfuls
    }
  end

  def self.handful_possible?(all_cubes, handful)
    handful.keys.all? do |colour|
      all_cubes[colour] >= handful[colour]
    end
  end

  def self.game_possible?(all_cubes, handfuls)
    handfuls.all? { |handful| handful_possible?(all_cubes, handful) }
  end

  def self.fewest_cubes(handfuls)
    cubes = [:red, :green, :blue].map do |colour|
      maximum_count = handfuls
        .map { |handful| handful[colour] }
        .compact
        .max
      [colour, maximum_count]
    end

    Hash[cubes]
  end

  def self.power(cubes)
    cubes.values.inject(1, :*)
  end
end
