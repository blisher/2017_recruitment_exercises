class Car
  COLORS = {
    black: 'Black',
    red: 'Red',
    yellow: 'Yellow',
    navy_blue: 'Navy Blue'
  }

  AVAILABLE_COLORS = %i(black red yellow)
  @@last_color_index = 0

  BRANDS = {
    lancia: 'Lancia',
    fiat: 'Fiat',
    subaru: 'Subaru'
  }

  attr_reader :brand, :color_name

  def initialize(brand, options = {})
    @brand = BRANDS[brand]
    @color_name = COLORS[options[:color]] || Car.generate_color
  end

  def self.generate_color
    result = COLORS[AVAILABLE_COLORS[@@last_color_index]]
    @@last_color_index = (@@last_color_index + 1) % AVAILABLE_COLORS.length
    result
  end
end
