require_relative 'dice.rb'
require_relative 'roller.rb'

# rolls dice k-30 once before, and
# if it returns (1..7), then rolls k-30 once again,
# and if it returns 1, then not minmax is rejected, but 2 smallest numbers

# moreover, if initial roll returns (24..30) then additional roll
# after array contains 5 numbers is always 25

dice_k30 = Dice.new(30)
dice_k20 = Dice.new(20)
roller = Roller.new(dice_k20, 7)
initial_k30_roll_result = dice_k30.roll

if (24..30).include?(initial_k30_roll_result)
  roller.force_additional_roll = 25
elsif (1..7).include?(initial_k30_roll_result) && dice_k30.roll == 1
  roller.reject_method = :reject_two_smallest
end

puts roller.perform.inspect
