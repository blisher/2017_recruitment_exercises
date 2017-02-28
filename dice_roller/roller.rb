class Roller
  attr_reader :dice, :rolls_count
  attr_writer :reject_method, :force_additional_roll

  def initialize(dice, rolls_count, reject_method = :reject_minmax)
    @dice = dice
    @rolls_count = rolls_count
    @reject_method = reject_method
  end

  def perform
    result = []
    rolls_count.times do
      result.push(dice.roll)
    end
    result.sort!
    send(@reject_method, result)
    result.push(@force_additional_roll || dice.roll)
    result
  end

  private

  def reject_minmax(result)
    result.pop
    result.shift
  end

  def reject_two_smallest(result)
    result.shift(2)
  end
end
