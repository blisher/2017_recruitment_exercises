class Roller
  attr_reader :dice, :rolls_count

  def initialize(dice, rolls_count, reject_method)
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
    puts "rolled: #{result.inspect}"
    send(@reject_method, result)
    puts "after reject: #{result.inspect}"
    result.push(dice.roll)
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
