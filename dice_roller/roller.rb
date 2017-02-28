class Roller
  attr_reader :dice, :rolls_count

  def initialize(dice, rolls_count)
    @dice = dice
    @rolls_count = rolls_count
  end

  def perform
    result = []
    rolls_count.times do
      result.push(dice.roll)
    end
    result.sort!
    result.pop
    result.shift
    result
  end
end
