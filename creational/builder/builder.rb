class Builder
  def set_part_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def set_part_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def set_part_c
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteBuilder < Builder

  def initialize
    reset
  end

  def reset
    @product = Product.new
  end

  def product
    _product = @product
    reset
    _product
  end

  def set_part_a
    @product.add('Part A')
  end

  def set_part_b
    @product.add('Part B')
  end

  def set_part_c
    @product.add('Part C')
  end

end

class Product

  def initialize
    @parts = []
  end

  def add(part)
    @parts.append(part)
  end

  def list_parts
    print "Product parts: #{@parts.join(', ')}"
 end

end

class Director
  attr_accessor :builder

  def initialize
    @builder = nil
  end

  def builder=(builder)
    @builder = builder
  end

  def build_mvp
    @builder.set_part_a
  end

  def build_feature
    @builder.set_part_a
    @builder.set_part_b
    @builder.set_part_c
  end
end

director = Director.new
builder = ConcreteBuilder.new
director.builder = builder

puts "MVP product:"
director.build_mvp
builder.product.list_parts
puts "\n\n"

puts "Full featured product:"
director.build_feature
builder.product.list_parts
puts "\n\n"

puts "Custom product:"
builder.set_part_b
builder.set_part_c
builder.product.list_parts
puts "\n\n"
