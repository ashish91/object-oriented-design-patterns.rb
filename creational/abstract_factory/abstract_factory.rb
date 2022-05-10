class AbstractFactory

  def create_product_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_product_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

class ConcreteFactory1 < AbstractFactory

  def create_product_a
    ConcreteProductAVariant1.new
  end

  def create_product_b
    ConcreteProductBVariant1.new
  end

end

class ConcreteFactory2 < AbstractFactory

  def create_product_a
    ConcreteProductAVariant2.new
  end

  def create_product_b
    ConcreteProductBVariant2.new
  end

end

class AbstractProductA

  def execute_function_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

class ConcreteProductAVariant1 < AbstractProductA

  def execute_function_a
    puts "Executed function of product A with variant 1"
  end

end

class ConcreteProductAVariant2 < AbstractProductA

  def execute_function_a
    puts "Executed function of product A with variant 2"
  end

end

class AbstractProductB

  def execute_function_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

class ConcreteProductBVariant1 < AbstractProductB

  def execute_function_b
    puts "Executed function of product B with variant 1"
  end

end

class ConcreteProductBVariant2 < AbstractProductB

  def execute_function_b
    puts "Executed function of product B with variant 2"
  end

end


puts "Create Factory1"
factory = ConcreteFactory1.new
product_a = factory.create_product_a
product_b = factory.create_product_b

product_a.execute_function_a
product_b.execute_function_b
puts

puts "Create Factory2"
factory = ConcreteFactory2.new
product_a = factory.create_product_a
product_b = factory.create_product_b

product_a.execute_function_a
product_b.execute_function_b
puts
