# encoding: utf-8
section_spacer "09. Stuff Ruby Does"

puts "Everything returns to the left."
puts "Everything is an object."
puts "Ruby has blocks."
puts "Because of all these things, we can write map/reduce."

words = ['man', 'dog', 'diamonds', 'girl']

# mapper
counts = words.map do |word|
	word.size
end

# reducer
total = counts.reduce(0) do |sum, value|
	sum + value
end
puts "Total letter count: #{total}."

puts "All in one line --> "
print ['man', 'dog', 'diamonds', 'girl'].map {|word| word.size}.reduce(0) {|sum, value| sum + value }
puts
line

puts "Because everything is an object and Ruby is flexible and liberal ... "
puts "We can patch language classes to do anything we want."

class Object
  # Return a list of methods defined locally for a particular object.  Useful
  # for seeing what it does whilst losing all the guff that's implemented
  # by its parents (eg Object).
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

puts "foo".local_methods.inspect

line
require 'active_support/core_ext'
puts "Rails time helpers"
puts "10.minutes.ago: #{10.minutes.ago}"
puts "1.month.ago: #{1.month.ago}"
puts "Time.now.beginning_of_week: #{Time.now.beginning_of_week}"

require 'active_support/inflector'
puts "Rails string inflection helpers"
puts "'foo'.pluralize: #{'foo'.pluralize}"

# rules defined in I18n.backend
puts "transliterate 'Ærøskøbing': #{ActiveSupport::Inflector.transliterate 'Ærøskøbing'}"


line
puts "Because Ruby has a method called method_missing, we can write DSLs."
puts "--> Check out rename_dsl"
puts "--> Check out dsl_parameterless_*"