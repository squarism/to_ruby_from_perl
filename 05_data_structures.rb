section_spacer "05. Data structures"

# This is the part that I miss the most when working with other languages.
# Ruby has the same data structures as Perl or Python but when combined
# with blocks, it's really great.

# So first, let's talk about basic structures.

array = [1, 2, 3]  # perl uses (1,2,3)
puts "First element in array: #{array[0]}"
# there's no switching of @ and $ symbols as there is in perl.
# @ and $ in Ruby means scope, not variable class or type
# $ruby_global = 1              (please don't use)
# @ruby_instance_variable = 1   (use inside classes)
# plain_old_variable = 1        (see section on scope)

# hashes are defined with {}
# arrays are defined with []
# the hashrocket => is the same as perl
hash = { "key" => "value" }
# usually hashes use symbols for keys:
hash = { :key => "value" }
puts hash[:key]

# more examples
hash = { :fire => "red", :water => "blue" }

# Whitespace in Ruby doesn't matter like in Python.
# But then Python doesn't have a bunch of end statements.
hash = {
  :fire => "red",
  :water => "blue",
  :air => "green",
  :earth => "brown",
}

# Ok we have our data structure, hash.  We could print
# out what messages/methods it will respond to.
# toss an inspect on the end to make it more readable
puts hash.public_methods.inspect

# Whoa, that's a lot of methods!  Why is that?
puts hash.class

# Because hash is a Class.  If you read the ruby docs on
# Hash, you'll see them all listed and described.
# http://www.ruby-doc.org/core-1.9.3/Hash.html

# But we really don't care what the class is!  We just want
# keys or to do an "each element" kind of thing.  So this is what's
# called duck typing.

# Let's loop through them.
hash.keys.each do |key|
  puts "key: #{key}  value: #{hash[key]}"
end

# Okay, WTF is up with the |key| stuff?!

