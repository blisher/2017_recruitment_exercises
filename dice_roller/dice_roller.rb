require_relative 'dice.rb'
require_relative 'roller.rb'

# rolls seven times with dice k-20
# rejects maximum and minimum value

dice_k20 = Dice.new(20)
roller = Roller.new(dice_k20, 7)
puts roller.perform.inspect
