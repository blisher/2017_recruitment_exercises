class CarPark
  attr_reader :capacity, :cars

  def initialize(capacity)
    @cars = []
    @capacity = capacity
  end

  def receive(arg)
    if arg.is_a?(Array)
      @cars.push(*arg[0...places_left])
    else
      @cars.push(arg) if places_left.nonzero?
    end
  end

  def retrieve(count)
    @cars.pop(count)
  end

  def brands
    @cars.map(&:brand).uniq
  end

  def brands_stats
    @cars.each_with_object(Hash.new(0)) { |car, acc| acc[car.brand] += 1 }
  end

  def places_left
    @capacity - @cars.count
  end
end
