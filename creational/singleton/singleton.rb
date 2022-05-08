class Singleton
  @instance = new

  private_class_method :new

  def self.get_instance
    return @instance
  end
end

obj1 = Singleton.get_instance
obj2 = Singleton.get_instance

if obj1.object_id == obj2.object_id
  puts "Both instances are same"
else
  puts "The instances are different"
end
