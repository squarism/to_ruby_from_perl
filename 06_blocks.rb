section_spacer "06. Blocks"

# it's the iterator variable in a block
[1, 2, 3].each do |temporary_iterator_variable_can_be_named_anything|
	puts temporary_iterator_variable_can_be_named_anything
end

i = 0
# this is a block with no |iterator|
while i < 5 do
	i += 1
end

# Blocks are very, very, very important to learn.
# They will seem weird and stupid.
# You will hate them.
# Then you will love them.

look_i_can_store_a_block = [1,2,3].each
puts look_i_can_store_a_block.class

puts "The each method returns an Enumerator which I can call."
puts look_i_can_store_a_block.next

# single line blocks look like this:
[1, 2, 3].each {|number| print number }
# [1, 2, 3].each <-- each can take a block 
# { <-- starts a block
# |number| <-- our temporary iterator variable
# puts number <-- something to execute inside the block
# } <-- end block

# these are all the same
[1, 2, 3].each {|number| print number }
[1, 2, 3].each { |number|  print number }  # whitespace doesn't matter
[1, 2, 3].each do |number|
	print number
end

# do closes with end
# { closes with }


# ok stay with me.  this is where it gets cool.

# array of hashes
elements = [
  { :color => "blue",  :name => "water" },
  { :color => "red",   :name => "fire" 	},
  { :color => "white", :name => "wind" 	},
  { :color => "green", :name => "earth" },
  { :color => "green", :name => "moss" 	},
  { :color => "white", :name => "snow" 	}
]

# let's find all elements that are green
elements.each do |element|
	if element[:color] == "green"
		puts element
	end
end

# yay?  no.  not yay.
# we can do better.
# .select is a method on array that can take a block.
# whatever is returned true in the block is what select will filter
# back to the left.  Since we had an array of hashes, we'll get an
# array of two things that are green.
puts "one line filtering on array!"
puts elements.select { |element| element[:color] == "green" }

# ok let's filter for anything named earth
puts elements.select { |element| element[:color] == "green" }.select { |element| element[:name] == "earth" }

# whoa.  that's a little ugly.
puts elements.select { |e| e[:color] == "green" && e[:name] == "earth" }
# that's better.

# now let's count up how many of each color we have
puts elements.group_by {|color| color[:color]}.collect {|color| { color[0] => elements.select{|e| e[:color] == color[0]}.count } }

# OMG WTF IS THAT MESS
section_spacer "Sort of getting ahead of ourselves here ..."
puts "this is the group_by"
puts elements.group_by {|color| color[:color]}

# so we go through each one which is organized by color.  color.first is the key (the color by itself)
# we create a new hash like this {"blue" => }
# and the elements.select selects the color that we're on and puts the count in the hash like this:
# { "blue" => 1 }

# a slightly cleaner way to write this is like so:
color_counts = elements.group_by do |element| 
	element[:color]
end
color_counts = color_counts.collect do |color_group|
	color_key = color_group.first
	color_count = elements.select{|e| e[:color] == color_key}.count
	{ color_key => color_count }
end

puts "More readable color_counts"
puts color_counts

# what does collect do?
tests = [1, 2, 3].collect {|number| number > 2}
puts "Numbers greater than two? #{tests}"

# ok a better way for this:
tests = [1, 2, 3].collect do |number|
	{:number => number, :greater_than_two => number > 2}
end

puts "Numbers greater than two?"
puts tests