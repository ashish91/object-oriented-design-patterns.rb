class Component

  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

class ConcreteComponent

  def operation
    "ConcreteComponent"
  end

end

class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def operation
    @component.operation
  end

end

class ConcreateDecoratorA < Decorator

  def operation
    "ConcreateDecoratorA(#{@component.operation})"
  end

end

class ConcreateDecoratorB < Decorator

  def operation
    "ConcreateDecoratorB(#{@component.operation})"
  end

end


def client_code(component)
  print "RESULT: #{component.operation}"
end

simple = ConcreteComponent.new
puts "Client: Simple component:"
client_code(simple)
puts "\n\n"

# Decorator acts as streams, one decorator can be used by another
decorator1 = ConcreateDecoratorA.new(simple)
decorator2 = ConcreateDecoratorB.new(decorator1)
puts "Client: Decorated component:"
client_code(decorator2)
