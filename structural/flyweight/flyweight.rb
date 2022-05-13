require 'json'
class Flyweight
  def initialize(shared_state)
    @shared_state = shared_state
  end

  def operation(unique_state)
    s = @shared_state.to_json
    u = unique_state.to_json
    print "Flyweight: Displaying shared (#{s}) and unique (#{u}) state."
  end

end

class FlyweightFactory

  def initialize(initial_flyweights)
    @flyweights = {}
    initial_flyweights.each do |state|
      @flyweights[key(state)] = Flyweight.new(state)
    end
  end

  def key(state)
    state.sort.join('-')
  end

  def flyweight(shared_state)
    key = key(shared_state)
    if @flyweights.key?(key)
      puts 'FlyweightFactory: Reusing existing flyweight.'
    else
      puts "FlyweightFactory: Can't find a flyweight, creating new one."
      @flyweights[key] = Flyweight.new(shared_state)
    end

    @flyweights[key]
  end

  def list
    puts "FlyweightFactory: I have #{@flyweights.size} flyweights:"
    print @flyweights.keys.join("\n")
  end
end

def add_car_to_police_database(factory, plates, owner, brand, model, color)
  puts "\n\nClient: Adding a car to database."
  flyweight = factory.flyweight([brand, model, color])

  flyweight.operation([plates, owner])
end

factory = FlyweightFactory.new([
                                 %w[Chevrolet Camaro2018 pink],
                                 ['Mercedes Benz', 'C300', 'black'],
                                 ['Mercedes Benz', 'C500', 'red'],
                                 %w[BMW M5 red],
                                 %w[BMW X6 white]
                               ])

factory.list

add_car_to_police_database(factory, 'CL234IR', 'James Doe', 'BMW', 'M5', 'red')

add_car_to_police_database(factory, 'CL234IR', 'James Doe', 'BMW', 'X1', 'red')

puts "\n\n"

factory.list
