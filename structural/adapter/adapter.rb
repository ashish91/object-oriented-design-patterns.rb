class Target

  def request
    "Dispatches request per new standard"
  end

end

class Legacy

  def legacy_request
    "Dispatches Legacy request"
  end
end

class Adapter < Target

  def initialize(legacy)
    @legacy = legacy
  end

  def request
    "Adapter: #{@legacy.legacy_request}"
  end

end

def client_code(target)
  print target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = Target.new
client_code(target)
puts "\n\n"

legacy = Legacy.new
puts 'Client: The Legacy class has a legacy interface.'
puts "Adaptee: #{legacy.legacy_request}"
puts "\n"

puts 'Client: But I can work with it via the Adapter:'
adapter = Adapter.new(legacy)
client_code(adapter)
