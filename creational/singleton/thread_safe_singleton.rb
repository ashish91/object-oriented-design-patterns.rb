$object_ids = []

class Singleton
  @mutex = Mutex.new

  private_class_method :new

  def self.get_instance
    return @instance if @instance

    @mutex.synchronize do
      if @instance.nil?
        @instance = new
      end
    end

    @instance
  end
end

def test_singleton
  instance = Singleton.get_instance
  $object_ids.append(instance.object_id)
end

thread1 = Thread.new { test_singleton }
thread2 = Thread.new { test_singleton  }

thread1.join
thread2.join

if $object_ids.length == 2 && $object_ids[0] == $object_ids[1]
  puts "Both instances are same"
else
  puts "The instances are different"
end
