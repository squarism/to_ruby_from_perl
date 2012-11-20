section_spacer "02. Conditionals"

if true
  # true
end

x = 'tacos'
case x
when 'tacos'
  print "i love tacos.\n";
when 'milk'
  # it's too hot for milk
else
  # fallthrough
end

# ugh.  so aren't you sick of typing ;;;;;;;;;;;;;; all the time
# what about "\n"
print 'this is a string has no new line automatically.\n';
print "but just like perl, single quotes won't interpolate.\n"
puts "puts is print with a new line.";
puts "also, STOP PUTTING SEMICOLONS EVERYWHERE!  WE ARE SAVED FROM THIS:"
puts "Execution of to_ruby_from_perl.pl aborted due to compilation errors."
# if you need things on one line you can use semicolons
if true; else; end

puts # just a blank line, like print "\n"
puts "Variable interpolation in Ruby is kind of uglier than Perl."
puts 'Like x: #{x}. in Perl would be x: $x'
puts "Double quotes allows interpolation.  X is set to #{x}."
# some editors are smart enough to put #{} around a variable when in a "" string.

# overall, the lack of $variables make the code cleaner, despite having to #{}
# escape variables in strings.

puts "There's another way to concat variables and strings."
puts "Like this: " << x
# << is the append operator, it's sort of like shift in Perl