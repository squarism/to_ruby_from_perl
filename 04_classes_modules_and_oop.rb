section_spacer "04. Classes and OO"

# Ruby has some.  So you don't have to do fraking Moose::Stuff
# You'll be happy to know that classes and modules are named the same with the colons.
# For example Car::Engine should look familiar.
class Car
  class Engine
  end
end
Car::Engine # yay

# You'll be sad to know that you might have to (re)learn OO.  Unless you
# know Java or C# or something that has real objects in it.  Ruby has
# real classes.
class RubyWeakness < Object
  def to_s
    "single inheritence?"
  end
end

oh_no = RubyWeakness.new
puts "Ruby's weakness is #{oh_no}!"
# no, not really.  because of Mixins

# classes can contain classes (like Car::Engine above)
class Car
  class Engine
    def start
      # start engine
    end
    def stop
      # stop engine
    end
  end

  class Door
    def open
      # etc etc
    end
  end
end

# classes can contain modules
class Car
  module Electrical
  end
end

# remove Car class (just doing this for this huge script)
Object.send(:remove_const, :Car)

# modules can contain classes and modules
module Car
  module Foo
  end
  class Engine
  end
end

# remove Car class (just doing this for this huge script)
Object.send(:remove_const, :Car)

# blah blah blah, so what?
# how the eff do we put this to good use?
# Ok, let's take our car class and add the ability to swap our engine out with # a V6 or a V8.  In Java (or similar) we'd use a huge mess of inheritence and
# hope that it saves us some time.  Some would call this ceremony.
# Java:
# Car has an Engine.
# Engine is an abstract class.
# V6 extends Engine and has V6 specifics in it.
# V8 extends Engine and has V8 specifics in it.
# Ruby:
# Car has an Engine.
# Engine "mixes-in" a module with the appropriate behavior.

module Engine
  module V6
    # we can set attributes on an instance when a module is included
    def self.extended(base)
      base.cylinders = 6
    end

    # we can mixin methods to be used later
    def engine_roar
      "not that impressive."
    end
  end

  module V8
    def self.extended(base)
      base.cylinders = 8
    end

    def engine_roar
      "very impressive!"
    end
  end
end

class Car
  class Engine
    attr_accessor :cylinders

    def initialize engine_type
      @cylinders = 0
      case engine_type
      when "v6"
        self.extend ::Engine::V6
      when "v8"
        self.extend ::Engine::V8
      end
    end

    def start
      puts "Started an engine with #{@cylinders} cylinders!"
      puts "Engine roar is #{engine_roar}"
    end
  end

  def initialize engine_type
    @engine = Car::Engine.new engine_type
  end

  def start
    @engine.start
  end
end

car = Car.new("v6")
car.start
car = Car.new("v8")
car.start
puts

# But please continue to think that we are just sending the classes messages.
# We aren't invoking methods.  We are sending objects messages.
# We send the Car instance a :new message.

section_spacer "So what.  All of this is boring syntax stuff."