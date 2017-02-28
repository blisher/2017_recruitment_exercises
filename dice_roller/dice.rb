class Dice
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll
    Random.rand(sides) + 1
  end
end
