require_relative 'dice.rb'
require_relative 'roller.rb'

# rolls dice k-30 once before, and
# if it returns (1..7), then rolls k-30 once again,
# and if it returns 1, then not minmax is rejected, but 2 smallest numbers

dice_k30 = Dice.new(30)
dice_k20 = Dice.new(20)
reject_method = if (1..7).include?(dice_k30.roll) && dice_k30.roll == 1
                  puts 'TWO SMALLEST'
                  :reject_two_smallest
                else
                  puts 'MIN MAX'
                  :reject_minmax
                end



roller = Roller.new(dice_k20, 7, reject_method)

puts roller.perform.inspect
