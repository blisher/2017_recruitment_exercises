require_relative 'car'

class CarFactory
  AVAILABLE_BRANDS = %i(fiat lancia ford subaru)

  def initialize(name, options = {})
    @name = name
    @brands = [options[:brands]].flatten
    not_supported_brands = @brands - AVAILABLE_BRANDS
    if not_supported_brands.any?
      bad_brand = not_supported_brands.first.capitalize
      raise UnsupportedBrandException.new("Brand not supported: '#{bad_brand}'")
    end
  end

  def name
    "#{@name} (produces #{@brands.map(&:to_s).map(&:capitalize).join(', ')})"
  end

  def make_car(brand = nil)
    if @brands.count > 1
      if @brands.include?(brand)
        car = Car.new(brand)
      else
        raise UnsupportedBrandException.new('Factory does not have a brand or do not support it')
      end
    else
      car = Car.new(brand || @brands.first)
    end
  end

  def make_cars(arg)
    method_name = arg.is_a?(Hash) ? :create_with_hash : :create_with_counter
    send(method_name, arg)
  end

  class UnsupportedBrandException < StandardError; end

  private

  def create_with_hash(hash)
    result = []
    hash.each do |brand, count|
      break unless @brands.include?(brand)
      count.times do
        result.push(make_car(brand))
      end
    end
    result
  end

  def create_with_counter(counter)
    index = 0
    result = []
    counter.times do
      result.push(Car.new(@brands[index]))
      index = (index + 1) % @brands.count
    end
    result
  end
end
